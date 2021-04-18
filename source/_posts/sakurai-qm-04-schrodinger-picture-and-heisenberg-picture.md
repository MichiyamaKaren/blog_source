---
title:       薛定谔绘景和海森堡绘景
description: Sakurai读书笔记（四）
date:        2020-10-17 22:04:53
mathjax:     true
categories:
    - 笔记
    - Sakurai量子力学笔记
tags:
    - 物理
---

## 时间演化的两种等效描述

在进入正题之前，我们先来考虑幺正变换，即对所有态矢实施：
$$ \left|\alpha\right> \rightarrow U\left|\alpha\right> $$
其中$U$可以是任意的幺正算符，包括空间平移或时间演化等。

注意幺正变换后内积保持不变，
$$ \left<\alpha'|\beta'\right> = \left<\alpha|U^\dagger U|\beta\right> =  \left<\alpha|\beta\right> $$
而形如$\left<\alpha|X|\beta\right>$的量则会产生变化：
$$ \left<\alpha'|X|\beta'\right> = \left<\alpha|U^\dagger X U|\beta\right> $$
由于我们实际上不能直接观测算符，而只能试图测量观测量在某组基下的分量，也就是形如$\left<\alpha|X|\beta\right>$的量，因此可以说下面两种看法：
- 算符不变，态矢$\left|\alpha\right> \rightarrow U\left|\alpha\right>$
- 态矢不变，算符$X\rightarrow U^\dagger X U$

是等价的。

时间演化算符就是一个幺正算符，因此对于量子系统的时间演化，我们也可以认为(1)态矢随时间演化而算符不变，或(2)算符随时间演化而态矢不变。第一种观点称为**薛定谔绘景**，第二种观点称为**海森堡绘景**。

由于态矢被用来描述系统的状态，为了描述随时间变化的系统，薛定谔绘景似乎是自然而然的，而海森堡绘景似乎物理意义并不明确。但事实上，考虑观测量是由算符表示的，海森堡绘景下可以更方便地看出观测量的演化，而这正是经典力学中我们所关注的。下面我们就来进一步讨论算符随时间如何演化。

## 海森堡运动方程

为了方便区分，对算符$A$，海森堡绘景下记为$A^{(H)}$，薛定谔绘景下记为$A^{(S)}$。$t=0$时有
$$ A^{(H)}(0) = A^{(S)} $$

海森堡绘景下的演化
$$ A^{(H)}(t) = \mathscr{U}(t)^\dagger A^{(S)} \mathscr{U}(t) $$
对时间求导，
$$
\begin{aligned}
    \frac{\mathrm{d}A^{(H)}}{\mathrm{d}t} &= \frac{\mathrm{d}\mathscr{U}^\dagger}{\mathrm{d}t}A^{(S)} \mathscr{U} + \mathscr{U}^\dagger A^{(S)} \frac{\mathrm{d}\mathscr{U}}{\mathrm{d}t}
    \\&= -\frac{1}{i\hbar}\mathscr{U}^\dagger H^{(S)} \mathscr{U}\mathscr{U}^\dagger A^{(S)}\mathscr{U} + \frac{1}{i\hbar} \mathscr{U}^\dagger A^{(S)} \mathscr{U}\mathscr{U}^\dagger H^{(S)}\mathscr{U}
    \\&= \frac{1}{i\hbar} \left[\mathscr{U}^\dagger A^{(S)} \mathscr{U}, \mathscr{U}^\dagger H^{(S)}\mathscr{U}\right]
    \\&= \frac{1}{i\hbar} \left[A^{(H)}, H^{(H)}\right]
\end{aligned}
$$
将$H$带入上式，可知$H$在海森堡绘景下也不变，故可以简写为
$$ \frac{\mathrm{d}A^{(H)}}{\mathrm{d}t} = \frac{1}{i\hbar} \left[A^{(H)}, H\right] $$
这即为**海森堡运动方程**。

海森堡运动方程的物理意义非常明显。将对易子$/i\hbar$换成泊松括号，这就是哈密顿力学中的运动方程。值得注意的是，即使算符$A$没有经典对应，海森堡运动方程仍然适用，这说明量子力学回到经典力学的过程是不可逆的。

### Erenfest定理

作为例子，考虑一个处在势场中的粒子：
$$ H = \frac{\mathbf{p}^2}{2m} + V(\mathbf{x}) $$

$$ \frac{\mathrm{d}\mathbf{x}}{\mathrm{d}t} = \frac{1}{i\hbar}[\mathbf{x},H] = \frac{\mathbf{p}}{m} $$
$$ \frac{\mathrm{d}\mathbf{p}}{\mathrm{d}t}  = \frac{1}{i\hbar}[\mathbf{p},H] = -\nabla V $$
从而
$$ m\frac{\mathrm{d}^2\mathbf{x}}{\mathrm{d}t^2} = -\nabla V $$
不出所料地，我们得到了牛顿第二定律的形式。求平均值即得到
$$ m\frac{\mathrm{d}^2\langle\mathbf{x}\rangle}{\mathrm{d}t^2} = -\nabla \langle V\rangle $$
这就是**Erenfest定理**。

## 本征矢的演化

最后，我们来讨论一下算符$A$的本征矢的演化。显然，算符的本征矢是依赖算符的，因此在薛定谔绘景下本征矢和算符一样不随时间改变：
$$ A^{(S)}|a'\rangle = a'|a'\rangle $$
从而海森堡绘景下
$$ A^{(H)}\mathscr{U}^\dagger|a'\rangle = \mathscr{U}^\dagger A^{(S)} |a'\rangle = a' \mathscr{U}^\dagger|a'\rangle $$
从而海森堡绘景下，本征矢按$\mathscr{U}^\dagger$演化，对应的本征值不变：
$$ |a', t\rangle_{H} = \mathscr{U}^\dagger |a', t=0\rangle_{H} $$
或者说其遵循反号的薛定谔方程：
$$ i\hbar\frac{\partial}{\partial t}|a', t\rangle_{H} = -H|a', t\rangle_{H} $$

特别地，考虑把态矢$|\alpha\rangle$展开成某个算符的本征矢$\{|a'\rangle\}$的线性叠加，相应的系数为
$$ c_{a'} = \langle a' | \alpha \rangle $$
考虑其时间演化，在薛定谔绘景下，$|\alpha\rangle$随时间变化，
$$ c_{a'}(t) = \langle a'| \cdot \left(\mathscr{U}|\alpha \rangle\right) $$
海森堡绘景下，$|a'\rangle$随时间变化，
$$ c_{a'}(t) = \left(\langle a'|\mathscr{U}\right) \cdot |\alpha\rangle $$
可见两种绘景依然给出相同结果。