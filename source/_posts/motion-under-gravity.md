---
title:      Motion under gravity
description: 星系天文学课程笔记 3.1
date:       2019-11-16
author:     y
mathjax:    true
categories:
    - 笔记
    - 星系天文学笔记
tags:
    - 天文
---

星系动力学：
- 恒星轨道决定星系形态
- 引力势决定恒星轨道
- 星系质量分布（形态）决定引力势

## 3.1 Motion under gravity

恒星系统产生的引力势：

$$\Phi(x)=-\int \frac{G\rho(x')}{|\mathbf{x}-\mathbf{x'}|}d\mathbf{x'}$$

引力势和密度的关系有泊松方程：

$$ \nabla^2\Phi(x) = 4\pi G\rho(x) $$

选择一种方便处理的势函数，可以得到物质分布。

### 模型
- 质点
- 均匀球
- 奇异等温球：描述暗物质的分布
  
  $$\rho_{SIS}=\frac{\rho(r_0)}{(r-r_0)^2},\quad\Phi_{SIS}(r)=V_H^2 \ln \frac{r}{r_0}$$

  其中$V_H=4\pi Gr_0^2\rho(r_0)$是不同半径处的圆周速度（为常数），描述旋转曲线为平的质量分布。
- Plummer球：描述星团、球形星系的分布
  
  $$\rho_P(r)=\frac{3a_P^2}{4\pi}\frac{M}{(r^2+a_P^2)^{5/2}},\quad\Phi_P(r)=-\frac{GM}{\sqrt{r^2+a_P^2}}$$

- Kuzmin盘：盘模型（质量分布在面上）
  
  $$\Sigma_K(R)=\frac{a_K}{2\pi}\frac{M}{(R^2+a_K^2)^{3/2}},\quad\Phi_K(R,z)=-\frac{GM}{\sqrt{R^2+(a_K+|z|)^2}}$$


星系的模型：核球用Plummer球，盘用Kuzmin盘，暗物质晕用修改的奇异等温球描述。

由于球对称的物体对外部的引力相当在中心的质点的引力，可以通过星系近圆轨道上的恒星或气体的速度估计轨道内部的质量。

### 位力定理
考虑N个粒子的自引力系统中的一颗恒星：

$$\frac{d}{dt}(m_{\alpha}\mathbf v_{\alpha})=-\sum_{\beta\neq\alpha}\frac{Gm_{\alpha}m_{\beta}}{|x_{\alpha}-x_{\beta}|^3}(\mathbf x_{\alpha}-\mathbf x_{\beta})$$

与$\mathbf x_{\alpha}$点乘，再对$\alpha$求和：

$$
\begin{aligned}
&\sum_{\alpha}\frac{d}{dt}(m_{\alpha}\mathbf v_{\alpha})\cdot\mathbf x_{\alpha}= -\sum_{\beta\neq\alpha}\frac{Gm_{\alpha}m_{\beta}}{|x_{\alpha}-x_{\beta}|^3}(\mathbf x_{\alpha}-\mathbf x_{\beta})\cdot\mathbf x_{\alpha}
\\\\ 左&=\frac{1}{2}\sum_{\alpha}\frac{d^2}{dt^2}(m_{\alpha}\mathbf x_{\alpha}\cdot\mathbf x_{\alpha}) - \sum_{\alpha}m_{\alpha}\mathbf v_{\alpha}\cdot\mathbf v_{\alpha} = \frac{1}{2}\frac{d^2I}{dt^2}-2\mathcal{KE}
\\\\右&=-\frac{1}{2}\sum_{\beta\neq\alpha}\frac{Gm_{\alpha}m_{\beta}}{|x_{\alpha}-x_{\beta}|^3}(\mathbf x_{\alpha}-\mathbf x_{\beta})\cdot(\mathbf x_{\alpha}-\mathbf x_{\beta}) = \mathcal{PE}
\end{aligned}
$$

得到：

$$2\mathcal{KE}+\mathcal{PE} = \frac{1}{2}\frac{d^2I}{dt^2}$$

其中$I=\sum_{\alpha}m_{\alpha}x_{\alpha}^2$为系统的惯性矩。对上式求时间平均，对任意有界、稳定的自引力系统，有：

$$2\left< \mathcal{KE} \right>+\left< \mathcal{PE} \right>=0$$

即得到位力定理。

利用位力定理可以测量星团质量。假设星团各处质光比为常数，测量星团的速度弥散$\sigma_r^2=\left<V_r^2\right>$，假设速度分布是各向同的，动能估计为：

$$\mathcal{KE}\simeq \frac{3}{2}\sigma_r^2(M/L)L_{tot}$$

另外，根据星团的面亮度分布确定其体密度，从而确定势能：

$$\mathcal{PE}=-\frac{1}{2}\iint \frac{G\rho(\mathbf{x})\rho(\mathbf{x'})}{\left|\mathbf{x}-\mathbf{x'}\right|}d^3\mathbf{x}d^3\mathbf{x'}$$

利用位力定理即可得到星团的质光比，从而测得质量。

另一种方法估算的势能是：$\mathcal{PE}=-GM_{tot}^2/(2\eta R_{tot})$，其中$\eta$是具有1的量级的常数。采用不同的模型（如Plummer球的$\eta\approx 2.6$），我们可以计算出$eta$的具体值。根据位力定理，星团的质量估计为：

$$ M\simeq 6\eta \sigma_r^2R_{tot}/G $$