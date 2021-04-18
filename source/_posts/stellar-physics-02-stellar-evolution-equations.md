---
title:       恒星演化方程
description: 恒星物理笔记（二）
date:        2020-09-08 14:00:00
mathjax:     true
categories:
    - 笔记
    - 恒星物理笔记
tags:
    - 天文
---

恒星：等离子气体球，辐射，离子、电子、光子频繁碰撞。在同一壳层$r\sim r+\mathrm{d}r$中密度、温度近似相同，处于局部动态热平衡。

## 局域热平衡(LTE)

光子穿过厚$\mathrm{d}s$的气体时，辐射强度相对变化（光深）：
$$ \mathrm{d}\tau_\nu = \frac{\mathrm{d}I_\nu}{I_\nu} = -\kappa_\nu \mathrm{d}s $$
$\kappa_\nu$称为吸收系数，在均匀介质中，$\kappa_\nu$不依赖位置。  
根据朗伯定律，
$$ \kappa_\nu=\frac{1}{\lambda} $$
其中$\lambda$是粒子的平均自由程。  
即：
$$
\tau_\nu=\frac{s}{\lambda}=\left\{
\begin{aligned}
    &\gg 1 & 光学厚
    \\& \ll 1 & 光学薄
\end{aligned}
\right.
$$

恒星中粒子自由程$\lambda\ll R$（系统的尺度），是**光学厚**的，对辐射不透明。光子和离子、电子频繁碰撞，在每个等半径的壳层都能达成温度、密度相同，即**局域热平衡**。恒星内部光深$\tau_\nu\gg 1$，其辐射可以看作类黑体辐射。

描述恒星结构的物理量有：**温度**$T(r)$，**密度**$\rho(r)$，第$i$种元素的**化学组分**$X_i(r)$。包含$n$种元素就需要用$n+2$个方程描述。若要考虑演化方程，则为：
$T(t,r),\rho(t,r),X_i(t,r)$。  
考虑能量、动量、角动量守恒（考虑的时标远小于恒星寿命，在短时间内近似守恒），利用如下的前提：
- 无核反应外的质量亏损
- 忽略原初转动，角动量$L=0$
- 只考虑对流层以下，流体静力学过程。忽略磁场的效应。

## 能量方程

用半径$r$以内的质量$m$作为自变量，$F(m)$是$r$以内的辐射功率，$u$为单位质量的内能，$q$为核产能率，单位质量单位时间核反应释放的能量。考虑$r\sim r+\mathrm{d}r$的壳层：  
内能变化
$$ \begin{aligned}
    \delta U&=\delta(u\mathrm{d}m)=\delta u\mathrm{d}m
    \\&=\delta Q + \delta W
\end{aligned} $$
外界对这一壳层做功：
$$ \delta W = -P\delta(\mathrm{d}V) = -P\delta\left(\frac{1}{\rho}\right)\mathrm{d}m $$
吸热（产热和辐射转移）：
$$ \begin{aligned}
    \delta Q &= q\mathrm{d}m\delta t - \mathrm{d}F\delta t
    \\&= \left(q-\frac{\partial F}{\partial m}\right)\mathrm{d}m\delta t
\end{aligned} $$
由能量守恒有：
$$ \dot{u} + P\frac{\mathrm{d}}{\mathrm{d}t}\left(\frac{1}{\rho}\right) = q-\frac{\partial F}{\partial m} $$
对主序星，处于热平衡，物理量不随时间变化，$\dot{u}=0,\dot{\rho}=0$。从而：
$$ q = \frac{\partial F}{\partial m} $$
对质量积分：
$$ \int_0^M q\mathrm{d}m=L_{\mathrm{nuc}}=F(M)=L $$
即核聚变产生的能量全部由辐射释放出去，系统保持稳定等温。

## 运动方程

考虑径向高$\mathrm{d}r$，底面积$\mathrm{d}S$的小圆柱体：  
质量
$$  \delta m=\rho \mathrm{d}r\mathrm{d}S $$
运动方程：
$$ \begin{aligned}
    \ddot{r}\delta m &= -\frac{Gm}{r^2}\delta m - \frac{\partial P}{\partial r}\mathrm{d}r\mathrm{d}S
    \\&= -\left(\frac{Gm}{r^2} + \frac{\partial P}{\partial r}\frac{1}{\rho} \right)\delta m
\end{aligned} $$
对处于流体静力学平衡的恒星，$\ddot{r}=0$，有：
$$ \frac{\mathrm{d} P}{\mathrm{d} r} = -\rho\frac{Gm}{r^2} $$
也可以写成：
$$ \frac{\mathrm{d}P}{\mathrm{d}m} = -\frac{Gm}{4\pi r^4} $$
可以看出，越向外压力越小，在恒星表面$r=R$处压力为零（边界条件）。且由于$m\sim r^3$，在恒星中心，压强梯度为零。

用上式估计恒星中心压强的下限：
$$ P(r=0)=\int_0^M \frac{Gm}{4\pi r^4} > \int_0^M \frac{Gm}{4\pi R^4} = \frac{GM^2}{8\pi R^4} $$

## 维里定理

由运动方程：
$$ \frac{\mathrm{d}P}{\mathrm{d}m} = -\frac{Gm}{4\pi r^4} $$
有：
$$
\begin{aligned}
    V(r)\mathrm{d}P &= -\frac{4\pi r^3}{3}\frac{Gm}{4\pi r^4} \mathrm{d}m
    \\&= -\frac{1}{3}\frac{Gm}{r} \mathrm{d}m
\end{aligned}
$$
积分：
$$ \int_{P(0)}^{P(R)} V\mathrm{d}P = -\frac{1}{3}\int_0^M \frac{Gm}{r} \mathrm{d}m $$
左边
$$ \int_{P(0)}^{P(R)} V\mathrm{d}P = P(r)V(r) \big |_0^R - \int_{0}^{V(R)} P\mathrm{d}V = -\int_{0}^{M} \frac{P}{\rho} \mathrm{d}m $$
右边积分里就是引力能$\Omega$。从而：
$$ \int_{0}^{M} \frac{P}{\rho} \mathrm{d}m = -\frac{1}{3}\Omega $$
对理想气体，平均分子动能$\epsilon=\frac{3}{2}kT$，从而比内能：
$$ u = \frac{\epsilon}{m_g} = \frac{3kT}{2m_g} = \frac{3}{2}\frac{P}{\rho} $$
代入上面的式子，即得到：
$$ 2U + \Omega = 0 $$
即维里定理。这说明恒星是一个稳定的、独立演化的、维里化的系统。

可以利用维里定理估算恒星的内部温度。  
由于不清楚密度分布，假设引力能
$$ \Omega = -\alpha \frac{GM^2}{R} $$
由维里定理，
$$ U = \frac{1}{2}\alpha\frac{GM^2}{R} $$
另一方面，
$$ U = \int_0^R \frac{3kT}{2m_g} \mathrm{d}r = \frac{3k\overline{T}}{2m_g} $$
得到平均温度的估计
$$ \overline{T} = \frac{\alpha}{3}\frac{m_gG}{k}\frac{M}{R} $$
由平均密度$\rho=M/V$，有$\overline{T}\propto M^{2/3}\bar{\rho}^{-1/3}$。相同质量的恒星，其平均密度越大，平均温度越小。

## 恒星总能量

总能量$E=U+K+\Omega$（内能+宏观动能+引力能）

对内能，将2.2中的能量方程
$$ \dot{u} + P\dot{\left(\frac{1}{\rho}\right)} = q-\frac{\partial F}{\partial m} $$
积分：
$$ 
\begin{aligned}
    \int_0^M\dot{u}\mathrm{d}m + \int_0^M P\frac{\mathrm{d}}{\mathrm{d}t}\left(\frac{1}{\rho}\right)\mathrm{d}m &= \int_0^M q\mathrm{d}m - \int_0^M\frac{\partial F}{\partial m}\mathrm{d}m
    \\&=L_{\mathrm{nuc}}-L
\end{aligned}
$$
左边第一项即为$\dot{U}$，第二项有：
$$
\begin{aligned}
    \int_0^M P\frac{\mathrm{d}}{\mathrm{d}t}\left(\frac{1}{\rho}\right)\mathrm{d}m &= \int_0^M P\frac{\mathrm{d}}{\mathrm{d}t}\left(\frac{\mathrm{d}V}{\mathrm{d}m}\right)\mathrm{d}m
    \\&= \dot{V}P\big |_0^M - \int_0^M \dot{V} \left(\frac{\partial P}{\partial m}\right)\mathrm{d}m
\end{aligned}
$$
在恒星中心$\dot{V}=0$，而表面上$P=0$。从而：
$$
\begin{aligned}
    \int_0^M P\dot{\left(\frac{1}{\rho}\right)}\mathrm{d}m &= -\int_0^M \dot{V} \frac{\partial P}{\partial m}\mathrm{d}m
    \\&= -\int_0^M 4\pi r^2 \dot{r} \frac{\partial P}{\partial m}\mathrm{d}m
\end{aligned}
$$
从而能量方程成为：
$$ \dot{U} - \int_0^M 4\pi r^2 \dot{r} \frac{\partial P}{\partial m}\mathrm{d}m = L_{\mathrm{nuc}}-L $$
考虑能量方程的物理意义，对2.3中的运动方程：
$$ \ddot{r} = -\frac{Gm}{r^2} - \frac{\partial P}{\partial r}\frac{1}{\rho} $$
乘$\dot{r}$积分：
$$ \int_0^M \ddot{r}\dot{r}\mathrm{d}m = -\int_0^M \frac{Gm}{r^2}\dot{r}\mathrm{d}m - \int_0^M 4\pi r^2 \dot{r} \frac{\partial P}{\partial m}\mathrm{d}m $$
左边
$$ \int_0^M \ddot{r}\dot{r}\mathrm{d}m = \frac{\mathrm{d}}{\mathrm{d}t}\int_0^M \frac{1}{2}\dot{r}^2\mathrm{d}m = \dot{K} $$
$K$是宏观动能，即恒星膨胀收缩的动能。  
右边第一项：
$$ -\int_0^M \frac{Gm}{r^2}\dot{r}\mathrm{d}m = \int_0^M \frac{\mathrm{d}}{\mathrm{d}t} \left(\frac{Gm}{r}\right)\mathrm{d}m = -\dot{\Omega} $$
即有
$$ -\int_0^M 4\pi r^2 \dot{r} \frac{\partial P}{\partial m}\mathrm{d}m = \dot{K}+\dot{\Omega} $$
能量方程就可写为：
$$ \dot{U}+\dot{K}+\dot{\Omega} = \dot{E} = L_{\mathrm{nuc}}-L $$
即总能量的变化率等于核聚变产能率减光度（辐射出去的功率）。

注意:
- 处于热平衡时，$E=\mathrm{const.}$  
  流体静力学平衡$K=0$，$E=U+\Omega=\Omega/2=-U$
- $\dot{E}<0$时，$U$增大，温度也升高。引力势能$\Omega$减小，此时恒星收缩。  
  相对地，$\dot{E}>0$时恒星膨胀。

## 组分变化方程

恒星中发生核聚变反应，导致各元素化学组分变化。

元素丰度$X_i$定义为元素$i$的质量占恒星的质量比。从而数密度为
$$ n_i = \frac{\rho_i}{m_i} = \frac{\rho X_i}{A_i m_{\mathrm{H}}} $$

考虑核反应：
$$ I(A_i,Z_i)+J(A_j,Z_j) \rightleftharpoons K(A_k,Z_k) + L(A_l,Z_l) $$
满足：  
重子数守恒$A_i+A_j=A_k+A_l$  
电荷守恒$Z_i+Z_j=Z_k+Z_l$  
和轻子（电子、中微子）数守恒。

计算核反应率：
-  I粒子的散射截面为$S$，I和J粒子的相对速度为$V$（根据温度计算的平均速度），单位体积的有效作用截面为$n_i S$。而单位时间通过单位面积的J粒子的数目为$n_j V$。从而单位时间、单位体积发生的反应数为：
$$ n_i S\cdot n_j V = n_i n_j SV = n_i n_j R_{ijk} $$
其中$R_{ijk}$为反应$I+J\rightleftharpoons K$的反应率。
- 粒子与自身反应，单位时间、单位体积的反应数应为
$$ \frac{1}{2} n_i^2 R_{iik} $$
乘1/2是因为$n_i n_j$包含了两个同类粒子的重复计数。

从而元素I的数密度变化率为：
$$ \dot{n}_{i}=-n_{i} \sum_{j, k} n_{j} R_{i j k}+\sum_{l, k} \frac{n_{l} n_{k}}{1+\delta_{l k}} R_{l k i} $$
（与自身反应的粒子，反应数乘了1/2的系数，但是一次反应消耗两个粒子）  
写成元素丰度的形式：
$$ \frac{\dot{X}_{i}}{A_{i}}=\frac{\rho}{m_{\mathrm{H}}}\left(-\frac{X_{i}}{A_{i}} \sum_{j, k} \frac{X_{j}}{A_{j}} R_{i j k}+\sum_{l, k} \frac{X_{l}}{A_{l}} \frac{X_{k}}{A_{k}} \frac{R_{l k i}}{1+\delta_{l k}}\right) $$
得到一个所有元素变化率$\mathbf{X}$的矢量方程。

## 演化方程组

动力学演化（运动方程）：
$$ \ddot{r} = -\frac{Gm}{r^2} - 4\pi r^2\frac{\mathrm{d}P}{\mathrm{d}m} $$
热演化方程（能量方程）：
$$ \dot{u} + P\dot{\left(\frac{1}{\rho}\right)} = q-\frac{\mathrm{d}F}{\mathrm{d}m} $$
化学演化方程：
$$ \dot{\mathbf{X}}=f(\rho,T,\mathbf{X}) $$
结合这$n+2$个方程，可以解出恒星的结构函数：$\rho(m,t),\ T(m,t),\ \mathbf{X}(m,t)$。在恒星演化后期，还需要考虑径向运动$\dot{r}$。  
边界条件：
$$ P(M,t)=0, L(0,t)=0 $$