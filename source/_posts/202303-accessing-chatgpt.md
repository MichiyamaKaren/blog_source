---
title: 自搭代理服务访问ChatGPT
description: V2Ray + Cloudflare WARP
date: 2023-03-28
categories:
    - 技术
tags:
    - 技术
---

众所周知，ChatGPT对用户的IP限制非常严格，很多时候即使用便宜梯子翻墙也会因为同一个服务器用的人太多而被限制访问。我之前租了一台服务器给自己翻墙用，但去年某天突然就被封了IP。虽然过了一段时间就放出来了，但那之后我也一直没敢再用这台服务器翻墙，而是另找了别的梯子，直到现在因为要访问ChatGPT才想起来重新把梯子搭起来。整套流程的涉及的步骤比较多，因此特意写篇博客记录一下。

在开始配置之前，自然需要的是先有一台境外的云服务器（不能是香港的）。我的是在搬瓦工上租的50刀每年的CN2 GIA套餐，有针对国内的网络优化，对于个人来说流量和带宽也够用。不过搬瓦工机房的IP也在openAI的限制列表中，因此后面还需要额外的配置。如果是为了专门访问ChatGPT，更好还是找一个小服务商。

登上服务器之后首先配置v2ray服务端。为了降低服务器被封的风险，需要运行[这篇博客](https://v2xtls.org/v2ray%e5%a4%9a%e5%90%88%e4%b8%80%e8%84%9a%e6%9c%ac%ef%bc%8c%e6%94%af%e6%8c%81vmesswebsockettlsnginx%e3%80%81vlesstcpxtls%e3%80%81vlesstcptls%e7%ad%89%e7%bb%84%e5%90%88/)中的一键脚本配置v2ray伪装。这一脚本在服务器上安装v2ray和nginx，用nginx做服务端反向代理，将访问伪装域名下某个特定路径的流量转发给v2ray，而伪装域名根路径则会跳转到安装脚本设定的伪装站点。这样在中间人看来v2ray流量就是正常的访问伪装域名的HTTPS流量，而即使对这个域名进行主动探测，因为中间人不知道v2ray对应的路径，也只会跳转到正常的伪装站点。在配置时需要注意的是一键脚本需要root权限运行，但它会调用acme.sh获取letsencrypt的免费证书，而acme.sh又不推荐使用sudo模式，因此为了省事可以直接以root用户运行。

在服务器上配置好v2ray后，一键脚本会自动生成v2ray链接，将其导入本地的v2ray客户端后即可连接代理实现翻墙。然而在我配置好后尝试访问ChatGPT才发现搬瓦工也被OpenAI屏蔽了。我搜索到了[这篇帖子](https://v2ex.com/t/908392)中对这一问题的解决方案，即使用Cloudflare提供的warp服务。这一服务用Cloudflare的链路传输用户的流量从而加密并优化网络连接，相当于再套了一层代理，从而可以避开针对我们的服务器的IP的屏蔽。同样的手段也被用于解除Netflix的限制。按照[这篇文章](https://github.com/hausa-han/Cloudflare-WARP-proxy/blob/main/README.md)安装并启动warp，并修改v2ray服务端的配置文件，增加一个outbound把访问ChatGPT的流量转发到warp（默认在40000端口）即可。我在配置文件添加的内容如下：
```json
{
  "inbounds": [{
    "sniffing": {
        "enabled": true,
        "destOverride": ["http", "tls"]
    }
  }],
  "outbounds": [{
    "tag": "warp",
    "protocol": "socks",
    "settings": {
      "servers": [
        {
          "address": "127.0.0.1",
          "port": 40000
        }
      ]
    }
  }],
  "routing": {
    "rules": [{
      "type": "field",
      "outboundTag": "warp",
      "domain": [
        "openai.com",
        "hcaptcha.com",
        "bing.com",
        "whoer.net"
      ]
    }]
  }
}
```
转发到warp的域名不仅有ChatGPT需要的`openai.com`和`hcaptcha.com`，还添加了Bing和IP检测的`whoer.net`用于测试warp。