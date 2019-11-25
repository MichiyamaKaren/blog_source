---
title:      电磁场方程
description: 电动力学笔记（四）
date:       2019-05-28
author:     y
mathjax:    true
categories:
    - 笔记
    - 电动力学笔记
tags:
    - 物理
---

# 1.拉氏量密度

电磁场体系完整的拉氏量为:
$$L = L_p + L_{pf} + L_f$$
这三项分别为粒子、粒子与场耦合和场的拉氏量。上一节只讨论了粒子在电磁场中的运动，故只涉及前两项，而现在要讨论的则是电磁场的方程，因此要关注的是后两项。

我们之前接触的拉氏量使用来描述粒子的运动的，那么如何使用拉氏量描述场呢？简单起见，我们先来考虑一个标量场$\phi(t,\mathbf x)$：我们可以把$\phi$看做广义坐标，时空坐标为作为参量，那么可以找到一个合适的拉氏量，用最小作用量原理推出场的方程$f(\phi, \partial_{\mu}\phi, x^{\mu}) = 0$。与粒子不同的一点是，场具有无穷的自由度——$\phi$作为广义坐标，需要空间中每个点的$\phi$值才能确定场的分布；而在每个点上，自由度是有限的。这相当于系统中存在连续分布的粒子，多粒子体系的拉氏量是单独的粒子的拉氏量之和，那么对于在空间中连续分布的场，拉氏量应为：
$$L = \int \mathscr L dxdydz $$
$\mathscr L$为**拉氏量密度**。从上面的讨论也可以看出，在考虑场的方程时，应给出的是拉氏量密度。

对拉氏量密度为$\mathscr L = \mathscr L(\phi, \partial_{\mu}\phi)$，则根据定义，作用量为：
$$S = \int\int \mathscr L d^3xdt = \int \mathscr L d\Omega $$
$d\Omega=dtdxdydz$是洛伦兹不变量，因此$\mathscr L$也应为洛伦兹不变量。下面用变分法推出场的E-L方程：
$$
\begin{align*}
\delta S &= \int \left[\left( \frac{\partial \mathscr L}{\partial \phi} \right)\delta\phi + \frac{\partial \mathscr L}{\partial (\partial_{\mu}\phi)}\delta(\partial_{\mu}\phi) \right] d\Omega
\\&= \int \left[\left( \frac{\partial \mathscr L}{\partial \phi} \right)\delta\phi + \frac{\partial \mathscr L}{\partial (\partial_{\mu}\phi)}\partial_{\mu}\delta\phi \right] d\Omega
\\&= \int \left[\frac{\partial \mathscr L}{\partial \phi} - \frac{\partial}{\partial x^{\mu}}\frac{\partial \mathscr L}{\partial (\partial_{\mu}\phi)} \right] \delta\phi d\Omega
\end{align*}
$$
其中用到了分部积分，$\delta\phi$在边界上为0。场的E-L方程和粒子的E-L方程具有类似的形式：
$$ \frac{\partial \mathscr L}{\partial \phi} - \frac{\partial}{\partial x^{\mu}}\frac{\partial \mathscr L}{\partial (\partial_{\mu}\phi)}=0 $$

# 2.电磁场的拉氏量密度
## 2.1 猜测电磁场的拉氏量密度

电磁场是矢量场，虽然和前面讨论的标量场不一样，但是E-L方程也有相同的形式：
$$ \frac{\partial \mathscr L}{\partial A^{\nu}} - \frac{\partial}{\partial x^{\mu}}\frac{\partial \mathscr L}{\partial (\partial_{\mu}A^{\nu})}=0 $$
即E-L方程对$A^{\nu}$的每个分量仍然成立。

我们可以猜测一下电磁场的拉氏量密度$\mathscr L_f$的形式。它应该满足以下性质：
1. 如1小节所述，$\mathscr L_f$应该是洛伦兹不变量
2. 应该具有规范对称性
3. 电磁场应该满足叠加原理，即电磁场方程应该是线性的，则应该有$\mathscr L_f \sim (\partial_{\mu}A^{\nu})^2$

事实上人们发现$\mathscr L_f$的形式是：
$$\mathscr L_f = -\frac 1 {4\mu_0 c} F^{\alpha\beta}F_{\alpha\beta} $$
很容易验证它是满足以上的要求的。

## 2.2 真空电磁场方程

将电磁场的拉氏量带入E-L方程，求得真空中的（即只考虑$\mathscr L_f$，不考虑$\mathscr L_{pf}$）电磁场方程为：
$$\frac 1 {\mu_0 c} \frac{\partial F_{\nu}^{\cdot\mu}}{\partial x^{\mu}}=0 $$
也可以乘$\eta_{\mu\gamma}$并改变自由指标得到：
$$\frac 1 {\mu_0 c} \frac{\partial F_{\nu\mu}}{\partial x^{\mu}}=0$$
将电磁场张量按照定义展开，得到：
$$\frac{\partial}{\partial x^{\nu}}\frac{\partial A^{\mu}}{\partial x^{\mu}}-\frac{\partial^2}{\partial x_{\mu}\partial x^{\mu}}A^{\nu}=0$$
选取洛伦兹规范：
$$\frac{\partial A^{\mu}}{\partial x^{\mu}}=0$$
则有：
$$\frac{\partial^2}{\partial x_{\mu}\partial x^{\mu}}A^{\nu}=0$$
这就是真空中的电磁场方程。

写成分量的形式为：
$$
\left(\frac 1 {c^2} \frac{\partial^2}{\partial t^2} - \nabla^2 \right)\phi=0
\\ \left(\frac 1 {c^2} \frac{\partial^2}{\partial t^2} - \nabla^2 \right)\mathbf A=0
$$
再利用洛伦兹规范：
$$ \frac{\partial A^{\alpha}}{\partial x^{\alpha}} = \frac 1 {c^2} \frac{\partial \phi}{\partial t} + \nabla\cdot\mathbf A =0 $$
则有：
$$
\begin{align*}
\left(\frac 1 {c^2} \frac{\partial^2}{\partial t^2} - \nabla^2 \right)\phi &= \frac{\partial}{\partial t}(-\nabla\cdot\mathbf A) - \nabla^2\phi
\\ &= \nabla\cdot(-\frac{\partial \mathbf A}{\partial t} - \nabla \phi) 
\\ &= \nabla\cdot\mathbf E=0
\end{align*}
$$
以及：
$$
\begin{align*}
\left(\frac 1 {c^2} \frac{\partial^2}{\partial t^2} - \nabla^2 \right)\mathbf A &= \frac 1 {c^2} \frac{\partial^2 \mathbf A}{\partial t^2} + \nabla\times(\nabla\times\mathbf A) - \nabla(\nabla\cdot\mathbf A)
\\ &= \frac 1 {c^2} \frac{\partial^2 \mathbf A}{\partial t^2} + \nabla\times\mathbf B + \nabla\left(\frac 1 {c^2} \frac{\partial \phi}{\partial t} \right)
\\ &= \nabla\times\mathbf B - \frac 1 {c^2}\frac{\partial \mathbf E}{\partial t} =0
\end{align*}
$$
我们得到了真空中的麦克斯韦方程组中的两个方程：
$$
\nabla\cdot\mathbf E=0
\\ \nabla\times\mathbf B = \frac 1 {c^2}\frac{\partial \mathbf E}{\partial t}
$$
结合上一节中的两个方程，我们得到了全部真空中的麦克斯韦方程。

# 3.与粒子耦合的电磁场
## 3.1 电流密度

我们下一步要做的事自然是考虑$S_{pf}$和$S_f$的耦合，但是在此之前，由于电磁场的项是用拉氏量密度表示的，所以我们也需要将$S_{pf}$也用拉氏量密度表示。

对多个粒子的系统：
$$
\begin{align*}
S_{pf} &= -\int\sum_i q_iA_{\alpha}(t,\mathbf x_i)dx^{\alpha}
\\ &= -\int \sum_i q_iA_{\alpha}(t,\mathbf{x})\delta(\mathbf x-\mathbf x_i) dVdx^{\alpha}
\\ &= \int \mathscr L_{pf} d\Omega dt
\end{align*}
$$
在进行下一步之前需要说明，这里的$S_{pf}$是场与所有粒子的耦合项的作用量，求和的每一项中$A_{\alpha}$采用的是在粒子的位置上的值。其原因是电磁场的作用是局域的，即$A_{\alpha}$只有沿着粒子的运动轨迹取值才会对运动方程有贡献。

我们可以定义电荷密度：
$$ \rho(t,\mathbf x)=\sum_i q_i\delta(\mathbf x-\mathbf x_i) $$
注意到$\int \rho dV=Q$，为系统中电荷总量，是洛伦兹不变量。这说明$\rho$与体积微元$dV$相乘为洛伦兹不变量，即它可以作为某个4-矢量的时间分量。再考虑$S_{pf}$：
$$
\begin{align*}
S_{pf} &= -\int \rho A_{\alpha} dx^{\alpha}dV
\\ &= -\int \rho A_{\alpha}\frac{dx^{\alpha}}{dt}\frac 1 c d\Omega dt 
\end{align*}
$$
对比上面的$\mathscr L_{pf}$定义，我们有：
$$ \mathscr L_{pf} = -\frac 1 c \rho A_{\alpha}\frac{dx^{\alpha}}{dt} = -\frac 1 c A_{\alpha}j^{\alpha} $$
其中
$$ j^{\alpha}=\rho\frac{dx^{\alpha}}{dt} = (\rho c,\mathbf j) $$
为四维电流密度矢量。由于$\rho$与时间具有相同变换规则，因此从其定义式可以得知四维电流密度矢量的确是一个4-矢量。其空间分量为$\mathbf j=\rho \mathbf v$，其物理意义为单位时间内通过单位截面的电荷量，即电流密度。需要说明的是，这里的速度$\mathbf v$并不是一定是某个单一粒子的速度，因为这里用的是点粒子的模型，并不阻止有多于一个粒子处在相同的位置而具有不同的速度。下面的推导可以说明$\mathbf v$的物理意义：
$$
\begin{align*}
\rho \mathbf v &= \sum_i q_i\delta(\mathbf x-\mathbf x_i)\mathbf v
\\ &= \sum_i q_i\delta(\mathbf x-\mathbf x_i)\mathbf v_i
\\ &= \rho \frac{\sum q_i\delta(\mathbf x-\mathbf x_i)\mathbf v_i}{\sum q_i\delta(\mathbf x-\mathbf x_i)}
\\ &= \rho \frac{\sum q_i\mathbf v_i}{\sum q_i} \tag{on one point}
\end{align*}
$$
这表明，$\mathbf v(\mathbf x_i)$实际上是这一点上速度关于电荷的加权平均。当然，实际上的粒子并不是点电荷，我们实际上是近似地取一个宏观小、微观大的邻域，在其中做加权平均。

## 3.2 电磁场方程

我们有了电磁场的拉氏量密度：
$$\mathscr L = \mathscr L_f + \mathscr L_{pf} = -\frac 1 {4\mu_0c}F_{\alpha\beta}F^{\alpha\beta} - \frac 1 c j^{\alpha}A_{\alpha} $$
带入E-L方程，得到电磁场方程为：
$$ \frac{\partial F_{\mu\nu}}{\partial x_{\mu}} = \mu_0 j_{\nu} $$
（也可以像前两节一样用变分导出，结果是一样的）

利用电磁场张量的定义：
$$
\begin{align*}
\frac{\partial F_{\mu\nu}}{\partial x_{\mu}} &=\partial^{\mu}(\partial_{\nu}A_{\mu}-\partial_{\mu}A_{\nu})
\\ &= \partial_{\nu}\partial^{\mu}A_{\mu}-\partial^{\mu}\partial_{\mu}A_{\nu}
\\ &= -\partial^{\mu}\partial_{\mu}A_{\nu} =\mu_0 j_{\nu}
\end{align*}
$$
（使用了洛伦兹规范）写成分量的形式：
$$
\left(\frac 1 {c^2} \frac{\partial^2}{\partial t^2} - \nabla^2 \right)\phi = \frac{\rho}{\epsilon_0}
\\ \left(\frac 1 {c^2} \frac{\partial^2}{\partial t^2} - \nabla^2 \right)\mathbf A = \mu_0\mathbf j
$$
用电场和磁场的表示为：
$$
\nabla\cdot\mathbf E = \frac{\rho}{\epsilon_0}
\\ \nabla\times\mathbf B = \frac 1 {c^2}\frac{\partial \mathbf E}{\partial t} + \mu_0\mathbf j
$$
至此，我们得到了麦克斯韦方程组中的全部方程。

## 3.3 电荷连续性方程

考虑电荷密度的定义：
$$\rho = \sum_i q_i\delta(\mathbf x-\mathbf x_i(t))$$
我们有：
$$
\begin{align*}
\frac{\partial \rho}{\partial t} &= \sum_i q_i \cdot -\frac{\partial \delta(\mathbf x-\mathbf x_i)}{\partial (\mathbf x-\mathbf x_i)}\frac{\partial \mathbf x}{\partial t}
\\ &= -\sum_i q_i \nabla\delta(\mathbf x-\mathbf x_i) \mathbf v_i
\\ &= -\nabla\left(\sum_i q_i\delta(\mathbf x-\mathbf x_i)\right)
\\ &= -\nabla\cdot\mathbf j
\end{align*}
$$
即：
$$\frac{\partial \rho}{\partial t} + \nabla\cdot\mathbf j = 0 $$
这就是**电荷连续性方程**。它有明确的物理意义：   
在一个小的区域$\Delta V$内，电荷量的变化率等于单位时间流入的电荷，即:
$$\frac{dQ}{dt} = \int \frac{\partial \rho}{\partial t} dV = -\oint \mathbf j \cdot d\mathbf S = \int \nabla\cdot\mathbf j dV $$
满足电荷连续性方程表明电荷是守恒的，不会凭空出现或消失。

一般情况下，物理量$A$不一定守恒，其连续性方程为：
$$\frac{\partial \rho_A}{\partial t} + \nabla\cdot\mathbf F_A = S_A $$
等式右边的$S_A$项表示$A$的源，即单位时间内产生的量。对矢量$\mathbf g$，则为：
$$\frac{\partial \mathbf g}{\partial t} + \nabla\cdot\mathsf G = \mathbf{S_g} $$
此时矢量的通量$\mathsf G = \mathbf{vg}$为一个二阶张量。

# 4.电磁场的能量和动量

可以根据拉氏量密度，由诺特定理直接推出电磁场能量密度和动量密度，但是这里使用另一种方法。由能量守恒和动量守恒，电磁场的能量和动量的源就等于负的在电磁场中运动的粒子的能量和动量变化，由3.3节给出的连续性方程的一般形式，也可以得到能量和动量的表达式。

## 4.1 能量密度与能流密度

在$\Delta V$区域内粒子的能量：
$$ \frac{dE}{dt} = \rho \Delta V(\mathbf E\cdot \mathbf v) = (\mathbf E\cdot \mathbf j)\Delta V $$
从而对电磁场：
$$ \frac{d\epsilon}{dt} + \nabla\cdot\mathbf P = -\mathbf E\cdot \mathbf j $$
而由麦克斯韦方程，
$$ \mathbf j = \frac 1 {\mu_0}\nabla\times\mathbf B - \epsilon_0\frac{\partial \mathbf E}{\partial t} $$
有：
$$
\begin{align*}
-\mathbf E\cdot \mathbf j &= -\frac 1 {\mu_0}[\mathbf B\cdot(\nabla\times\mathbf E) - \nabla\cdot(\mathbf E\times\mathbf B)] + \frac 1 2 \epsilon_0\frac{\partial E^2}{\partial t}
\\ &= \frac 1 {\mu_0}\nabla\cdot(\mathbf E\times\mathbf B) + \frac 1 2 \epsilon_0\frac{\partial E^2}{\partial t} + \frac 1 {2\mu_0}\frac{\partial B^2}{\partial t}
\\ &= \frac{d\epsilon}{dt} + \nabla\cdot\mathbf P
\end{align*} $$
从而，电磁场的能量密度和能量通量（能流密度）为：
$$
\epsilon = \frac 1 2 \epsilon_0 E^2 + \frac 1 {2\mu_0}B^2
\\ \mathbf P = \frac 1 {\mu_0} \mathbf E\times\mathbf B
$$

## 4.2 动量密度与应力张量

粒子的动量变化率即为其在电磁场中受的力，为：
$$ \frac{d\mathbf p}{dt} = (\rho\mathbf E + \rho\mathbf v\times\mathbf B)\Delta V = (\rho\mathbf E + \mathbf j\times\mathbf B)\Delta V $$
从而有：
$$\frac{\partial \mathbf g}{\partial t} + \nabla\cdot\mathsf G = -(\rho\mathbf E + \mathbf j\times\mathbf B) $$
经过类似的推导，可以得到：
$$
\mathbf g = \epsilon_0\mathbf E\times\mathbf B
\\ \mathsf G = -\mathsf T = -(\epsilon_0\mathbf E\mathbf E+\frac 1 {\mu_0}\mathbf B\mathbf B - \frac 1 2(\epsilon_0 E^2 + \frac 1 {\mu_0}B^2)\mathsf I)
$$
（其中$\mathsf I$为单位张量）$\mathsf T$称为麦克斯韦应力张量。

我们可以考虑一下$\mathsf G$的物理意义：它表示电磁场的动量通量，即单位时间内通过单位面积的动量大小。而动量在时间上的变化率正是力，也就是说它可以被理解为作用在各方向的单位面积上的力，即压强和切向应力。<br>
对稳恒电磁场，$\frac{\partial \mathbf g}{\partial t}=0$，则一个区域内带电粒子的受力（动量变化率）即为流入该区域的动量流，为：
$$\mathbf F = -\int \nabla\cdot\mathsf G dV = \oint \mathsf T\cdot d\mathbf S $$
这一公式也可以用来计算电磁场之中的粒子的受力——前提是稳恒电磁场，且粒子并非是测试粒子，其自身产生的电磁场也必须计入考虑。