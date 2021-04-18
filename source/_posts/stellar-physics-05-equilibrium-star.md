---
title:       恒星的内部结构——简单模型
description: 恒星物理笔记（五）
date:        2020-09-08 16:38:12
mathjax:     true
categories:
    - 笔记
    - 恒星物理笔记
tags:
    - 天文
---

## 恒星结构方程组

假设：流体静力学平衡，热平衡，结构方程组为
$$ \frac{\mathrm{d} P}{\mathrm{d} r}=-\rho \frac{G m}{r^{2}} $$
$$ \frac{\mathrm{d} m}{\mathrm{d} r}=4 \pi r^{2} \rho $$
$$ \frac{\mathrm{d} T}{\mathrm{d} r}=-\frac{3}{4 a c} \frac{\kappa \rho}{T^{3}} \frac{F}{4 \pi r^{2}} $$
$$ \frac{\mathrm{d} F}{\mathrm{d} r}=4 \pi r^{2} \rho q $$
或
$$ \frac{\mathrm{d} P}{\mathrm{d} m}=-\frac{G m}{4 \pi r^{4}} $$
$$ \frac{\mathrm{d} r}{\mathrm{d} m}=\frac{1}{4 \pi r^{2} \rho} $$
$$ \frac{\mathrm{d} T}{\mathrm{d} m}=-\frac{3}{4 a c} \frac{\kappa}{T^{3}} \frac{F}{\left(4 \pi r^{2}\right)^{2}} $$
$$ \frac{\mathrm{d} F}{\mathrm{d} m}=q $$
附加方程：
1. 物态方程（离子+电子+辐射）
   $$ P = \frac{\mathcal{R}}{\mu}\rho T + \frac{1}{3}aT^4 $$
2. 不透明度的经验关系
   $$ \kappa = \kappa_0 \rho^a T^b $$
3. 核产能率的经验关系
   $$ q = q_0 \rho^m T^n $$

再结合边界条件：
- 内边界条件：$r=0$时，$m=0,F=0$
- 外边界条件：$r=R$时（恒星本体外边界，光球层内边界），$m=M,P\approx 0(P(R)\ll P_c),F=L$

可以解出
$$ T=T(m),\ \rho=\rho(m),\ r=r(m),\ F=F(m) $$

结构方程组有如下性质：
- 高度非线性
- 未知量相互耦合
- 为两点边界问题

一般需要数值方法迭代求解，或者进行简化假设，求简单解

## 简单的恒星模型：均匀特性

思路：寻找不依赖$r$和$m$的合适的物理量，并假设它在恒星中是均匀的

可以假设年轻恒星中元素丰度是均匀的，$\mathbf{X}(r)=\mathrm{const}$。理由：
- 恒星形成前，气体由于引力收缩，有微弱的红外和毫米波辐射，同时有发达的对流区，可以将气体充分混合（林忠四郎阶段）
- 对重元素多的恒星，电离产生大量自由电子，从而电子压主导。电子可以从内到外自由运动，近似是均匀的。
- 年轻恒星没有形成洋葱结构，可以认为化学组分是均匀的

考虑这一近似下恒星的物理特性：
- 压强$P$从内到外单调下降
- 温度$T$从内到外单调下降，在厚$\Delta r\ll R$的壳层内$T\sim\mathrm{const}$，近似有局域热动平衡(LTE)
- $q$通常对温度非常敏感，导致在远离中心的壳层中$q(r)\ll q_\mathrm{core}$，对总光度的贡献可以忽略不计  
  因此可以近似认为核反应只在中心核区$r_\mathrm{core}\ll R$发生，可以近似为点源，核区$q=q_\mathrm{nuc}$  
  恒星结构方程各参数相耦合，因此$q_\mathrm{nuc}$是可以决定恒星结构和演化的关键的量

## 多方球理论

恒星气体的物态方程给出$P=P(\rho,T)$，$P$对$T$的依赖导致恒星结构方程前两个和后两个的耦合。如果能独立地给出$T=T(\rho)$，可以使前两个方程与后两个解耦。

流体静力学平衡方程
$$ \frac{\mathrm{d} P}{\mathrm{d} r}=-\rho \frac{G m}{r^{2}} $$
对$r$求导，
$$ \frac{\mathrm{d}}{\mathrm{d}r}\left(\frac{r^2}{\rho}\frac{\mathrm{d} P}{\mathrm{d} r}\right) = -G\frac{\mathrm{d}m}{\mathrm{d}r} $$
即
$$ \frac{1}{r^2}\frac{\mathrm{d}}{\mathrm{d}r}\left(\frac{r^2}{\rho}\frac{\mathrm{d} P}{\mathrm{d} r}\right) = -4\pi G \rho \tag{*} $$

考虑**多方过程**的物态方程：
$$ P = k\rho^\gamma $$
$\gamma$也可以写成$\gamma=1+1/n$  
考虑静态的恒星，在$r\sim r+\mathrm{d}r$的壳层上，没有径向运动且内能密度不变，从而$\delta Q=0$，这一壳层中气体经历绝热过程。  
对非相对论性气体，$\gamma=5/3$；对相对论性气体，$\gamma=4/3$  
代入(*)，有
$$ \frac{k}{4\pi G}\frac{n+1}{n}\frac{1}{r^2}\frac{\mathrm{d}}{\mathrm{d}r}\left(\frac{r^2}{\rho^{(n-1)/n}}\frac{\mathrm{d} \rho}{\mathrm{d} r}\right) = -\rho \tag{1} $$
考虑边界条件：
- 内边界$r=0$，$\rho$极大，$\frac{\mathrm{d}\rho}{\mathrm{d}r}=0$。  
  另外，由$r\rightarrow 0$时$m(r)\sim \rho r^3$，
  $$ \left. \frac{\mathrm{d} P}{\mathrm{d} r}\right|_{r=0} = \left. -\rho \frac{G m}{r^{2}} \right|_{r=0} = 0 $$
  即压强在中心点也为极大。
- 外边界$r=R$，$P\approx 0$，由物态方程$\rho\approx 0$

若能从(1)式解出$\rho(r)$，就可以积分出恒星的质量和压强分布。

### Lane-Emden方程
为了使得到的解具有普适性，用恒星的特征物理量（如$M,R$）将方程无量纲化：  
令
$$ \rho = \rho_c \theta^n $$
无量纲的$\theta$满足$0\le \theta \le 1$，$\theta(r=0)=1,\theta(r=R)=0$，从内到外单调下降。  
(1)式成为：
$$ \frac{(n+1)k}{4\pi G \rho_c^{(n-1)/n}} \frac{1}{r^2}\frac{\mathrm{d}}{\mathrm{d}r}\left(r^2\frac{\mathrm{d}\theta}{\mathrm{d} r}\right) = -\theta^n \tag{2} $$
令
$$ \frac{(n+1)k}{4\pi G \rho_c^{(n-1)/n}} = \alpha^2 $$
$\alpha$为具有长度量纲的常量，可以认为是恒星的某种热力学特征尺度。用$\alpha$无量纲化$r$，即令：
$$ r = \alpha \xi $$
$\xi$就是无量纲化的径向距离。  
(2)就成为
$$ \xi^2\theta^n = -\frac{\mathrm{d}}{\mathrm{d}\xi}\left(\xi^2\frac{\mathrm{d}\theta}{\mathrm{d} \xi}\right) $$
称为**Lane-Emden方程**。

$0\le\xi\le \xi_1=R/\alpha$，边界条件为：
- $\xi=0$时，$\theta=1,\frac{\mathrm{d}\theta}{\mathrm{d}\xi}=0$。
- $\xi=\xi_1$时，$\theta=0$。

数值方法求解$\theta=\theta(\xi)$，可以得到$\rho/\rho_c\sim r/R$关系。

### 无量纲参数$M_n,D_n,R_n,B_n$
考虑恒星的总质量
$$
\begin{aligned}
   M &= \int_0^R 4\pi r^2 \rho(r) \mathrm{d}r
   \\&= 4\pi \alpha^3\rho_c \int_0^{\xi_1} \xi^2\theta^n \mathrm{d}\xi
   \\&= 4\pi \alpha^3\rho_c \int_0^{\xi_1} \frac{\mathrm{d}}{\mathrm{d}\xi}\left(\xi^2\frac{\mathrm{d}\theta}{\mathrm{d} \xi}\right) \mathrm{d}\xi
   \\&= -4\pi \alpha^3\rho_c \xi_1^2 \left. \frac{\mathrm{d}\theta}{\mathrm{d} \xi}\right|_{\xi_1}
   \\&= 4\pi \alpha^3\rho_c M_n
\end{aligned}
$$
其中
$$ M_n = -\xi_1^2 \left. \frac{\mathrm{d}\theta}{\mathrm{d} \xi}\right|_{\xi_1} $$
是与$n$有关的无量纲参量，可以由关系曲线导出。

考虑中心密度$\rho_c$，令
$$ \rho_c = D_n \bar{\rho} = D_n \frac{M}{\frac{4}{3}\pi R^3} $$
从而无量纲参数
$$ D_n = \frac{4\pi R^3\rho_c}{3M} = -\left[\frac{3}{\xi_1} \left. \frac{\mathrm{d}\theta}{\mathrm{d} \xi}\right|_{\xi_1}\right]^{-1} $$
对不同的$n<5$，一般$D_n$和$R_n=\xi_1$取值都在$1\sim10$之间。

根据$M_n,R_n$的定义，可导出如下关系
$$ \left(\frac{GM}{M_n}\right)^{n-1} \left(\frac{R}{R_n}\right)^{3-n} = \frac{[(n+1)k]^n}{4\pi G} $$
即对确定的EoS，主序星的$M$和$R$有一一对应，称为**质量-半径关系**。

由质量-半径关系式，可以看出$n=3$时（相对论性气体），$R/R_n$的项消失，$M=\mathrm{const}$不依赖$R$；$n=1$时，$M/M_n$的项消失，$R=\mathrm{const}$不依赖$M$。  
$1 < n < 3$时，$R$与$M$负相关。

由质量-半径关系可以给出$k$和$M,R$的关系，带入物态方程，得到中心压强：
$$ P_c = \frac{(4\pi G)^{1/n}}{n+1}\left(\frac{GM}{M_n}\right)^{\frac{n-1}{n}}\left(\frac{R}{R_n}\right)^{\frac{3-n}{n}}\rho_c^{\frac{n+1}{n}} $$
用$D_n$消去$R$：
$$
\begin{aligned}
    P_c &= \frac{(4\pi G)^{1/n}}{n+1}\left(\frac{GM}{M_n}\right)^{\frac{n-1}{n}} \left[ \left(\frac{3D_n}{4\pi}\right)^{\frac{1}{3}}M^{\frac{1}{3}}\rho_c^{-\frac{1}{3}} \right]^{\frac{3-n}{n}} \left(\frac{1}{R}\right)^{\frac{3-n}{n}} \rho_c^{\frac{n-1}{n}}
    \\&= (4\pi)^{1/3}B_n GM^{2/3} \rho_c^{4/3}
\end{aligned}
$$
其中无量纲参量
$$ B_n = \frac{1}{n+1} \left(\frac{1}{M_n}\right)^{\frac{n-1}{n}}(3D_n)^{\frac{3-n}{3n}}R_n^{\frac{n-3}{n}} $$
与$n$有关，且是由$M_n,D_n,R_n$导出的。

## 钱德拉塞卡极限

白矮星是恒星耗尽核燃料后由于自引力塌缩，内部电子简并压抵抗引力，维持稳定星体结构的天体。$M\sim M_\odot, R\sim 10^4\mathrm{km}$

### 电子简并压
非相对论性简并电子气的物态方程为
$$ P_{\mathrm{e,deg}} = k_1 \rho^{5/3} $$
即$\gamma=5/3,n=3/2,k=k_1$的多方球模型。

质量-半径关系给出$R\propto M^{-1/3}$，$\bar{\rho}\propto M/R^3\propto M^2$  
对典型白矮星，$M\sim M_\odot, R\sim 10^4\mathrm{km}$，$\bar{\rho}\sim 10^5 \mathrm{g\cdot cm^{-3}}$，属于致密星。

如果让白矮星质量增大，则其密度也将增大，电子数密度增大，由不确定性原理，其动量也将增大，电子的物态将成为极端相对论性。其物态方程为：
$$ P_{\mathrm{e,r-deg}} = k_2 \rho^{4/3} $$
对应参数$\gamma=4/3,n=3,k=k_2$。按多方球理论，$n=3$时$M$为常量，不能继续变大，即$M$达到最大值。
$$ M_{\mathrm{ch}} = 4\pi M_3 \left(\frac{k_2}{\pi G}\right)^{3/2} = 5.83\mu_e^{-2}M_\odot $$
为钱德拉塞卡质量，是白矮星质量的上限。

$\mu_e$有两种情况：
- 氢耗尽，主要是氦，此时$\mu_e\approx 2$，$M_{\mathrm{ch}}=1.46M_\odot$
- 中心铁核，此时$\mu_e\approx 2.15$，$M_{\mathrm{ch}}=1.26M_\odot$

## 爱丁顿（极限）光度

由辐射转移方程，
$$ \frac{\mathrm{d}P_\mathrm{rad}}{\mathrm{d}r} = -\frac{\kappa \rho H}{c} = -\frac{\kappa \rho}{c} \frac{F}{4 \pi r^{2}} $$
再根据流体静力学平衡
$$ \frac{\mathrm{d} P}{\mathrm{d} r}=-\rho \frac{G m}{r^{2}} $$
有
$$ \frac{\mathrm{d}P_\mathrm{rad}}{\mathrm{d}P} = \frac{\kappa F}{4\pi cGm} $$
主序星辐射的能流向外，$F>0$，从而$\mathrm{d}P$和$\mathrm{d}P_\mathrm{rad}$符号相同。由于从内向外$P$和$P_\mathrm{gas}$都减小，故$\mathrm{d}P_\mathrm{rad}<\mathrm{d}P$，从而有
$$ \kappa F < 4\pi cGm $$

注意：在恒星外围壳层的对流区，氢氦充分电离，存在大量自由电子。若核区的磁流体不稳定性使核燃烧增强，$F$增大，导致更强的光致电离，使$n_e$增大，导致汤姆逊散射主导的$\kappa$增大。此时可能有$\kappa F>4\pi cGm$，需要引入对流机制转移多余的辐射的能量。

考虑热平衡方程
$$ \frac{\mathrm{d}F}{\mathrm{d}m} = q $$
- 中心$F(0)=0$，在中心附近，$F=q_cm$。  
  $\kappa F<4\pi cGm$给出
  $$ q_c < \frac{4\pi cG}{\kappa} $$
- 外边界$F(M)=L$， $\kappa F<4\pi cGm$给出
  $$ L < \frac{4\pi cGM}{\kappa} $$
  恒星外壳层产生不透明度的机制主要是汤姆逊散射，$\kappa\approx \kappa_{\mathrm{es}}$  
  理论上$\kappa_\mathrm{es}=\frac{\sigma_T}{m_Hc}$，其中$\sigma_T=6.25\times10^{-25} \mathrm{cm}^2$为电子的汤姆逊散射截面。  
  从而
  $$ L < L_\mathrm{Edd} = \frac{4\pi m_Hc^2GM}{\sigma_T} = 1.3\times10^{38} \left(\frac{M}{M_\odot}\right) \mathrm{erg\cdot s^{-1}} $$
  即对质量$M$给定的恒星，其光度有上限$L_\mathrm{Edd}$，称为爱丁顿光度。

若由于内部扰动，$L$超过$L_\mathrm{Edd}$，流体静力学平衡被破坏，$P_\mathrm{rad}$的值很大形成强星风，吹散恒星外包层，使恒星质量减小。

观测上，主序星有质光关系
$$ \log L \propto n\log M $$
结合$L < L_\mathrm{Edd}$，表明恒星质量存在上限。

## 标准模型（爱丁顿模型）

### 光度
引入无量纲参数$\eta$，使
$$ \frac{F(r)}{m(r)} = \eta \frac{L}{M} $$
与可观测量$L,M$联系起来。  
显然，在恒星表面，$\eta=1$。

则：
$$ \frac{\mathrm{d}P_\mathrm{rad}}{\mathrm{d}P} = \frac{\kappa F}{4\pi cGm} = \frac{\kappa \eta L}{4\pi cGM} = \frac{\kappa_s L}{4\pi cGM} $$
其中$\kappa_s=\kappa\eta$。

由于$q$对温度极端敏感，可以近似认为核区（点源）之外$q=0$。即对$r>0$，$F(r)\sim\mathrm{const}$。而向内$m(r)$减小，从而$\eta$增大，$\eta\ge 1$。  
另一方面，$\kappa\propto \rho T^{-7/2}$（电子自由-自由散射的Kramers不透明度）。近似认为$\kappa$和$\eta$抵消，$\kappa_s\sim\mathrm{const}$。而在外表面$\kappa=1\cdot\kappa(R)=\kappa(R)$，从而$\kappa_s$就是恒星外表面的不透明度。

$\kappa_s$是常数，从而积分得到：
$$ P_\mathrm{rad} = \frac{\kappa_s L}{4\pi cGM}P $$
定义$\beta=P_{\mathrm{gas}}/P$，则
$$ L = \frac{4\pi cGM}{\kappa_s}\frac{P_\mathrm{rad}}{P} = L_\mathrm{Edd}(1-\beta) $$
即**恒星的光度是爱丁顿光度的$1-\beta$倍**。

### 压强
总压强
$$
\begin{aligned}
    P &= \frac{P_\mathrm{rad}}{1-\beta} = \frac{aT^4}{3(1-\beta)}
    \\&= \frac{P_\mathrm{gas}}{\beta} = \frac{\mathcal{R}}{\beta \mu}\rho T
\end{aligned}
$$
从而有
$$ T^3 = \frac{3\mathcal{R}(1-\beta)}{a\mu\beta}\rho \tag{6.1} $$

对相对论性气体，$\gamma=4/3,n=3$，
$$ P = k\rho^{4/3} $$
多方球理论给出
$$ M = 4\pi M_3\left(\frac{k}{\pi G}\right)^{3/2} $$
从而
$$ k = \left(\frac{M}{4\pi M_3}\right)^{2/3}\pi G \tag{6.2} $$
另一方面，由理想气体方程，
$$ P = \frac{\mathcal{R}}{\beta \mu}\rho T = \frac{\mathcal{R}}{\beta \mu} \left[\frac{3\mathcal{R}(1-\beta)}{a\mu\beta}\right]^{1/3}\rho^{4/3} = k\rho^{4/3} $$
给出的$k$为
$$ k = \left[\frac{3\mathcal{R}^4(1-\beta)}{a\mu^4\beta^4}\right]^{1/3} \tag{6.3} $$
(6.2)=(6.3)，化简有
$$
\begin{aligned}
    1-\beta &= \frac{a(\pi G)^3M_\odot^2}{3\mathcal{R}^4(4\pi M_3)^2}\left(\frac{M}{M_\odot}\right)^2 \mu^4\beta^4
    \\&\approx 0.003 \left(\frac{M}{M_\odot}\right)^2 \mu^4\beta^4
\end{aligned}
$$
称为**Eddington四次方程**。
其解为：
![](05-1-Eddington-quartic-euqation.png)  
讨论：
- 小质量恒星$\beta\approx 1$，气体压主导，较稳定
- 大质量恒星$\beta\approx 0$，辐射压主导，不稳定
- 带入太阳丰度$\mu\approx 0.61$，对应质量范围$0.5M_\odot\le M \le 50M_\odot$，与观测基本一致。
- 对$\mu=\mathrm{const}$，小的$\beta$对应更大的$M$。
- 结合$L=L_\mathrm{Edd}(1-\beta)$，有：
  $$ \frac{L}{L_\odot} = 0.003\frac{4\pi cGM_\odot}{\kappa_s L_\odot}\mu^4\beta^4\left(\frac{M}{M_\odot}\right)^3 $$
  即约有$L\sim M^3$，称为恒星的**质光关系**。  
  上面的结果忽略了不同恒星化学组成不同，实际上由于$\beta=\beta(M,\mu)$，实际观测结果会有偏差
- 考虑相同质量，不同阶段（氢烧->氦烧->碳氧烧）的恒星，$\mu$增大，$\beta$减小，辐射压增大。光度接近爱丁顿光度时，会形成强烈的星风，吹散恒星外包层，使$M$下降，形成负反馈。

## 点源模型(Cowling模型)

假设核反应只发生在$r=0$一点，$r>0$时，$q=0$。从而$F(r)=F(R)=L$。  
另外假设主序前林忠四郎阶段充分对流，使恒星内外区域均匀混合，$\mu$为常数。  
不透明度$\kappa = \kappa_0 \rho^a T^b$。

从而有如下关系：
- 流体静力学平衡
  $$ \frac{\mathrm{d}P}{\mathrm{d}r} = -\frac{Gm\rho}{r^2} $$
- 各向同性的辐射流量密度
  $$ H = \frac{F}{4\pi r^2} = \frac{L}{4\pi r^2} $$
- 辐射转移
  $$ \frac{\mathrm{d}P_\mathrm{rad}}{\mathrm{d}r} = -\frac{\kappa \rho H}{c} = -\frac{\kappa_0 L}{c}\frac{\rho^{a+1}T^b}{4\pi r^2} $$
- 质量连续性方程
  $$ \frac{\mathrm{d}m}{\mathrm{d}r} = 4\pi r^2\rho $$
- 气体压
  $$ P_\mathrm{gas} = \frac{\mathcal{R}}{\mu}\rho T $$

进一步假设不确定度经验公式中$a=b=0$，即$\kappa=\kappa_0=\mathrm{const}$，联立流体静力学平衡和辐射转移方程，并结合$P=P_\mathrm{gas}+P_\mathrm{rad}$，有
$$ \frac{\mathrm{d}P_\mathrm{gas}}{\mathrm{d}P_\mathrm{rad}} = \frac{4\pi cG}{\kappa_0 L}m - 1 $$
对$r$求导，
$$ \frac{\mathrm{d}^2 P_\mathrm{gas}}{\mathrm{d}P_\mathrm{rad}^2}\frac{\mathrm{d}P_\mathrm{rad}}{\mathrm{d}r} = \frac{4\pi cG}{\kappa_0 L}\frac{\mathrm{d}m}{\mathrm{d}r} $$
代入辐射转移和质量连续性方程，
$$ \frac{\mathrm{d}^2 P_\mathrm{gas}}{\mathrm{d}P_\mathrm{rad}^2} = -\frac{64\pi^3 c^2G}{\kappa_0^2 L^2}r^4 \tag{7.1} $$

由气体的物态方程，
$$ \rho = \frac{\mu}{\mathcal{R}}\frac{P_\mathrm{gas}}{T} = \frac{\mu}{\mathcal{R}}\left(\frac{a}{3}\right)^{1/4} {P_\mathrm{gas}}P_\mathcal{rad}^{-1/4} $$
从而辐射转移方程的倒数：
$$ \frac{\mathrm{d}\left(\frac{1}{r}\right)}{\mathrm{d}P_\mathrm{rad}} = \frac{4\pi c}{\kappa_0 L\rho} = \frac{4\pi c}{\kappa_0 L}\frac{\mathcal{R}}{\mu}\left(\frac{3}{a}\right)^{1/4} {P_\mathrm{gas}}^{-1}P_\mathcal{rad}^{1/4} \tag{7.2} $$

(7.1)和(7.2)建立了变量$P_\mathrm{gas},P_\mathrm{rad},\frac{1}{r}$之间的关系。可以用数值方法求解。结果表明恒星存在质光关系
$$ \log L\propto n\log M $$
对中等质量恒星$n$较大（$n\sim 4.5$），对大质量恒星$n$较小（$n\sim 3.0$）。  
对小质量矮星，内部部分处于量子简并态，该方程组不适用。