---
title:       使用selenium下载eplus直播存档视频
description: 
date:        2021-08-05
mathjax:     false
categories:
    - 技术
tags:
    - 技术
---

近日看了少歌#3的线上配信，想把留档的视频文件保存下来方便日后再演，奈何家里的宽带实在拉胯，录屏是没可能了，于是只能想办法把视频文件爬下来。

Eplus的反爬措施比较严格，每次建立会话时会生成两个key放在请求的cookie里，另外每隔一段时间会话的key就会失效，因此手动复制cookie的方法也不可行。无力分析混淆js代码的我最终还是选择了笨方法——直接用selenium下载。

![](selenium-yyds.png)

在开始下载之前，我们还需要做一些准备工作：

## 视频作为流媒体

和众多流媒体平台一样，eplus传输视频文件的方式是将整个视频分割成多个小片段，加载视频时不断从服务器下载这些片段文件。片段文件的后缀名为ts，在这里就是一些长度只有几秒的短视频。所有这些片段文件的路径被存储在一个m3u8文件中。因此，我们首先需要找到网站加载视频所使用的m3u8文件：

![](all-m3u8.png)

使用F12开发者工具查看网站发出的网络请求，并筛选出所有m3u8文件，可以看到这里有不止一个文件。查看第一个m3u8文件的内容，发现其记录的是不同清晰度的m3u8文件的路径。为了保存用自然是要下载清晰度最高的1080p，查看下面对1080p的m3u8的请求。由于是get，直接把url复制出来新开个标签页就可以下载了。

![](1080p-m3u8.png)

保存下来m3u8文件之后可以看到里面存储的ts文件的路径都是相对路径，为了找到下载的url，再在开发者工具中查看对ts文件的请求，把url复制下来即可。

![](all-ts.png)

## 下载ts文件并拼接

这一部分比较简单（selenium做了所有复杂的部分），因为eplus回放甚至连登陆都不需要，只需要请求播放url后再挨个get每个ts文件的地址就可以了。不过缺点在于由于eplus不支持同时建立多个连接，因此没法进行多进程下载。另外需要说明的是我下载的时候隔一段时间就会报timeout的错，不知道是网络问题还是反爬虫机制的作用。好在分段传输方式天然地支持了断点续传，因此只需要重启一下就可以了，我们一直以来的努力不会全部木大。

这一部分的代码在下面：

``` python
import os
from time import sleep
from tqdm import tqdm

from selenium import webdriver
from ffmpy import FFmpeg

from typing import Iterable


def parse_m3u8(filename):
    ts_paths = []
    with open(filename) as f:
        for line in f.readlines():
            line = line.strip()
            if line.endswith('.ts'):
                ts_paths.append(line)
    return ts_paths


def download_ts(driver: webdriver.Chrome, ts_path: str, download_dir: str = '.'):
    path = os.path.join(download_dir, ts_path)
    if os.path.exists(path):
        return False
    driver.get(f'{ts_host_url.rstrip("/")}/{ts_path}')
    return True


def ep_download_all(download_dir: str):
    options = webdriver.ChromeOptions()
    prefs = {'profile.default_content_settings.popups': 0,
            'download.default_directory': os.path.abspath(download_dir)}  # 将chrome driver的默认下载地址设定为download_dir
    options.add_experimental_option('prefs', prefs)
    # options.add_argument('--headless')    # 不显示图形界面
    options.add_argument("--disable-web-security")
    options.add_argument("--disable-site-isolation-trials")

    driver = webdriver.Chrome(
        executable_path='chromedriver.exe', chrome_options=options)
    driver.get(view_url)

    counter = 0
    for path in tqdm(ts_paths, desc='download progress'):
        if download_ts(driver, path, download_dir):
            counter += 1
        if counter == 30:
            sleep(30)
            counter = 0

    driver.quit()


def merge_binary_files(files: Iterable[str], outfile: str):
    with open(outfile, 'wb') as outf:
        for file in tqdm(files, desc='merge progress'):
            with open(file, 'rb') as f:
                outf.write(f.read())


outdir = 'ts_video'
if not os.path.exists(outdir):
    os.mkdir(outdir)

m3u8_path = 'index_4.m3u8'
out_name = 'total'

ts_paths = parse_m3u8(m3u8_path)
view_url = 'https://live.eplus.jp/ex/player?ib=xxx'    # eplus的视听url
ts_host_url = 'https://vod.live.eplus.jp/out/v1/xxx/'  # 下载ts文件的url


while True:
    try:
        ep_download_all(outdir)
        break
    except Exception as e:
        print(f'Exception {e} occured, restarting...')
        for f in filter(lambda s: s.endswith('.crdownload'), os.listdir(outdir)):
            os.remove(os.path.join(outdir, f))  # 删除chrome临时下载文件
        sleep(100)

print('download complete, start merging...')
merge_binary_files([os.path.join(outdir, ts) for ts in ts_paths], f'{out_name}.ts')

print('converting merged ts file to mp4...')
ff = FFmpeg(
    inputs={f'{out_name}.ts': None},
    outputs={f'{out_name}.mp4': '-vcodec copy -acodec copy'},
    global_options='-hide_banner'
)
ff.run()

print('convertion complete, clearing ts files...')
os.remove(f'{out_name}.ts')
for ts in ts_paths:
    os.remove(os.path.join(outdir, ts))
try:
    os.removedirs(outdir)
except OSError:
    pass  # 目录不空，即存在下载的ts文件之外的文件，不删除
```

23.9.24更新：这段代码在下载完成全部ts文件后会自动将拼接成整个文件，转码成MP4格式并删除临时文件和目录。