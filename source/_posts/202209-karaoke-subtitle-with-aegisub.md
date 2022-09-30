---
title: 用Aegisub制作卡拉OK字幕
description: 使用Aegisub内置的卡拉OK字幕模板渲染器，生成经典的双行字幕效果
date: 2022-09-30
categories:
    - 技术
tags:
    - 技术
---

Aegisub对制作卡拉OK字幕——包括打K轴和自定义卡拉OK字幕样式——提供了原生的支持，但网络上几乎没有经典的上下两行、由纯色覆盖唱过的部分的模板，反而都是特效模板。我搜索到了B站上的视频[BV1CZ4y1s7br](https://www.bilibili.com/video/BV1CZ4y1s7br)和同up主发表的[专栏](https://www.bilibili.com/read/cv4489963)，从中获取了双行字幕样式的模板，并进行了一些小改动，修复了存在假名标注时的错误行为，使其可以适应歌词时间重叠的情况，并允许对覆盖色进行自定义设置。

## 卡拉OK字幕模板与使用方式

首先，下载安装[Set Karaoke Style](https://github.com/MichiyamaKaren/aegisub-set-karaoke-style)插件。

将下面的模板中的样式和字幕模板分别复制到字幕文件中，前者决定了最终显示的字幕样式（注意安装相应字体），后者定义了渲染模板的具体行为并包含一些个性化配置。
```
[V4+ Styles]
Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding
Style: K1,Noto Serif JP Black,110,&H00FFFFFF,&H00FF0000,&H00000000,&H80000000,0,0,0,0,100,100,0,0,1,4,0,1,120,30,220,1
Style: K2,Noto Serif JP Black,110,&H00FFFFFF,&H00FF0000,&H00000000,&H80000000,0,0,0,0,100,100,0,0,1,4,0,3,30,120,40,1

[Events]
Format: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text
Comment: 0,0:00:00.00,0:00:00.00,K1,,0,0,0,code once,remember("color_table", {}); remember("default_color", "&HFF0000&"); remember("style_table", {K1=true,K2=true});
Comment: 0,0:00:00.00,0:00:00.00,K1,,0,0,0,code once,function get_color(actor) local color=recall("color_table")[actor]; if not color then color=recall("default_color"); end return color; end
Comment: 0,0:00:00.00,0:00:00.00,K1,,0,0,0,code syl all,fxgroup.kara=syl.inline_fx=="" and (not not recall("style_table")[line.styleref.name])
Comment: 1,0:00:00.00,0:00:00.00,K1,overlay,0,0,0,template syl noblank all fxgroup kara,!retime("line",-100,500)!{\pos($center,$middle)\an5\shad0\1c!get_color(line.actor)!\3c&HFFFFFF&\clip(!$sleft-3!,0,!$sleft-3!,1080)\t($sstart,$send,\clip(!$sleft-3!,0,!$sright+3!,1080))\bord5}
Comment: 0,0:00:00.00,0:00:00.00,K1,,0,0,0,template syl all fxgroup kara,!retime("line",-500,500)!{\pos($center,$middle)\an5}
Comment: 1,0:00:18.65,0:00:20.65,K1,overlay,0,0,0,template furi all,!retime("line",-100,500)!{\pos($center,!$middle+10!)\an5\shad0\1c!get_color(line.actor)!\3c&HFFFFFF&\clip(!$sleft-3!,0,!$sleft-3!,1080)\t($sstart,$send,\clip(!$sleft-3!,0,!$sright+3!,1080))\bord5}
Comment: 0,0:00:00.00,0:00:00.00,K1,,0,0,0,template furi all,!retime("line",-500,500)!{\pos($center,!$middle+10!)\an5}
Comment: 0,0:00:00.00,0:00:00.00,K1,music,0,0,0,template fx no_k,!retime("line",-500,500)!{\pos($center,!$middle!)\an5\1c&H505050&\3c&HFFFFFFF&}
```

1. 打K轴（见Aegisub[官方文档](https://aegi.vmoe.info/docs/3.2/Karaoke_Timing_Tutorial/)），注意要做成卡拉OK字幕显示的行应为同一样式。建议此步结束后**备份**字幕文件。
2. 运行`Set Karaoke Style`插件（在`自动化`菜单中）。
3. 运行`应用卡拉OK模板`，生成最终的卡拉OK字幕。

### 处理重叠字幕

在上一节的第二步中，若存在时间重叠的字幕，则`Set Karaoke Style`插件会生成`K1 K2`之外的样式（具体行为参见其GitHub页面）。修改模板第一行的代码行，将除了`K1`和`K2`的样式也填入`style_table`中。

> 示例：若插件设置到了`K3 K4`样式，则该行的最后一个语句应该为
> ```remember("style_table", {K1=true,K2=true,K3=true,K4=true});```

另外，在字幕文件的样式表中定义新增的样式，这里要保证不同层的字幕不要在画面上重叠显示。例如，若要让`K3 K4`显示在`K1 K2`的上方，`K1`和`K2`的垂直边距分别为40和220，则应复制`K1 K2`样式重命名为`K3 K4`，并将垂直边距分别设为580和400。

## 个性化设置覆盖色

本模板允许自定义可变的覆盖色，设置粒度为每行。模板在渲染时会读取每行的说话人，并查找`color_table`变量中存储的颜色，若该行的说话人不在这个表的key中则将颜色设置为`default_color`。这两个变量均在模板第一行代码行被定义，用户需要手动设置。注意这里的颜色编码要写成ASS样式的，其颜色分量排列顺序与HTML格式的相反，为BGR。例如，颜色<span style="height:10px;background:#F95556;display:inline-block;width:10px"></span>`#F95556`在ASS样式中要写成`&H5655F9&`。