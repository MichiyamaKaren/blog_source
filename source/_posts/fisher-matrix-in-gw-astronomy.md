---
title:       Fisher矩阵在引力波天文学中的应用
description: 解释利用Fisher矩阵估计对引力波参数的限制能力的数学原理，并推导由Fisher矩阵得出定位天区面积的公式
date:        2021-04-15 17:22:46
author:      y
mathjax:     true
categories:
    - 引力波
tags:
    - 物理
    - 天文
    - 引力波
---

## Fisher矩阵的导出

对一次引力波事件，引力波探测器给出的strain data $s$包括真实引力波信号$h_0$和噪声$n$，即$s=h_0+n$。

认为**噪声是高斯的**，即其概率分布
$$ p(n) \propto e^{-\frac{1}{2}(n,n)} $$
其中内积定义为
$$ (h,g) = 4\mathrm{Re} \int \frac{h(f)g^*(f)}{S_n(f)}\mathrm{d}f $$
$S_n(f)$是探测器噪声的功率谱，$\left< n(f)n(f')\right> = \frac{1}{2}S_n(f)\delta(f-f')$。

从而可以写出似然函数：
$$
\begin{aligned}
    L(s|\boldsymbol{\theta}) &\propto e^{-\frac{1}{2}(s-h(\boldsymbol{\theta}), s-h(\boldsymbol{\theta}))}
    \\&= \exp\left\{-\frac{1}{2} \left[(h_0-h(\boldsymbol{\theta}),h_0-h(\boldsymbol{\theta})) +2(h_0-h(\boldsymbol{\theta}),n) + (n,n) \right] \right\}
    \\&\approx \exp\left\{-\frac{1}{2} (h_0-h(\boldsymbol{\theta}),h_0-h(\boldsymbol{\theta})) \right\}
\end{aligned}
$$
最后一步取了高SNR近似，即认为$n\ll h$。

在真实参数的附近展开$h(\boldsymbol{\theta})$，
$$ h(\boldsymbol{\theta}) = h_0 + \frac{\partial h}{\partial \theta_i} \Delta\theta_i + o(\Delta \theta_i) $$
从而似然函数
$$
\begin{aligned}
    L(s|\boldsymbol{\theta}) &\propto \exp\left\{-\frac{1}{2} (h_0-h(\boldsymbol{\theta}),h_0-h(\boldsymbol{\theta})) \right\}
    \\&= \exp\left\{-\frac{1}{2} \left(\frac{\partial h}{\partial \theta_i},\frac{\partial h}{\partial \theta_j}\right) \Delta\theta_i\Delta\theta_j \right\}
\end{aligned}
$$
将
$$ \Gamma_{ij} = \left(\frac{\partial h}{\partial \theta_i},\frac{\partial h}{\partial \theta_j}\right) $$
定义为**Fisher矩阵**。

从而$L(s|\boldsymbol{\theta}) \propto \exp\left\{-\frac{1}{2} \Gamma_{ij} \Delta\theta_i\Delta\theta_j \right\}$，是协方差矩阵为$\Gamma^{-1}$的正态分布。如果选定先验分布为均匀分布，使用贝叶斯方法估计出的参数的后验分布也就是协方差矩阵为$\Gamma^{-1}$的正态分布。

上面的推导给出了估计根据探测器接收到的引力波信号对参数进行限制的能力的方法：计算波形对参数的微分，得到Fisher矩阵，而对齐求逆就得到近似的参数的协方差矩阵。并且我们知道，在真实波形的参数附近，参数的概率分布近似为正态分布。对多个探测器组成的探测器网络，Fisher矩阵为每个探测器的Fisher矩阵的和。

关于Fisher矩阵的推导和含义，更严谨的讨论见[gr-qc/9209010](https://arxiv.org/abs/gr-qc/9209010)（Fisher矩阵给出频率论视角的方差的推导，即由于不同的噪声，最大似然估计的参数的变化）和[gr-qc/0703086](https://arxiv.org/abs/gr-qc/0703086)（以三种不同的方式给出Fisher矩阵的结果，并讨论了其可应用的范围及需要注意之处）。

## 推导定位天区面积公式

对单个参数，协方差矩阵$C=\Gamma^{-1}$可以简单地给出参数$\theta_i$的误差（标准差）$\sigma_{\theta_i} = \sqrt{C_{ii}}$。

一个重要的量是对波源定位的天区的大小，这可以由两个位置参数（如赤经、赤纬）的分布给出。方便起见，我们取参数$x=\cos\theta_0-\cos\theta, y=\phi-\phi_0$，$\theta$和$\phi$是球坐标，$\theta_0$和$\phi_0$是注入波形采取的波源的位置。则立体角就是$\mathrm{d}\Omega=\mathrm{d}x\mathrm{d}y$。由上节，将与位置无关的参数积掉，$x,y$的边缘分布就是均值为零的二维正态分布
$$ p(x,y) = \frac{1}{2\pi |\det C|^{1/2}} e^{-\frac{1}{2}(C^{-1}_{11}x^2+C^{-1}_{22}y^2+2C^{-1}_{12}xy)} $$
这里的$C$是$x$和$y$的协方差矩阵，其元素为Fisher矩阵的逆的$x$和$y$对应行列的元素。

概率$P$的定位天区面积$\Delta\Omega_P$为根据波源位置的后验分布，波源处在其中的概率为$P$的天区的面积。当然给定面积对应的天区并不唯一，具体地说，这里的区域是误差椭圆，即$xy$平面上等概率密度线内的区域。

通过配方换元，$u^2+v^2=\frac{1}{2}(C^{-1}_{11}x^2+C^{-1}_{22}y^2+2C^{-1}_{12}xy)$，可以求出
$$ \left|\frac{\partial(x,y)}{\partial(u,v)}\right| = 2\sqrt{\det C} $$

误差椭圆就是$u^2+v^2\le R^2$，其对应的概率为
$$
\begin{aligned}
    P &= \iint_{u^2+v^2\le R^2} p(u,v)\left|\frac{\partial(x,y)}{\partial(u,v)}\right|\mathrm{d}u\mathrm{d}v
    \\&= \frac{1}{\pi} \iint_{u^2+v^2\le R^2} e^{-(u^2+v^2)} \mathrm{d}u\mathrm{d}v
    \\&= 1-e^{-R^2}
\end{aligned}
$$
对应的天区面积
$$
\begin{aligned}
    \Delta\Omega_P &= \iint_{u^2+v^2\le R^2} \mathrm{d}x\mathrm{d}y = \iint_{u^2+v^2\le R^2} \left|\frac{\partial(x,y)}{\partial(u,v)}\right|\mathrm{d}u\mathrm{d}v
    \\&= 2\pi R^2 \sqrt{\det C}
\end{aligned}
$$
记
$$ \Delta\Omega_S = 2\pi \sqrt{\det C} $$
则
$$ 1-P = e^{-\Delta\Omega_P/\Delta\Omega_S} $$
$\Delta\Omega_S$即是一个定位天区的特征面积。考虑协方差矩阵的定义，可以写成
$$
\begin{aligned}
    \Delta\Omega_S &= 2\pi\sqrt{\left<(\Delta \cos\theta)^2\right>\left<\Delta \phi^2\right> - \left<\Delta \cos\theta \Delta \phi\right>^2}
    \\&\approx 2\pi |\sin\theta| \sqrt{\left<\Delta \theta^2\right>\left<\Delta \phi^2\right> - \left<\Delta \theta \Delta \phi\right>^2}
\end{aligned}
$$