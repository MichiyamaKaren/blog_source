---
title:      位置算符、动量算符和波函数
description: Sakurai读书笔记（二）
date:       2019-11-28
author:     y
mathjax:    true
categories:
    - 笔记
    - Sakurai量子力学笔记
tags:
    - 物理
---

## 1.6 Position, Momentum and Translation

### 连续谱

前面讨论的观测量的本征值都是离散分布的，然而还有另一类观测量，其本征值是连续分布的。连续谱使用的数学和之前讨论的类似，只需要把求和换成积分，克罗内克符号$\delta_{a'a''}$换成狄拉克函数$\delta(a'-a'')$。连续谱下的基的正交归一化条件和完备性关系可以写为：
$$\left<\xi'|\xi''\right>=\delta(\xi'-\xi'') $$
$$ \int \left|\xi'\right>\left<\xi'\right|\mathrm{d}\xi'=1$$

### 位置和波函数

**位置**就是这样一个本征值连续分布的观测量。对位置算符$x$的本征右矢$\left|x'\right>$，有：
$$x\left|x'\right>=x'\left|x'\right>$$

对任意的态$\left|\alpha\right>$，由位置的完备性关系，可以在位置表象下展开：
$$\left|\alpha\right>=\int \left|x'\right>\left<x'|\alpha\right>\mathrm{d}x'$$
如果我们用仪器测量一个处于$\left|\alpha\right>$态上的粒子的位置，粒子会以一定概率塌缩到某个位置本征态。当然，物理的仪器都是有限精度的，我们只能得知粒子的位置在$x'$附近一个宽度为$\mathrm{d}x'$的区间内的概率为：
$$\left|\left<x'|\alpha\right>\right|^2\mathrm{d}x'$$
其中$\psi(x')=\left< x'|\psi \right>$被称作**波函数**，其模平方就是粒子在空间中的概率密度。

粒子一定会在空间中某处被发现，这给出了波函数和态矢的归一化条件：
$$\left<\alpha|\alpha\right>=\int\left|\left<x'|\alpha\right>\right|^2\mathrm{d}x'=\int\left|\Psi(x')\right|^2\mathrm{d}x'=1 $$

三维的情况和一维类似，我们假设存在位置本征态$\left|\mathbf{x}\right>$，这即是假设三个方向的位置算符有共同的本征态$\left|x',y',z'\right>$（否则的话粒子在任意时刻都不会有确定的位置——它不同方向的位置甚至都不对易！我们不希望这样）。如果位置本征态是完备的，我们仍可以展开任意的态矢：
$$\left|\alpha\right>=\int \left|\mathbf{x'}\right>\left<\mathbf{x'}|\alpha\right>\mathrm{d}\mathbf{x'}$$

### 无穷小平移

我们定义**无穷小平移算符**$\mathscr{T}(\mathrm{d}\mathbf{x'})$，它作用在位置本征态$\left|\mathbf{x'}\right>$上的结果为：
$$\mathscr{T}(\mathrm{d}\mathbf{x'})\left|\mathbf{x'}\right>=\left|\mathbf{x'}+\mathrm{d}\mathbf{x'}\right>$$
物理上，考虑任意态矢在坐标表象下的表示：$\left|\alpha\right>=\int c_{\mathbf{x'}}\left|\mathbf{x'}\right>$，无穷小平移使每个本征态$\left|\mathbf{x'}\right>$都变成$\left|\mathbf{x'}+\mathrm{d}\mathbf{x'}\right>$，相当于一个让物理系统平移了$\mathrm{d}\mathbf{x'}$的坐标变换（我们很快会看到，它的确是一个幺正算符）。

下面来考虑$\mathscr{T}(\mathrm{d}\mathbf{x'})$的性质，将其作用在任意态矢上：
$$
\begin{aligned}
    \mathscr{T}(\mathrm{d}\mathbf{x'})\left|\alpha\right>
    &=\mathscr{T}(\mathrm{d}\mathbf{x'})\int \left|\mathbf{x'}\right>\left<\mathbf{x'}|\alpha\right>\mathrm{d}\mathbf{x'}\\
    &=\int \left|\mathbf{x'}+\mathrm{d}\mathbf{x'}\right>\left<\mathbf{x'}|\alpha\right>\mathrm{d}\mathbf{x'}=\int \left|\mathbf{x'}\right>\left<\mathbf{x'}-\mathrm{d}\mathbf{x'}|\alpha\right>\mathrm{d}\mathbf{x'}
    \\
    &=\int \left|\mathbf{x'}\right>\left<\mathbf{x'}|\mathscr{T}(\mathrm{d}\mathbf{x'})|\alpha\right>\mathrm{d}\mathbf{x'}
\end{aligned}
$$
这说明$\mathscr{T}(\mathrm{d}\mathbf{x'})$作用到本征左矢上结果为：
$$\left<\mathbf{x'}\right|\mathscr{T}(\mathrm{d}\mathbf{x'})=\left<\mathbf{x'}-\mathrm{d}\mathbf{x'}\right|$$
$\mathscr{T}(\mathrm{d}\mathbf{x'})$让左矢向相反方向平移了$\mathrm{d}\mathbf{x'}$。从而显然有$\mathscr{T}(\mathrm{d}\mathbf{x'})$的厄米共轭为：
$$\mathscr{T}(\mathrm{d}\mathbf{x'})^\dagger=\mathscr{T}(-\mathrm{d}\mathbf{x'})$$

当然，根据定义，无穷小平移算符还应满足以下性质：
- $\mathscr{T}(\mathrm{d}\mathbf{x'})\mathscr{T}(\mathrm{d}\mathbf{x''})=\mathscr{T}(\mathrm{d}\mathbf{x'}+\mathrm{d}\mathbf{x''})$
- $\mathscr{T}(-\mathrm{d}\mathbf{x'})=\mathscr{T}^{-1}(\mathrm{d}\mathbf{x'})$
- 根据上一条性质和$\mathscr{T}(\mathrm{d}\mathbf{x'})$的厄米共轭的表达式，它应该是幺正算符

第一个性质要求$\mathscr{T}(\mathrm{d}\mathbf{x'})$是指数函数，即：
$$\mathscr{T}(\mathrm{d}\mathbf{x'})=\exp \left(\mathbf{B}\cdot \mathrm{d}\mathbf{x'}\right) $$
由于$\mathrm{d}\mathbf{x'}$是无穷小量，可以展开并保留至一阶：
$$
\mathscr{T}(\mathrm{d}\mathbf{x'})=1+\mathbf{B}\cdot \mathrm{d}\mathbf{x'}
$$
上面厄米共轭的性质即成为：
$$1+\mathbf{B}^\dagger\cdot \mathrm{d}\mathbf{x'}=1-\mathbf{B}\cdot \mathrm{d}\mathbf{x'}$$
从而$\mathbf{B}$是反厄米算符，定义$\mathbf{B}=-i\mathbf{K}$，则$\mathbf{K}$是厄米算符。很容易验证$\mathscr{T}(\mathrm{d}\mathbf{x'})$的幺正性。

总结一下，上面定义的无穷小平移算符有如下形式：
$$\mathscr{T}(\mathrm{d}\mathbf{x'})=1-i\mathbf{K}\cdot \mathrm{d}\mathbf{x'} $$

下面考虑无穷小平移和位置算符的对易关系：
$$
\begin{aligned}
    &\mathbf{x}\mathscr{T}(\mathrm{d}\mathbf{x'})\left|\mathbf{x'}\right>=\mathbf{x}\left|\mathbf{x'}+\mathrm{d}\mathbf{x'}\right>=(\mathbf{x'}+\mathrm{d}\mathbf{x'})\left|\mathbf{x'}+\mathrm{d}\mathbf{x'}\right>
    \\&\mathscr{T}(\mathrm{d}\mathbf{x'})\mathbf{x}\left|\mathbf{x'}\right>=\mathbf{x'}\mathscr{T}(\mathrm{d}\mathbf{x'})\left|\mathbf{x'}\right>=\mathbf{x'}\left|\mathbf{x'}+\mathrm{d}\mathbf{x'}\right>
\end{aligned}
$$
从而：
$$[\mathbf{x}, \mathscr{T}(\mathrm{d}\mathbf{x'})]=\mathrm{d}\mathbf{x'} $$
带入上面的形式，有：
$$[x_i,K_j]=i\delta_{ij} $$

### 动量作为无穷小平移的生成元

我们来考虑$\mathbf{K}$的物理意义。

在经典力学中，上面的无穷小平移可以作为正则变换考虑：
$$\mathbf{x'}=\mathbf{X}=\mathbf{x}+\mathrm{d}\mathbf{x},\ \mathbf{p'}=\mathbf{P}=\mathbf{p} $$
这一变换的生成函数为：
$$F(\mathbf{x}, \mathbf{P})=\mathbf{x}\cdot\mathbf{P}+\mathbf{p}\cdot \mathrm{d}\mathbf{x} $$
考虑到单位变换（$\mathbf{X}=\mathbf{x},\mathbf{P}=\mathbf{p}$）的生成函数是$F(\mathbf{x}, \mathbf{P})=\mathbf{x}\cdot\mathbf{P}$，这个生成函数和无穷小平移算符有着非常相似的形式。基于此，可以建立这样的对应，$\mathbf{K}$应该就是动量除以一个具有作用量量纲的常数。量子力学中这个常数就是$\hbar$。无穷小平移算符就可以表示为：
$$\mathscr{T}(\mathrm{d}\mathbf{x'})=1-i\mathbf{p}\cdot \mathrm{d}\mathbf{x'}/\hbar $$
从而坐标和动量的对易关系：
$$[x_i,p_j]=i\hbar\delta_{ij}$$

下面考虑动量的不同分量间的对易关系。不同方向上的无穷小平移算符是对易的（先在x方向平移再在y方向平移和先在y方向再在x方向平移是等效的），从而有：
$$
\begin{aligned}
    [\mathscr{T}(\mathrm{d}x\hat{\mathbf{x}}),\mathscr{T}(\mathrm{d}x\hat{\mathbf{y}})]&=[1-ip_x\mathrm{d}x/\hbar, 1-ip_ydy/\hbar]
    \\&=-\frac{\mathrm{d}xdy}{\hbar^2}[p_x,p_y]=0
\end{aligned}
$$
在其他方向上也同理，从而不同方向上的动量算符的对易关系为：
$$[p_i,p_j]=0$$

不同方向的动量是对易的，这说明和位置算符类似，也存在三维的动量本征态$\left|\mathbf{p'}\right>$。

### 正则对易关系

上面的对易关系：
$$[x_i,x_j]=0,[p_i,p_j]=0,[x_i,p_j]=i\hbar\delta_{ij} $$
被称为**正则对易关系**。

注意到正则对易关系和经典力学中的泊松括号其实有着相似的形式，结果也是乘了一个$i\hbar$。一般地，量子力学中有经典对应的各种观测量的对易关系都可以对应为：
$$[,]_{classical}=\frac{[,]}{i\hbar}$$

泊松括号的一些性质也可以自然的被应用在对易子上，比如：
$$[A,BC]=[A,B]C+B[A,C]$$
$$[A,[B,C]]+[B,[C,A]]+[C,[A,B]]=0 $$

## 1.7 Wave Functions in Position and Momentum Space

### 位置空间波函数

位置表象的波函数为$\psi(x')=\left< x'|\psi \right>$，从这一角度，我们可以得到波动力学中的一系列定义：
$$\left<\psi|\phi\right>=\int \left<\psi|x'\right>\left<x'|\phi\right>\mathrm{d}x'=\int \psi^*(x')\phi(x')\mathrm{d}x' \tag{1.7.2}$$
$$
\begin{aligned}
    \left<\psi|A|\phi\right>&=\iint \left<\psi|x'\right>\left<x'|A|x''\right>\left<x''|\phi\right>\mathrm{d}x'\mathrm{d}x''
    \\&=\iint \psi^*(x')\left<x'|A|x''\right>\phi(x'')\mathrm{d}x'\mathrm{d}x''
\end{aligned}
\tag{1.7.3}
$$
对一个一般的算符，矩阵元$\left< x'|A|x'' \right>$是$x',x''$的函数。而当$A$是位置算符的函数时（从而拥有相同的本征态），我们有：
$$\left<x'|f(x)|x''\right>=\left<x'|f(x'')|x''\right>=f(x'')\delta(x'-x'') $$
上面的乘积就可以写为：
$$\left<\psi|f(x)|\phi\right>=\int \psi^*(x')f(x')\phi(x')\mathrm{d}x' $$

### 动量空间波函数

下面我们来考虑动量表象下波函数和位置空间波函数的关系，从无穷小平移算符出发：
$$
\begin{aligned}
    \left(1-\frac{ip\delta x'}{\hbar}\right)\left|\alpha\right>&=\int \mathscr{T}(\delta x')\left|x'\right>\left<x'|\alpha\right>\mathrm{d}x'
    \\&=\int \left|x'+\delta x'\right>\left<x'|\alpha\right>\mathrm{d}x'
    \\&=\int \left|x'\right>\left<x'-\delta x'|\alpha\right>\mathrm{d}x'
    \\&=\int \left|x'\right>\left(\left<x'|\alpha\right>-\delta x'\frac{\partial}{\partial x'}\left<x'|\alpha\right>\right)\mathrm{d}x'
\end{aligned}
$$
对比等式两边，我们有：
$$p\left|\alpha\right>=-i\hbar\int \left|x'\right>\frac{\partial}{\partial x'}\left<x'|\alpha\right>\mathrm{d}x'$$
从而：
$$
\left<x'|p|\phi\right>=-i\hbar\frac{\partial}{\partial x'}\left<x'|\phi\right> \tag{1.7.4}
$$
等式两边其实都是波函数，因此这定义了一个波函数空间上的线性映射，将波函数映射为动量算符作用后的态矢对应的波函数。这也和波动力学中动量算符的定义一致：
$$p=-i\hbar\frac{\partial}{\partial x'}$$

现在我们可以考虑态矢在动量表象下的展开，即动量空间波函数。利用完备性关系，我们有：
$$
\begin{aligned}
    \left|\phi\right>&=\int \left|p'\right>\left<p'|\phi\right>\mathrm{d}p'
    \\&=\iint \left|p'\right>\left<p'|x'\right>\left<x'|\phi\right>\mathrm{d}p'\mathrm{d}x'
    \\&=\int \mathrm{d}p'\left|p'\right>\int \left<p'|x'\right>\phi(x')\mathrm{d}x'
\end{aligned}
$$
对其中出现的$\left< p'|x' \right>$，考虑1.7.4中任意态$\phi$为动量本征态的情况，有：
$$\left<x'|p|p'\right>=p'\left<x'|p'\right>=-i\hbar\frac{\partial}{\partial x'}\left<x'|p'\right> $$
从而：
$$\left<x'|p'\right>=N\exp\left(\frac{ip'x'}{\hbar}\right) $$
其中$N$是归一化常数，考虑$\left< x'|x'' \right>$：
$$
\begin{aligned}
    \left<x'|x''\right>&=\delta(x'-x'')
    \\&=\int \left<x'|p'\right>\left<p'|x''\right>\mathrm{d}p'
    \\&=\int \left|N\right|^2\exp\left[\frac{ip'(x'-x'')}{\hbar}\right]\mathrm{d}p'
    \\&=2\pi\hbar\left|N\right|^2\delta(x'-x'')
\end{aligned}
$$
从而有：
$$\left<x'|p'\right>=\frac{1}{\sqrt{2\pi\hbar}}\exp\left(\frac{ip'x'}{\hbar}\right) \tag{1.7.5}$$

从而我们得到位置空间波函数到动量空间波函数的变换：
$$\phi_p(p')=\frac{1}{\sqrt{2\pi\hbar}}\int \phi_x(x')\exp\left(\frac{ip'x'}{\hbar}\right)\mathrm{d}x' \tag{1.7.6}$$
相似的，可以得到动量空间到位置空间的变换：
$$\phi_x(x')=\frac{1}{\sqrt{2\pi\hbar}}\int \phi_p(p')\exp\left(-\frac{ip'x'}{\hbar}\right)\mathrm{d}p' \tag{1.7.7}$$
这是傅里叶变换和傅里叶逆变换的形式。

### 推广至三维

三维的归一化条件和完备性关系成为：
$$\left<\mathbf{x'}|\mathbf{x''}\right>=\delta^3(\mathbf{x'}-\mathbf{x''}) $$
$$\int d^3\mathbf{x'}\left|\mathbf{x'}\right>\left<\mathbf{x'}\right|=1 $$
对动量本征态也是同样。

三维的动量算符作用在波函数上，微分成为梯度，1.7.4成为：
$$\left<\mathbf{x'}|\mathbf{p}|\phi\right>=-i\hbar\nabla'\left<\mathbf{x'}|\phi\right>$$

1.7.5成为：
$$\left<\mathbf{x'}|\mathbf{p'}\right>=\frac{1}{[2\pi\hbar]^{3/2}}\exp\left(\frac{i\mathbf{x'}\cdot\mathbf{p'}}{\hbar}\right) $$

位置空间和动量空间波函数间的变换也成为三维傅里叶变换：
$$\phi_p(\mathbf{p'})=\frac{1}{[2\pi\hbar]^{3/2}}\int \phi_x(\mathbf{x'})\exp\left(\frac{i\mathbf{p'}\cdot\mathbf{x'}}{\hbar}\right)\mathrm{d}\mathbf{x'} \tag{1.7.6}$$
$$\phi_x(\mathbf{x'})=\frac{1}{[2\pi\hbar]^{3/2}}\int \phi_p(\mathbf{p'})\exp\left(-\frac{i\mathbf{p'}\cdot\mathbf{x'}}{\hbar}\right)\mathrm{d}\mathbf{p'} \tag{1.7.7}$$

注意三维中位置波函数的量纲即成为长度的-3/2次方，这样粒子在全空间被发现的概率才仍然会是无量纲的1。