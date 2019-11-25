---
title:      在Docker上部署Jupyter Notebook
description: 
date:       2019-10-22
author:     y
mathjax:    false
categories:
    - 技术
tags:
    - 技术
---

由于要用到只能在Linux上运行的python包，又懒得装双系统，就了解了一下Docker，配置了一个能在Windows上用的Jupyter Notebook环境。

## Docker上Ubuntu的基础配置

去官网上下载一个Docker Desktop，然后pull一个ubuntu镜像。刚pull下来的ubuntu镜像里什么必要的工具也没有，需要自己apt-get安装。（改软件源的配置文件时需要注意按照对应的系统版本去搜索配置文件的写法，否则apt-get会报错）

安装python, python3, pip, pip3, vim等必要软件。

## 配置Jupyter Notebook

参考了[这篇博客](https://www.jianshu.com/p/21d5afc1c079)。

首先安装Jupyter（我的电脑上pip3 config似乎有问题）：
```
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple jupyter
```
以及其他必要的第三方库。  
然后生成Jupyter配置文件：
```
jupyter notebook --generate-config
```
修改配置文件`~/.jupyter/jupyter_notebook_config.py`中的如下几项：
```
c.NotebookApp.open_browser = False
c.NotebookApp.ip = '*'
c.NotebookApp.port = 8888
```
设置密码：
```
jupyter notebook password
```
然后把当前容器commit到notebook镜像。

需要启动Jupyter Notebook时，用如下命令启动notebook容器：
```
docker run -d --name jupyter_pycbc -p 8888:8888 -v //D/DockerShare/:/home/FromHost notebook jupyter notebook --allow-root /home
```
各参数的含义为：
- -d：在后台运行
- -p：将容器的8888端口映射到宿主机的8888端口
- -v：将容器的`/home/FromHost`目录挂载到宿主机的`D:DockerShare`目录下。注意Windows中D盘DockerShare文件夹的表示方式为`//D/DockerShare`。

在宿主机访问`localhost:8888`即可使用Jupyter Notebook。

## 配置多个python

参考了[这篇博客](https://blog.csdn.net/hohaizx/article/details/89633203)。

之前配置的Jupyter Notebook只能使用python3，现在要同时使用python2和python3，需要进一步配置。

这只需添加python2的ipython kernel：
```
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple ipykernel
python -m ipykernel install --user --name python27 --display-name "python27"
```
再次启动Jupyter Notebook，即可看到两个python。