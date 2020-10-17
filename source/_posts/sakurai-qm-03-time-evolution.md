---
title:       量子态的时间演化
description: Sakurai读书笔记（三）
date:        2020-10-08 14:41:46
author:      y
mathjax:     true
categories:
    - 笔记
    - Sakurai量子力学笔记
tags:
    - 物理
---

## 时间演化算符

上一章讨论了态矢的定义和基本性质，以及同一态矢在不同表象下的表示，并特别考虑了位置表象和动量表象。这一章将讨论动力学，即量子态随时间的演化。需要说明的是这里时间并不是一个观测量，即没有时间算符，而是作为一个参量出现。这也体现了在量子力学中时空地位的不对等，而在相对论协变的量子场论中时间和空间才会有对等的地位。

为了强调系统的时间演化，我们引入下面的记号，$t_0$时系统的状态为$\left|\alpha\right>$，在$t$时的状态记为
$$ \left|\alpha,t_0;t\right> $$
另外，$\left|\alpha,t_0;t_0\right>$就简记为$\left|\alpha,t_0\right>$。我们要研究的便是$\left|\alpha,t_0\right>$和$\left|\alpha,t_0;t\right>$的关系。

自然地，我们可以用一个算符联系$t_0$和$t$时的状态：
$$ \left|\alpha,t_0;t\right> = \mathscr{U}(t,t_0) \left|\alpha,t_0\right> $$
这就是**时间演化算符**$\mathscr{U}(t,t_0)$。下面根据我们希望时间演化算符满足的性质给出它的具体形式。

首先我们考虑**概率守恒**，将粒子的初态写成某个观测量$A$本征态的叠加：
$$ \left|\alpha,t_0\right> = \sum c_{a'}(t_0)\left|a'\right> $$
将态矢归一化，则系数的模平方就是系统处于对应本征态上的概率。在时间$t$时，粒子的状态成为
$$ \left|\alpha,t_0;t\right> = \sum c_{a'}(t)\left|a'\right> $$
此时我们仍然希望，$\sum |c_{a'}(t)|^2 = 1$，即粒子处在$A$的所有本征态的概率之和还应是1，而不会凭空出现或消失。从而：
$$ \left<\alpha,t_0;t|\alpha,t_0;t\right> = \left<\alpha,t_0;t|\mathscr{U}(t,t_0)^\dagger\mathscr{U}(t,t_0)|\alpha,t_0;t\right> = \left<\alpha,t_0|\alpha,t_0\right> = 1 $$
可以看到，对概率守恒的要求给出的限制是，**时间演化算符应该是幺正算符**。

另外显然需要满足的性质是：
$$ \mathscr{U}(t_2,t_0) = \mathscr{U}(t_2,t_1)\mathscr{U}(t_1,t_0) $$
以及
$$ \lim_{t\rightarrow 0} \mathscr{U}(t,t_0) = 1 $$
考虑无穷小时间变换$\mathscr{U}(t_0+\mathrm{d}t,t_0)$，和前面无穷小平移算符的推导类似，我们可以给出无穷小时间变换应该有如下的形式：
$$ \mathscr{U}(t_0+\mathrm{d}t,t_0) = 1 - i\Omega\mathrm{d}t $$
其中$\Omega$是一个厄米算符。

$\Omega$具有频率的量纲，考虑经典力学中哈密顿量是时间演化的生成元，而能量量纲除以$\hbar$也有频率的量纲，我们取$\Omega=H/\hbar$，从而
$$ \mathscr{U}(t_0+\mathrm{d}t,t_0) = 1 - iH\mathrm{d}t/\hbar $$
这里$\hbar$再一次出现，在后面我们会说明这和无穷小平移算符中的$\hbar$应该是同一个常量，这样运动方程才能回到经典近似。

## 薛定谔方程

### 时间演化算符的薛定谔方程

有了无穷小时间变换的形式，我们就可以导出更一般的时间演化算符。由
$$ \mathscr{U}(t+\mathrm{d}t,t_0) = \mathscr{U}(t+\mathrm{d}t,t)\mathscr{U}(t,t_0) = (1 - iH\mathrm{d}t/\hbar)\mathscr{U}(t,t_0) $$
即
$$ \mathscr{U}(t+\mathrm{d}t,t_0) - \mathscr{U}(t,t_0) =  - i\frac{H}{\hbar}\mathrm{d}t $$
即
$$ i\hbar\frac{\partial}{\partial t}\mathscr{U}(t,t_0) = H\mathscr{U}(t,t_0) $$
这就是**时间演化算符的薛定谔方程**。

将上式作用在态矢$\left|\alpha,t_0\right>$上，即有：
$$ i\hbar\frac{\partial}{\partial t}\left|\alpha,t_0;t\right> = H\left|\alpha,t_0;t\right> $$
即为**态矢的薛定谔方程**。

薛定谔方程可以让我们解出时间演化算符的具体形式，若哈密顿算符不含时，则有
$$ \mathscr{U}(t,t_0) = \exp\left[\frac{-iH(t-t_0)}{\hbar}\right] $$
若哈密顿算符依赖时间，但不同时间的$H$对易，则时间演化算符可以写成
$$ \mathscr{U}(t,t_0) = \exp\left[-\frac{i}{\hbar} \int_{t_0}^{t}H(t')\mathrm{d}t' \right] $$
而若不同时间的哈密顿算符不对易（例如，系统处在磁场中，哈密顿算符中会有$\mathbf{S}\cdot\mathbf{B}$的项，若磁场的方向随时间变化，由于不同方向的自旋不对易，从而不同时间的哈密顿算符不对易），此时的时间演化算符为
$$ \mathscr{U}(t,t_0) = 1 + \sum_{n=1}^\infty \left(-\frac{i}{\hbar}\right)^n \int_{t_0}^{t}\mathrm{d}t_1\int_{t_0}^{t_1}\mathrm{d}t_2\cdots\int_{t_0}^{t_{n-1}}\mathrm{d}t_n H(t_1)H(t_2)\cdots H(t_{n}) $$
这被称作戴森序列(Dyson series)。

### 哈密顿算符不含时情况下的演化

下面讨论最简单的情况，即哈密顿量不含时时系统的演化。此时的时间演化算符为（简单起见，取$t_0=0$）
$$ \mathscr{U}(t) = \exp\left(\frac{-iHt}{\hbar}\right) $$
时间演化算符作用在能量本征态上的结果是显而易见的，若$\left|a'\right>$是一组能量本征态，对应的本征能量是$E_{a'}$，则
$$
\begin{aligned}
    \exp\left(\frac{-iHt}{\hbar}\right) &= \sum_{a'}\sum_{a''} \left|a''\right>\left<a''\right|\exp\left(\frac{-iHt}{\hbar}\right) \left|a'\right>\left<a'\right|
    \\&= \sum_{a'} \exp\left(\frac{-i E_{a'} t}{\hbar}\right) \left|a'\right>\left<a'\right|
\end{aligned}
$$
对一个任意的态
$$ \left|\alpha\right> = \sum_{a'} c_{a'}\left|a'\right> $$
有
$$ \left|\alpha,0;t\right> = \exp\left(\frac{-iHt}{\hbar}\right)\left|\alpha\right> = \sum_{a'} c_{a'}\exp\left(\frac{-i E_{a'} t}{\hbar}\right) \left|a'\right> $$
即**如果我们要考虑任意态的时间演化，需要将其分解为能量本征态的叠加**。特别地，如果系统的初态就是能量本征态$\left|a'\right>$，那么时间演化只是给其乘上了一个整体相位。

态的时间演化自然会产生观测效应，但态矢本身是没法测量的，我们只能对各种观测量进行测量。这里比较重要的便是观测量的平均值。一个特别的情况是系统初态处在能量本征态，此时时间演化只是乘上了一个整体相位，不会产生观测效应：
$$
\begin{aligned}
    \left<B\right> &= \left<a',0;t|B|a',0;t\right>
    \\&= \left<a'\right| \exp\left(\frac{-i E_{a'} t}{\hbar}\right) B \exp\left(\frac{-i E_{a'} t}{\hbar}\right) \left|a'\right>
    \\&= \left<a'|B|a'\right>
\end{aligned}
$$
可见观测量$B$的平均值不会随时间变化。因此能量本征态也被称为**定态**。

而对非定态，观测量的平均值的演化为：
$$
\begin{aligned}
    \left<B\right> &= \left[\sum_{a'} c_{a'}^*\exp\left(\frac{i E_{a'} t}{\hbar}\right) \left<a'\right|\right] B \left[\sum_{a''} c_{a''}\exp\left(\frac{-i E_{a''} t}{\hbar}\right) \left|a''\right>\right]
    \\&= \sum_{a',a''} c_{a'}c_{a''}^* \exp\left[\frac{-i (E_{a''}-E_{a'}) t}{\hbar}\right] \left<a'|B|a''\right>
    \\&= \sum_{a',a''} c_{a'}c_{a''}^* \exp(-i\omega_{a''a'}t) \left<a'|B|a''\right>
\end{aligned}
$$
其中
$$ \omega_{a''a'} = \frac{E_{a''}-E_{a'}}{\hbar} $$
即非定态的平均值为$n\times n$个角频率为$\omega_{a''a'}$的周期震荡项之和。

### 能量-时间不确定性关系

在这一部分我们考虑随时间演化后的态和初态有多少相似，为此我们引入**关联幅度**：
$$ C(t) = \left<\alpha|\alpha,0;t\right> = \left<\alpha|\mathscr{U}(t)|\alpha\right> $$
这实际上就是末态和初态的内积，由于时间演化算符是幺正算符，态矢的模长并不会变化，因此内积的大小也就一定程度上反映了末态和初态的相似程度。

容易写出关联幅度的表达式
$$
\begin{aligned}
    C(t) &= \left<\alpha|\mathscr{U}(t)|\alpha\right>
    \\&= \left(\sum_{a'} c_{a'}^* \left<a'\right| \right) \left[\sum_{a''} c_{a''}\exp\left(\frac{-iE_{a''}t}{\hbar}\right) \left|a'\right> \right]
    \\&= \sum_{a'} |c_{a'}|^2 \exp\left(\frac{-iE_{a'}t}{\hbar}\right) 
\end{aligned}
$$
为了进一步讨论的方便，我们需要考虑能量分布的连续谱，此时态$\left|\alpha\right>$可以写成：
$$ \left|\alpha\right> = \int g(E)\left|a'\right> \rho(E)\mathrm{d}E $$
其中$\rho(E)$是$E$附近态密度，$g(E)$就是系数。关联幅度就成为
$$ C(t) = \int |g(E)|^2 \exp\left(\frac{-iEt}{\hbar}\right) \rho(E)\mathrm{d}E $$

我们考虑这样的情况，能量只分布在$E_0$附近宽$\Delta E$的区间内（相当于能量有$\Delta E$的不确定度），将关联幅度写为
$$ C(t) = \exp\left(\frac{-iE_0t}{\hbar}\right) \int |g(E)|^2 \exp\left[\frac{-i(E-E_0)t}{\hbar}\right] \rho(E)\mathrm{d}E $$
考虑积分中$\exp[-i(E-E_0)t/\hbar]$的项，当$t$很大时这一项会快速震荡，从而导致积分很快衰减为0。从而我们可以得到这样的特征时间，满足
$$ \frac{\Delta E t}{\hbar} \simeq 1 $$
或
$$ \Delta t \Delta E \simeq \hbar $$
这就是**能量-时间不确定性关系**。其物理意义是初始能量有$\Delta E$的弥散的系统，其演化到与初态“面目全非”的时标就是$\Delta t$。特别地，考虑$\Delta E\sim 0$，初态趋近于能量本征态，此时$\Delta t\sim \infty$，也就是说初态处于能量本征态上的系统能一直保持其状态，这和我们前面的讨论相符合。

## 波动力学

最后，我们进入波动力学的框架，考虑波函数$\psi(\mathbf{x'},t)=\left<\mathbf{x'}|\alpha,t_0;t\right>$的演化，将哈密顿算符写成
$$ H = \frac{\mathbf{p}^2}{2m} + V(\mathbf{x},t) $$
带入上面的方程，
$$
\begin{aligned}
    i\hbar\frac{\partial}{\partial t}\left<\mathbf{x'}|\alpha,t_0;t\right> &= \left< \mathbf{x'}\right|\frac{\mathbf{p}^2}{2m} + V(\mathbf{x},t) \left|\alpha,t_0;t\right>
    \\&= \left(-\frac{\hbar^2}{2m}\nabla'^2 + V(\mathbf{x'},t)\right) \left<\mathbf{x'}|\alpha,t_0;t\right>
\end{aligned}
$$
即得到我们熟悉的**波动力学中的薛定谔方程**：
$$ i\hbar\frac{\partial}{\partial t}\psi(\mathbf{x'},t) = \left(-\frac{\hbar^2}{2m}\nabla'^2 + V(\mathbf{x'},t)\right) \psi(\mathbf{x'},t) $$
若$V=V(\mathbf{x'})$是时间无关的，那么哈密顿算符也是时间无关的，上面的讨论告诉我们此时能量本征态的演化
$$ \left<\mathbf{x'}|a',t_0;t\right> =\left<\mathbf{x'}|a',t_0\right> \exp\left(\frac{-iE_{a'}t}{\hbar}\right) $$
带入上面的薛定谔方程，分离时间和空间变量，得到**定态薛定谔方程**：
$$ \left(-\frac{\hbar^2}{2m}\nabla^2 + V(\mathbf{x})\right) u_E(\mathbf{x}) = Eu_E(\mathbf{x}) $$
这其实就是求解能量本征态的方程。

### 概率守恒

我们已经在上一章的讨论中知道，$\rho=|\left<\mathbf{x}|\alpha\right>|^2=|\psi(\mathbf{x})|^2$是$\mathbf{x}$处的概率密度。从而由薛定谔方程就可以得出
$$ \frac{\mathrm{d}\rho}{\mathrm{d}t} + \nabla\cdot\mathbf{j} = 0 $$
这有着连续性方程的形式。其中
$$ \mathbf{j} = -\frac{i\hbar}{2m}\left(\psi^*\nabla\psi - \psi\nabla\psi^*\right) $$
为**概率流密度**。考虑其物理意义：
$$ \int \mathbf{j}\mathrm{d}^3x = -\frac{i\hbar}{m}\int\psi^*\nabla\psi\mathrm{d}^3x = \frac{\left<\mathbf{p}\right>}{m} $$
$\mathbf{j}$在全空间的积分就是这一时刻动量的平均值除以质量，这在经典力学中就是粒子的“速度”，因此将$\mathbf{j}$定义为概率流密度是合理的。于是我们可以说，薛定谔方程蕴含了**概率守恒**。

### 经典近似

进一步考虑波函数的物理意义，令
$$ \psi(\mathbf{x},t) = \sqrt{\rho(\mathbf{x},t)}\exp\left(i\frac{S(\mathbf{x},t)}{\hbar}\right) $$
带入概率流密度的定义，有
$$ \mathbf{j} = \frac{\rho\nabla S}{m} $$
即概率流密度和波函数的相位的梯度成正比。

将上式带入薛定谔方程：
$$ i\hbar\left(\frac{\partial \sqrt{\rho}}{\partial t} + i\frac{\sqrt{\rho}}{\hbar}\frac{\partial S}{\partial t}\right) \exp\left(i\frac{S(\mathbf{x},t)}{\hbar}\right) = \left[-\frac{\hbar^2}{2m}\left(\nabla^2\sqrt{\rho}-\sqrt{\rho}\frac{|\nabla S|^2}{\hbar^2}\right) + V\sqrt{\rho}\right] \exp\left(i\frac{S(\mathbf{x},t)}{\hbar}\right) $$
经典近似下$\hbar\rightarrow 0$，只保留零阶项，则得到
$$ \frac{|\nabla S|^2}{2m} + V + \frac{\partial S}{\partial t} = 0 $$
考虑哈密顿量为$H=p^2/2m+V$，这即是经典力学中的哈密顿-雅可比方程。这里的$S$，即波函数的相位乘$\hbar$，对应了经典的作用量。于是我们可以看到，在$\hbar\rightarrow 0$的经典近似下，量子力学回到了经典力学。

考虑定态的时间演化，$\mathscr{U}=\exp(-iEt/\hbar)$，因此对定态，$S$的时间和空间依赖就可以分离变量，
$$ S(\mathbf{x},t) = W(\mathbf{x}) - Et $$
$W$就是哈密顿特征函数。

H-J方程会给出动量
$$ \mathbf{p}_\mathrm{classical} = \nabla S $$
经典的动量的方向是等相位的波阵面的法向。回想在光学中，几何光学的光线在波动光学中就是波线，即垂直波阵面的直线。基于这样的相似性，我们可以说经典粒子就如同几何光学中的光线，波动力学回到经典力学就如同波动光学回到几何光学。
