---
title:       绪论——恒星物理
description: 恒星物理笔记（一）
date:        2020-09-08 13:00:00
author:      y
mathjax:     true
categories:
    - 笔记
    - 恒星物理笔记
tags:
    - 天文
---

这一系列为中国科大2020年春季学期课程《恒星物理基础》的课程笔记。  
所用教材为An Introduction to the Theory of Stellar Structure and Evolution Second Edition  
~~（几乎都是教材上的东西，除了这篇）~~

---

## 恒星的表面温度

### 有效温度
面元$\mathrm{d}\delta$向方向$\theta$（与法向夹角）的单位立体角$\mathrm{d}\Omega$内频率范围在$\mathrm{d}\nu$的光在时间$\mathrm{d}t$内辐射了能量$\mathrm{d}E$，辐射强度定义为：
$$ I_{\nu}=\frac{\mathrm{d}E}{\cos\theta\mathrm{d}\delta\mathrm{d}\Omega\mathrm{d}\nu\mathrm{d}t} $$
对所有方向求平均，得到平均辐射强度：
$$ J_{\nu}=\frac{1}{4\pi}\oint I_\nu \mathrm{d}\Omega $$
对各向同性辐射场就有$I_{\nu}=J_{\nu}$。

各向同性辐射场沿法向辐射的一束电磁波，$\mathrm{d}t$时间内覆盖了体积$\mathrm{d}V=c\mathrm{d}t\mathrm{d}\delta$，从而这个方向上传播的能量密度为：
$$ u=\frac{\mathrm{d}E}{\mathrm{d}V}=\frac{I_\nu}{c} $$
对所有方向积分，单色辐射的能量密度则为：
$$ U_\nu=\oint u\mathrm{d}\Omega=\frac{4\pi}{c}J_\nu $$
对各向同性辐射场，即为：
$$ U_\nu=\frac{4\pi}{c}I_\nu $$
由Stefan-Boltzmann定律，单色辐射的辐射强度为：
$$ I_\nu=\frac{2h\nu^3}{c^2}\frac{1}{e^{h\nu/kT}-1} $$
对所有频率积分，辐射场的能量密度为：
$$ U(T)=\frac{4\pi}{c}\int_0^\infty I_{\nu}\mathrm{d}\nu=aT^4 $$
其中$a$是黑体辐射能量密度常数。  
对球面源（恒星），辐射光度为：
$$
\begin{aligned}
    L&=\oint\mathrm{d}\delta\int_0^\infty \mathrm{d}\nu \oint I_\nu\cos\theta\mathrm{d}\Omega
    \\
    &=4\pi R^2\sigma T^4
\end{aligned}
$$
其中$\sigma$为Stefan-Boltzmann常数，对比能量密度公式有：
$$\sigma=\frac{ac}{4} $$

根据恒星的光度定义的温度为**有效温度**：
$$ L = 4\pi R^2 \sigma T_{\mathrm{eff}}^4 $$

## 恒星的形成

### 星云的引力不稳定性

一团处于流体静力学平衡的均匀气体云，初始条件：
$$
\left\{
\begin{aligned}
    & \rho = \mathrm{const.} \\
    & T_0 = \mathrm{const.} \\
    & \mathbf{V_0} = 0 \\
    & P_0 = \mathrm{const.}
\end{aligned}
\right.
$$
满足的方程有：
- 连续性方程
  $$ \frac{\partial \rho}{\partial t} + \nabla\cdot(\rho \mathbf{V}) = 0 $$
- 运动方程
  $$ \frac{\partial \mathbf{V}}{\partial t} + (\mathbf{V}\cdot\nabla)\mathbf{V} = -\frac{1}{\rho}\nabla P -\nabla \phi $$
- 引力场方程（泊松方程）
  $$ \nabla^2\phi = 4\pi G\rho $$
- 物态方程
  $$ P = \frac{k}{\mu}\rho T = c_S^2 \rho $$

对上述各式中$\rho$，$T$，$\mathbf{V}$，$P$施加一个微扰，保留至一阶，成为：
$$ \frac{\partial \rho_1}{\partial t} + \rho_0 \nabla\cdot\mathbf{V_1}= 0 \tag{1} $$
$$ \frac{\partial \mathbf{V_1}}{\partial t} + \frac{1}{\rho_0}\nabla P_1 + \nabla \phi_1 = 0 \tag{2} $$
$$ \nabla^2\phi_1 = 4\pi G \rho_1 \tag{3} $$
$$ P_1 = c_S^2 \rho_1 \tag{4} $$
(1)对时间求导：
$$ \frac{\partial^2 \rho_1}{\partial t^2} + \rho_0\nabla\cdot\frac{\partial\mathbf{V_1}}{\partial t} = 0 \tag{5} $$
(2)求散度：
$$ \rho_0\nabla\cdot\frac{\partial \mathbf{V_1}}{\partial t} + \nabla^2 P_1 + \nabla^2 \phi_1\rho_0 = 0 \tag{6} $$
联立(3)(4)(5)(6)，得到：
$$ \frac{\partial^2 \rho_1}{\partial t^2} - c_S^2\nabla^2\rho_1 = 4\pi G \rho_1\rho_0 \tag{7} $$

考虑$\rho_1$的傅里叶变换：
$$ \rho_1(t,\mathbf{r}) = \frac{1}{(2\pi)^{3/2}} \iiint \rho_1(t,\mathbf{k}) e^{-i \mathbf{r}\cdot\mathbf{k}}\mathrm{d}^3\mathbf{k} $$
代入(7)：
$$ \frac{\partial^2 \rho_1(t,\mathbf{k})}{\partial t^2} + c_S^2 \rho_1(t,\mathbf{k})k^2 = 4\pi G \rho_1(t)\rho_0 $$
解为
$$ \rho_1(t,\mathbf{k}) = Ae^{-i\omega t} $$
其中
$$ \omega = \sqrt{c_S^2 k^2 - 4\pi G \rho_0} $$
临界值
$$ k_J = \sqrt{\frac{4\pi G \rho_0}{c_S^2}} $$
对应**金斯波长**
$$ \lambda_J = \frac{2\pi}{k_J} = \sqrt{\frac{\pi}{G\rho_0}}c_S $$
当系统的尺度大于金斯波长时，$\rho_1\sim e^{|\omega|t}$，气体云中的扰动可以增长，塌缩形成恒星；$\lambda<\lambda_J$对应振荡解。

考虑其物理意义，一团气体，引力作用的时标为自由落体时标：
$$ \tau_G \sim \tau_{\mathrm{ff}} \sim (G\rho_0)^{-1/2} $$
而压力作用的时标为：
$$ \tau_P \sim \frac{\lambda}{c_S} $$
要使气体能够塌缩，引力作用应该占主导，即引力时标小于压力时标，从而：
$$  \tau_P > \tau_G \Rightarrow \lambda > c_S(G\rho_0)^{1/2} \sim \lambda_J $$

也就是说，只有尺度$\lambda>\lambda_J$，或质量$M>M_J=4\pi\lambda_J^3\rho_0/3$的气体云才能塌缩成恒星。

### 星云中的气体球的不稳定性

质量$M$，半径$R$的单原子理想气体球，平衡时满足位力定理，$2E_T+E_G=0$。$-E_G>2E_T$时为引力主导，可以塌缩。

考虑动能$E_T$：  
分子平均动能为$\epsilon_k=\frac{3}{2}kT$，从而气体云的总动能：
$$ E_T = \int_0^M \frac{3kT}{2\mu}\mathrm{d}m = \frac{3kT}{2\mu}M $$
引力势能：
$$ E_G = -\int_0^M \frac{Gm_r}{r}\mathrm{d}m_r $$
$m_r$是半径$r$内的质量，对均匀气体球，
$$ \frac{m_r}{M} = \frac{4\pi r^3\rho/3}{4\pi R^3\rho/3} = \left(\frac{r}{R}\right)^3 $$
从而：
$$ E_G = -\frac{GM^{1/3}}{R}\int_0^M m_r^{2/3}\mathrm{d}m_r = -\frac{3GM^2}{5R} $$

$-E_G>2E_T$时气体云可以塌缩，此时
$$ M>M_J=\left(\frac{3}{4\pi\rho}\right)^{1/2}\left(\frac{5kT}{G\mu}\right)^{3/2} $$
这是根据位力定理定义的新的“金斯质量”。

带入HI气体云的环境，金斯质量$M_J\sim 10^5M_{\odot}$，而观测到的恒星质量为$0.1-120M_\odot$，而星团的质量更接近$10^5M_{\odot}$。这说明气体云在塌缩形成恒星的过程中还会碎裂。

### 碎裂的过程

原始的气体云是光学薄的，塌缩过程中产生的温度可以无阻碍的辐射出去，可以看做**等温过程**，$M_J\sim\rho^{-1/2}$。塌缩使$\rho$变大，金斯质量减小。因此气体云在塌缩的过程中会因为局部的引力不稳定性碎裂。

云团继续塌缩，气体密度变高，形成光学厚的云团，热量不能辐射出去，进行的是**绝热过程**。绝热过程中$V^{\gamma-1}T=\mathrm{const.}$，从而$T\sim\rho^{2/3}$，从而$M_J\sim\rho^{1/2}$。随气体塌缩，金斯质量变大，塌缩逐渐停止。

总引力能$E_G\sim GM^2/R$，塌缩时标$\tau_G\sim(G\rho)^{1/2}$，从而单位时间产生的引力势能为：
$$ L_G\sim\frac{E_G}{\tau_G}\sim \left(\frac{3}{4\pi}\right)^{1/2}\frac{G^{3/2}M^{5/2}}{R^{5/2}} $$
系统的辐射功率可以看作相同温度和体积的黑体辐射乘一个小于1的系数$f$（存在吸收），
$$ L_C = f \cdot 4\pi R^2 \sigma T^4 $$
等温过程中，$L_G\ll L_C$，塌缩产生的引力势能全被辐射出去。  
绝热过程中，$L_G>L_C$，引力能不被完全辐射出去。  
$L_G=L_C$时的临界质量：
$$ M_{J}=\left(\frac{\pi^{9}}{9}\right)^{1 / 4}\left(\sigma G^{3}\right)^{-1 / 2}\left(\frac{k}{\mu}\right)^{9 / 4} f^{-1 / 2} T^{1 / 4} $$
令$\mu=1,T=1000\mathrm{K},f=0.1$，得到$M_J=1/3M_{\odot}$，和恒星质量的量级吻合。