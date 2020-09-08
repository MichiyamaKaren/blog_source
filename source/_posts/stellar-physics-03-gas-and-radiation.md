---
title:       恒星内部气体和辐射基本物理
description: 恒星物理笔记（三）
date:        2020-09-08 15:34:00
author:      y
mathjax:     true
categories:
    - 笔记
    - 恒星物理笔记
tags:
    - 天文
---

## 理想气体物态方程

若恒星内粒子的库伦相互作用势远小于平均动能，则可以忽略静电作用，看做理想气体。

### 理想气体近似
粒子间的平均距离为
$$ d \cong \left(\frac{1}{n}\right)^{1/3}=n^{-1/3} $$
而数密度
$$ n=\frac{\bar{\rho}}{Am_\mathrm{H}} $$
其中$A$是原子的质量数。  
再根据平均密度=恒星质量/体积，有：
$$ d = \left(\frac{4\pi Am_\mathrm{H}}{3M}\right)^{1/3}R $$
库伦势能
$$ \epsilon_c \simeq \frac{1}{4\pi \epsilon_0}\frac{Z^2 e^2}{d} $$
另一方面，由维里定理可以估计平均温度：
$$ \overline{T} = \frac{\alpha}{3}\frac{Am_\mathrm{H}}{k}\frac{GM}{R} $$
从而
$$ \frac{\epsilon_c}{k\overline{T}} \sim \frac{1}{4\pi\epsilon_0}\frac{Z^2e^2}{A^{4/3}m_\mathrm{H}^{4/3}GM^{2/3}} $$
带入$M=M_\odot$，$Z=1$，$A=1$（氢原子），有$\epsilon_c/kT\sim 10^{-2}$。因此采用理想气体近似是合理的。  
重元素有$A\simeq 2Z$，从而$\epsilon_c/kT\sim Z^{2/3}$。对演化到晚期的恒星，重元素很多，$\epsilon_c/kT$会增大。

### 压强积分
考虑一个假想面，速度与其法向夹角$\theta$的粒子撞击到上面被反弹回来，动量改变
$$ \Delta p = 2p\cos\theta $$
由于粒子分布是各向同的，
$$\frac{n(\theta, p) \mathrm{d}\theta \mathrm{d}p}{n(p) \mathrm{d}p}=\frac{\mathrm{d} \Omega}{4 \pi}=\frac{2 \pi \sin \theta \mathrm{d} \theta}{4 \pi}=\frac{1}{2} \sin \theta \mathrm{d}\theta$$
其中$n(\theta, p)$是方向在$\theta\sim\theta+\mathrm{d}\theta$之间，动量在$p\sim p+\mathrm{d}p$之间的粒子的（空间）数密度。

在$\delta t$时间内，体积$v\delta t\mathrm{d}S\cos\theta$中的粒子会撞击到$\mathrm{d}S$面积上。从而传输到面上的动量为
$$ \delta p = n(\theta,p)\mathrm{d}\theta\mathrm{d}p \cdot v\delta t\mathrm{d}S\cos\theta \cdot \Delta p $$
贡献的压强则为
$$
\begin{aligned}
    \mathrm{d}P &= \frac{\delta p}{\delta t\mathrm{d}S} = n(\theta,p)\mathrm{d}\theta\mathrm{d}p \cdot v\cos\theta \cdot 2p\cos\theta
    \\&= \frac{1}{2}  \mathrm{d}\theta \cdot n(p)\mathrm{d}p \cdot v\cos\theta \cdot 2p\cos\theta
    \\&= vpn(p)\mathrm{d}p \cos^2\theta \sin\theta \mathrm{d}\theta
\end{aligned}
$$
压强对所有方向和动量积分：
$$
\begin{aligned}
    P &= \int_0^\infty\mathrm{d}p\int_0^\pi vpn(p)\cos^2\theta \sin\theta \mathrm{d}\theta
    \\&= \frac{1}{3}\int_0^{\infty} vpn(p)\mathrm{d}p
\end{aligned}
$$
即为**压强积分**。

## 离子压

理想气体近似给出的离子的EoS：
$$ P_I = n_I k T $$

下面用压强积分求离子的压强：  
处于温度$T$的平衡态气体满足麦克斯韦分布
$$ f(v)\mathrm{d}v = 4\pi\left(\frac{m}{2\pi k T}\right)^{3/2} e^{-\frac{1}{2}mv^2/kT} v^2\mathrm{d}v $$
由$\mathrm{d}p=m\mathrm{d}v$：
$$ f(p)\mathrm{d}p = \frac{4\pi p^2\mathrm{d}p}{(2\pi mkT)^{3/2}} e^{-p^2/2mkT} $$
另一方面，$f(p)\mathrm{d}p$是动量在$p\sim p+\mathrm{d}p$之间的粒子的占比，也是在单位体积内动量在$p\sim p+\mathrm{d}p$的粒子数比总粒子数，即：
$$ f(p)\mathrm{d}p = \frac{n(p)}{n}\mathrm{d}p $$
从而压强积分
$$
\begin{aligned}
  P_I &= \frac{1}{3}\int_0^{\infty} vpn(p)\mathrm{d}p
  \\&= \frac{1}{3}\int_0^{\infty} vpn_I \frac{4\pi p^2}{(2\pi mkT)^{3/2}} e^{-p^2/2mkT}\mathrm{d}p
  \\&= n_I kT
\end{aligned}
$$
和理想气体状态方程给出的压强一致。

气体（平均）分子量为$\mu_I$，也可以写成
$$ P_I = \frac{R}{\mu_I}\rho T $$

## 电子压强

### 电子气体的压强
将电子气体看做理想气体，也有
$$ P_e = n_e kT $$
离子$i$充分电离，放出$Z_i$个电子，产生的电子的数密度为
$$ n_e = \sum_i n_iZ_i = \frac{\rho}{m_H}\sum_i X_i \frac{Z_i}{A_i} $$
定义电子气体的等效平均分子量
$$ \frac{1}{\mu_e} = \sum_i X_i \frac{Z_i}{A_i} $$
$X_i$是原子$i$占的质量分数。  
一般地，
$$ \frac{1}{\mu_e} = X + \frac{1}{2}Y + (1-X-Y)\left<\frac{Z_i}{A_i}\right> $$
$X$为氢的质量分数，$Y$为氦，其余为金属元素。一般有$Z_i/A_i\sim 1/2$，从而
$$ \frac{1}{\mu_e} \approx \frac{1}{2}(X+1) $$
对太阳，$\mu_e\approx 1.17$。  
对氢耗尽的恒星，$X=0$，$\mu_e\approx 2$。

### 总压强
由道尔顿分压定律，总压强
$$ P_\mathrm{gas} = P_I+P_e = \left(\frac{1}{\mu_I} + \frac{1}{\mu_e}\right) R\rho T $$
混合气体的平均分子量$\mu$定义为
$$ \frac{1}{\mu} = \frac{1}{\mu_I} + \frac{1}{\mu_e} $$
从而压强仍可写为
$$ P_\mathrm{gas} = \frac{R}{\mu} \rho T $$
上面的结论依赖如下近似：
- 忽略分子之间的电磁相互作用，看作理想气体
- 假设离子都是完全电离的
- 不考虑相对论效应，不考虑简并压

### 量子简并压

费米动量
$$ p_F = \left(\frac{3h^2n_e}{8\pi}\right)^{1/3} $$
考虑$0K$的费米分布作为近似，由压强积分给出量子简并压
$$
\begin{aligned}
  P_{\mathrm{e,deg}} &= \frac{1}{3}\int_0^{p_F} \frac{p}{m_e}pn_e(p)\mathrm{d}p
\\&= \frac{h^2}{20m_e}\left(\frac{3}{\pi}\right)^{2/3}\left(\frac{\rho}{m_H\mu_e}\right)^{5/3}
\end{aligned} \tag{*}
$$
可以看见简并压反比于粒子的质量，因此只有电子简并压需要考虑，离子的可以忽略不计。只有在极高密度的情况下才会出现核子的简并态（中子星）。

$T\sim 0K$附近，电子动能远大于库伦势能$E_k=\frac{p_F^2}{2m_e}\gg \epsilon$，可近似看为自由电子气。在恒星演化的过程中，恒星氢燃料耗尽而氦聚变还未点燃时，温度很低（相比于电子的费米温度），可以近似看为此情况。

简并电子气的压强可简写为
$$ P_{\mathrm{e,deg}} = K_1 \rho^{5/3} $$
$K_1$是常数，带入氢耗尽（$\mu=2$）的恒星，有
$$ k_1 \approx 3.15\times10^{12} \mathrm{dyn}\cdot\mathrm{cm}^{-2} $$

### 相对论性电子简并压
恒星的氢燃料耗尽后，没有辐射压，恒星由于自引力快速收缩，$\Delta V$降低，从而$\Delta p$上升，电子速率可以接近光速。此时的电子是相对论性简并电子气。

对相对论性电子使用近似$v\sim c$，压强积分为
$$ P_\mathrm{e,r-deg} = \frac{hc}{8}\left(\frac{3}{\pi}\right)^{1/3}\left(\frac{\rho}{m_H\mu_e}\right)^{4/3} $$
或
$$ P_\mathrm{e,r-deg} = K_2 \rho^{4/3} $$

## 辐射压

温度$T$的热平衡态下的光子气体，动量$p=h\nu/c$。从而动量空间分布$n(p)\mathrm{d}p$取决于频率空间分布。黑体辐射的普朗克公式：
$$ n(\nu)\mathrm{d}\nu = \frac{8\pi\nu^2}{c^3}\frac{\mathrm{d}\nu}{e^{h\nu/kT}-1} $$
带入压强积分：
$$ P_{\mathrm{rad}} = \frac{1}{3}\int_0^{\infty} vpn(p)\mathrm{d}p = \frac{1}{3}\int_0^{\infty} c\frac{h\nu}{c}n(\nu)\mathrm{d}\nu = \frac{1}{3}aT^4 $$
其中
$$ a=\frac{8\pi^5k^4}{15c^3h^3}=\frac{4\sigma}{c} $$
其中$\sigma$为Stefan-Boltzmann常量。$a$则称为黑体辐射常量。

热力学中给出黑体辐射的能量密度$u=aT^4$，故$P_{\mathrm{rad}}=u/3$。

## 气体和辐射的内能

气体的比内能定义为单位质量气体的内能。对理想气体，即粒子热运动的动能。从而
$$ u = \frac{1}{\rho}\int_0^{\infty} \epsilon(p)n(p)\mathrm{d}p $$
其中$\epsilon$为单个粒子动能。对单一成分气体，粒子质量$m_g$：  
非相对论的$\epsilon(p)=p^2/2m_g$  
相对论的$\epsilon(p)=\gamma mc^2-mc^2$。再根据$p=\gamma mc^2$，有：
$$ \epsilon(p) = m_g c^2\left[ \left(1+\frac{p^2}{m_gc^2}\right)^{1/2}-1 \right] $$

内能密度$u|$定义为单位体积气体的内能。对非相对论性理想气体：
$$ u|=n\epsilon=\frac{3}{2}nkT=\frac{3}{2}P $$
比内能
$$ u_\mathrm{gas} = \frac{u|}{\rho} = \frac{3}{2}\frac{P_\mathrm{gas}}{\rho} $$

对非相对论性简并气体，类似地有
$$ u=\frac{3}{2}\frac{P_{\mathrm{gas,deg}}}{\rho} $$
对相对论性的简并气体，
$$ u = \frac{1}{\rho}\int_0^{p_F}\epsilon(p)n(p)\mathrm{d}p = 3\frac{P_{\mathrm{gas,r,deg}}}{\rho} $$
对辐射，能量密度为
$$ \int_0^{\infty} h\nu n(\nu)\mathrm{d}\nu = aT^4 $$
光子没有质量，但由于是在恒星中，可以考虑单位质量的恒星气体的体积中辐射的能量作为辐射的比内能：
$$ u_{\mathrm{rad}} = \frac{aT^4}{\rho} = 3\frac{P_\mathrm{rad}}{\rho} $$
总结：
- 对非相对论性气体，
  $$ u=\frac{3}{2}\frac{P}{\rho} $$
- 对相对论性气体（包括光子）：
  $$ u=3\frac{P}{\rho} $$

## 绝热指数

### 恒星气体的近似绝热过程
$\mathrm{d}Q=0$时，能量方程成为
$$ \mathrm{d}u + P\mathrm{d}\left(\frac{1}{\rho}\right) = 0 $$
上一节给出$u=\Phi P/\rho$，$\Phi$为常数。代入上式，解得
$$ P = k_a\rho^{\gamma_a} $$
其中
$$ \gamma_a = \frac{\Phi+1}{\Phi} $$
为绝热指数。

对非相对论气体，$\Phi=3/2$，$\gamma_a=5/3$。  
对相对论性气体，$\Phi=3$，$\gamma_a=4/3$。  
而对一般物态（气体和辐射混合，或中等速度的气体），$\gamma_a$介于二者之间。

### 部分电离
定义电离度
$$ x = \frac{n_+}{n_0+n_+} $$
其中$n_0$为中性氢的数密度，$n_+$为氢离子（电子）的数密度。

对混合理想气体，物态方程为
$$ P=nkT $$
粒子的总数密度为
$$ n=n_0+n_e+n_+ = (x+1)(n_0+n_+) $$
从而物态方程成为
$$ P=(x+1)(n_0+n_+)Rm_HT = (x+1)R\rho T $$
在温度$T$下，离子电离和复合过程达到动态平衡，满足**Saha方程**：
$$ \frac{n_+n_e}{n_0} = \frac{g}{h^3}(2\pi m_ekT)^{3/2} e^{-\chi/kT} $$
其中$\chi$为电子的电离势能。

根据电离度的定义：
$$ \frac{n_+n_e}{n_0} = \frac{x^2(n_0+n_+)^2}{(n_0+n_+)-x(n_0+n_+)} = \frac{x^2}{1-x}(n_0+n_+) $$
对Saha方程两边乘因子$1/((1+x)(n_0+n_+))=1/n$，成为：
$$ \frac{x^2}{1-x^2} = \frac{g}{h^3}\frac{(2\pi m_e)^{3/2}(kT)^{5/2}}{P} e^{-\chi/kT} $$

单位体积内$n_+$个氢原子被电离，释放电离能$\chi n_+$都转化为气体内能。从而电离对气体比内能的贡献为
$$ \frac{\chi n_+}{\rho} = \frac{\chi n_+}{(n_0+n_+)m_H} = \frac{\chi}{m_H}x $$
从而部分电离气体的比内能为
$$ u = \frac{3}{2}\frac{P}{\rho} + \frac{\chi}{m_H}x $$
对$u$全微分，绝热过程
$$
\begin{aligned}
  \mathrm{d}u &= -P\mathrm{d}\left(\frac{1}{\rho}\right)
  \\ &= \frac{3}{2}\left(\frac{1}{\rho}\right)\mathrm{d}P + \frac{3}{2}P\mathrm{d}\left(\frac{1}{\rho}\right) + \frac{\chi}{m_H}\left(\frac{\partial x}{\partial P}\right)_\rho\mathrm{d}P + \frac{\chi}{m_H}\left(\frac{\partial x}{\partial \rho}\right)_P\mathrm{d}\rho
\end{aligned}
$$
从而得到
$$ \frac{3}{2}\left(\frac{1}{\rho}\right)\mathrm{d}P + \frac{5}{2}P\mathrm{d}\left(\frac{1}{\rho}\right) + \frac{\chi}{m_H}\left(\frac{\partial x}{\partial P}\right)_\rho\mathrm{d}P + \frac{\chi}{m_H}\left(\frac{\partial x}{\partial \rho}\right)_P\mathrm{d}\rho = 0 $$
各项乘$\rho/P$，上式成为：
$$ \left[ \frac{3}{2} + \frac{\chi}{kT}\frac{P}{1+x}\left(\frac{\partial x}{\partial P}\right)_\rho \right]\frac{\mathrm{d}P}{P} -\left[ \frac{5}{2} - \frac{\chi}{kT}\frac{\rho}{1+x}\left(\frac{\partial x}{\partial \rho}\right)_P \right] \frac{\mathrm{d}\rho}{\rho} = 0 $$
此时绝热指数
$$
\begin{aligned}
  \gamma_a &= \frac{\mathrm{d}\ln P}{\mathrm{d}\ln \rho} = \frac{\mathrm{d}P/P}{\mathrm{d}\rho/\rho}
  \\&= \frac{\frac{5}{2}-\frac{\chi}{kT}\frac{\rho}{1+x}\left(\frac{\partial x}{\partial \rho}\right)_P}{\frac{3}{2} + \frac{\chi}{kT}\frac{P}{1+x}\left(\frac{\partial x}{\partial P}\right)_\rho}
  \\&= \frac{\frac{5}{2}-\frac{\chi}{kT}\frac{\partial \ln(1+x)}{\partial \ln\rho}|_P}{\frac{3}{2} + \frac{\chi}{kT}\frac{\partial \ln(1+x)}{\partial \ln P}|_\rho}
\end{aligned}
$$
由Saha方程，
$$ \ln\frac{x^2}{1-x^2} = \ln\left(\frac{g}{h^3}(2\pi m_e)^{3/2}k^{5/2}\right) + \frac{5}{2}\ln T - \ln P - \frac{\chi}{kT} $$
求微分：
$$ \frac{2}{x(1-x)}\mathrm{d}\ln(1+x) = -\mathrm{d}\ln P + \frac{5}{2}\mathrm{d}\ln T + \frac{\chi}{kT}\mathrm{d}\ln T $$
再联立物态方程
$$ \mathrm{d}\ln P = \mathrm{d}\ln(1+x) + \mathrm{d}\ln\rho + \mathrm{d}\ln T $$
得到
$$ \frac{\partial \ln(1+x)}{\partial \ln\rho}\bigg |_P = -\frac{\frac{5}{2}+\frac{\chi}{kT}}{\frac{2}{x(1-x)}+\frac{5}{2}+\frac{\chi}{kT}} $$
$$ \frac{\partial \ln(1+x)}{\partial \ln P}\bigg |_\rho = \frac{\frac{3}{2}+\frac{\chi}{kT}}{\frac{2}{x(1-x)}+\frac{5}{2}+\frac{\chi}{kT}} $$
从而不完全电离气体的绝热系数
$$ \gamma_{\mathrm{a}}(x)=\frac{5+\left(\frac{5}{2}+\frac{x}{k T}\right)^{2} x(1-x)}{3+\left[\frac{3}{2}+\left(\frac{3}{2}+\frac{x}{k T}\right)^{2}\right] x(1-x)} $$
讨论：
- 对$x=1$（完全电离）和$x=0$（完全不电离）的情况，都有$\gamma_a=5/3$。
- 对部分电离，绝热指数还取决于温度。

## 辐射转移

### 辐射的吸收
定义辐射流量$F$为单位时间通过单位横截面的能量。

辐射通过厚$\mathrm{d}r$的介质薄层，流量减少$-\mathrm{d}F$。对密度$\rho$的介质，有经验公式
$$ \mathrm{d}F = -\kappa F\rho\mathrm{d}r = -k_\nu F \mathrm{d}r $$
常数$\kappa$称为**不透明度系数**。称$k_\nu=\kappa\rho$为介质的**吸收系数**（依赖辐射的频率）。  
$k_\nu$为具长度-1次方量纲，统计物理给出$k_\nu^{-1}$的物理意义即为光子的平均自由程。

定义$\mathrm{d}\tau=k_\nu\mathrm{d}r$，称为介质的**光深**。  
在恒星内部，对辐射不透明，$\tau\sim\infty$；光球层和以外，对辐射透明，$\tau\sim 1$。

对厚$R$的均匀介质，积分有
$$ F = F_0 e^{-\kappa\rho R} $$
出射流量按指数衰减。

介质中光子和物质相互作用的机制有：
- 电子散射：光子和电子两体碰撞，光子改变方向
  - 汤姆逊散射：弹性散射，光子动量不改变，从而频率$\nu$也不改变。光子方向改变，无法再被探测到，等效于被介质吸收（吸收机制）。
  - 康普顿散射：光子的能量传给电子，频率降低，运动方向改变，吸收机制
- 自由-自由吸收：自由电子吸收光子，末态仍为自由电子。（韧致辐射的逆过程）
- 束缚-自由吸收：原子中的束缚态电子吸收光子，成为自由电子，也称光致电离过程。（复合过程的逆过程）
- 束缚-束缚吸收：原子中电子吸收光子从低能级跃迁到高能级。

介质的不透明度有经验公式：
$$ \kappa = \kappa_0 \rho^a T^b $$
$a,b$对不同相互作用机制有不同值。
- 电子汤姆逊散射，$a\approx 0,b\approx 0$。
  $$ \kappa_{\mathrm{es}} = \frac{\kappa_{\mathrm{es},0}}{\mu_e} \approx \frac{1}{2}\kappa_{\mathrm{es},0}(1+X) $$
  $\kappa_{\mathrm{es},0}=\sigma_T/m_H$，$\sigma_T$为电子的散射截面。
- 自由-自由吸收：
  $$ \kappa_{\mathrm{ff}} = \frac{\kappa_{\mathrm{ff},0}}{\mu_e} \left<\frac{Z^2}{A}\right> \rho T^{-7/2} \approx \frac{1}{2}\kappa_{\mathrm{ff},0}(1+X)\left<\frac{Z^2}{A}\right> \rho T^{-7/2}  $$

### 辐射转移
若恒星内部类似太阳，光子的平均自由程$l\sim 1\mathrm{cm}$，厚$l$的球壳可以近似为单一温度黑体。  
流量$F$，则单位时间、单位面积吸收的光子动量（也就等于净辐射压强）为
$$ \frac{|\mathrm{d}F|}{c} = \frac{\kappa\rho F\mathrm{d}r}{c} = P_\mathrm{rad}(r) - P_\mathrm{rad}(r+\mathrm{d}r) $$
即：
$$ -\frac{\mathrm{d}P_\mathrm{rad}}{\mathrm{d}r} = \frac{\kappa\rho F}{c} $$
对黑体辐射，
$$ P_\mathrm{rad} = \frac{1}{3}aT^4 $$
从而
$$ F = -\frac{4acT^3}{3\kappa\rho}\frac{\mathrm{d}T}{\mathrm{d}r} $$
由于光度$L=4\pi r^2 F$，上式可以写成：
$$ \frac{\mathrm{d}T}{\mathrm{d}r} = -\frac{3}{4ac}\frac{\kappa\rho}{T^3}\frac{L}{4\pi r^2} $$
或者
$$ \frac{\mathrm{d}T}{\mathrm{d}m} = -\frac{3}{4ac}\frac{\kappa}{T^3}\frac{L}{(4\pi r^2)^2} $$
至此结构方程组已完备。加上聚变产能率的方程可以得到完整的恒星演化方程。