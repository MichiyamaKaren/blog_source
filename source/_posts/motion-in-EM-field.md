---
title:      电磁场中运动的粒子
description: 电动力学笔记（三）
date:       2019-03-30
author:     y
mathjax:    true
categories:
    - 笔记
    - 电动力学笔记
tags:
    - 物理
---

# 1.电磁场-粒子耦合作用量 

~~（目前还不存在的）~~上一节告诉我们，闵氏时空中的自由粒子的作用量为：
$$S_p=\int mc^2\mathbf d\tau=\int \frac {mc^2} {\gamma} \mathbf dt$$
要描述一个在电磁场中运动的粒子，其作用量应再加上一项粒子与场的耦合项$S_{pf}$，即$S=S_p+S_{pf}$。

实验告诉我们，应该使用一个4-矢量$A^{\alpha}=(\phi/c,\mathbf A)$描述电磁场，我们会在后面看到$A^{\alpha}$的时间、空间分量的物理意义。另外，作用量应为标量。因此我们猜测$S_{pf}$的形式为：
$$S_{pf}=-q\int A_{\alpha}\mathbf dx^{\alpha}$$
其中$q$也是一个标量，它表示了粒子与电磁场耦合的强度。
从而，粒子的作用量：
$$
\begin{align*}
S &=\int \frac m {\gamma} \mathbf dt - qA_{\alpha}\mathbf dx^{\alpha}
\\&= \int dt\left(\frac {mc^2}{\gamma} + q\phi - q\mathbf A\cdot\frac{d\mathbf x}{dt}\right)
\\&= \int \left(mc^2\sqrt{1-\frac{v^2}{c^2}} - q(\mathbf A\cdot \mathbf v - \phi)\right)dt
\end{align*}
$$

# 2.粒子的运动方程

得到作用量后，通过喜闻乐见的欧拉-拉格朗日方程推出运动方程：
$$
\begin{align*}
\frac{\partial L}{\partial v} &= -m\gamma\mathbf v -q\mathbf A = -\mathbf p - q\mathbf A
\\ \frac{\partial L}{\partial \mathbf r} &= -q\nabla(\mathbf A\cdot\mathbf v-\phi)
\\&= -q((\mathbf v\cdot\nabla)\mathbf A + \mathbf v\times(\nabla\times\mathbf A) - \nabla\phi)
\end{align*}
$$
从而：
$$d\frac{\mathbf{p}}{dt} = q\left( -\frac{d\mathbf{A}}{dt} + (\mathbf v\cdot\nabla)\mathbf A + \mathbf v\times(\nabla\times\mathbf A) - \nabla\phi \right)
$$
注意到：
$$
\frac{d\mathbf{A}}{dt} = \frac{\partial\mathbf A}{\partial t} + \frac{\partial\mathbf A}{\partial x^i}\frac{\partial x^i}{\partial t} = \frac{\partial\mathbf A}{\partial t} + (\mathbf v\cdot\nabla)\mathbf A
$$
故有：
$$ \frac{d\mathbf{p}}{dt} = q\left( -\frac{\partial\mathbf{A}}{\partial t} - \nabla\phi + \mathbf v\times(\nabla\times\mathbf A) \right)
$$
前两项与$\mathbf v$无关，最后一项则与$\mathbf v$有关。因此，我们可以定义：
$$
\mathbf E = -\frac{\partial\mathbf{A}}{\partial t} - \nabla\phi
\\ \mathbf B = \nabla\times\mathbf A
$$
$\mathbf E$为电场强度，$\mathbf B$为磁感应强度。
从而粒子的运动方程为：
$$\frac{\mathbf{dp}}{\mathbf dt} = q\mathbf E + q\mathbf v\times\mathbf B $$
这和我们所了解的电磁学中粒子在电磁场中的运动方程相同。

另外，根据上面的定义，我们有：
$$
\nabla\times\mathbf E = -\frac{\partial\nabla\times\mathbf A }{\partial t} - \nabla\times\nabla\phi = -\frac{\partial\mathbf B}{\partial t}
\\ \nabla\cdot\mathbf B = \nabla\cdot\nabla\times\mathbf A = 0
$$
这是麦克斯韦方程组中的两个方程。

# 3.规范不变性

我们知道，拉氏量增加一个函数对时间的全导数不会改变运动方程，即：
$$
L'=-q(\phi-\mathbf A\cdot \mathbf v)+q\frac{df}{dt} = -q\left[ \left(\phi-\frac{\partial f}{\partial t}\right) + (\mathbf A+\nabla f)\cdot \mathbf v \right]
$$
和拉氏量$L=qA_{\alpha}x^{\alpha}$给出完全相同的运动方程。这即是说$A^{\alpha}$经过变换：
$$
\phi' = \phi - \frac{\partial f}{\partial t}
\\ \mathbf A' = \mathbf A+\nabla f
$$
后给出相同的运动方程。这种不变性称作**规范不变性**，上面的变换式称作**规范变换**。

规范不变性告诉我们，描述电磁场的矢量$A^{\alpha}$具有一个额外的自由度。因此我们可以人为地选定一种规范以简化问题。比如，**库仑规范**：
$$\nabla\cdot\mathbf A = 0$$
另外一种规范被称作**洛伦兹规范(Lorenz Gauge)**：
$$\nabla\cdot\mathbf A+\frac 1 {c^2}\frac{\partial \phi}{\partial t}=0$$
写成四维形式：
$$\frac{\partial A^{\alpha}}{\partial x^{\alpha}}=0$$
可见洛伦兹规范满足洛伦兹不变性，这一规范在后面也会被用到。

# 4.协变形式的运动方程

在上一节中我们已经求出的$S_p$的变分：
$$\delta S_p = m\int \frac{du_{\alpha}}{d\tau}\delta x^{\alpha} d\tau $$
现在再来看$S_{pf}$，其协变形式为：
$$S_{pf} = -\int qA_{\alpha} dx_{\alpha} $$
对其做变分：
$$
\begin{align*}
\delta S_{pf} &= -q\int \delta A_{\alpha}dx_{\alpha} + A_{\alpha}\delta dx_{\alpha}
\\ &= -q\int \frac{\partial A_{\alpha}}{\partial x^{\beta}}\delta x^{\beta} dx_{\alpha} + A_{\alpha}\delta dx_{\alpha}
\\ &= -q\int \frac{\partial A_{\alpha}}{\partial x^{\beta}}\delta x^{\beta} dx_{\alpha} - \delta x_{\alpha} dA_{\alpha}
\\ &= -q\int \left(\frac{\partial A_{\beta}}{\partial x^{\alpha}} - \frac{\partial A_{\alpha}}{\partial x^{\beta}} \right) \delta x^{\alpha}dx^{\beta}
\\ &= -q\int F_{\alpha\beta} \delta x^{\alpha}dx^{\beta}
\end{align*}
$$
其中：
$$F_{\alpha\beta}=\frac{\partial A_{\beta}}{\partial x^{\alpha}}-\frac{\partial A_{\alpha}}{\partial x^{\beta}}$$
定义为**电磁场张量**。

那么粒子的作用量的变分即为：
$$
\delta S=\int \left(m\frac{du_{\alpha}}{d\tau} - F_{\alpha\beta}u^{\beta} \right)\delta x^{\alpha}d\tau 
$$
从而得到粒子的运动方程：
$$ m\frac{du_{\alpha}}{d\tau} = F_{\alpha\beta}u^{\beta} $$

另外，根据上面2节中的$\mathbf E,\mathbf B$的定义，电磁场张量的分量形式为：
$$
F_{\alpha\beta} = 
\begin{pmatrix}
0 & E_x/c & E_y/c & E_z/c
\\ -E_x/c & 0 & -B_z & B_y
\\ -E_y/c & B_z & 0 & -B_x
\\ -E_z/c & -B_y & B_x & 0
\end{pmatrix}
$$

# 5.电磁场的洛伦兹变换

## 5.1 电场和磁场的变换式

电场和磁场可看作电磁场张量的分量，可以简单的由张量的洛伦兹变换给出其在不同惯性系中的变换式：
$$
E_x=E_x',\ E_y = \frac{E_y'+VB_z'}{\sqrt{1-V^2/c^2}},\ E_z=\frac{E_z'-VB_y'}{\sqrt{1-V^2/c^2}}
\\B_x=B_x',\ B_y = \frac{B_y'-VE_z'}{\sqrt{1-V^2/c^2}},\ E_z=\frac{B_z'+VE_y'}{\sqrt{1-V^2/c^2}}
$$
在低速近似$V<<1$下，上式化为：
$$
\mathbf E = \mathbf E' + \mathbf B'\times \mathbf V
\\ \mathbf B = \mathbf B' - \frac 1 {c^2}\mathbf E' \times \mathbf V
$$

## 5.2 电磁场的洛伦兹不变量

寻找洛伦兹不变量，即寻找标量。我们可以通过构造上下指标互相匹配，即不含自由指标的表达式来构造张量。

一个洛伦兹不变量为：
$$\frac {c^2} 2 F_{\alpha\beta}F^{\alpha\beta} = c^2B^2-E^2 $$

在给出第二个洛伦兹不变量前，先说明四阶单位反对称张量$e^{\alpha\beta\mu\nu}$的定义：  
和Levi-Civita算符$\epsilon_{ijk}$类似，若$\alpha,\beta,\mu,\nu$任意两个指标相同，则$ e^{\alpha\beta\mu\nu} = 0 $；规定$ e^{0123}=1 $，交换任意两个指标后的结果为交换前的相反数。可以证明$e^{\alpha\beta\mu\nu}$在归一化的坐标变换（变换矩阵行列式为1）下分量的值不变，而洛伦兹变换正是归一化的。从而有洛伦兹不变量：
$$-\frac 1 2 F_{\beta\alpha}e^{\alpha\beta\mu\nu}F^{\nu\mu} = \mathbf E\cdot\mathbf B$$

可以由这两个洛伦兹不变量得出一些简单的性质：
1. 若在惯性系K中有$E>cB$，则$E>cB$在任意惯性系中都成立。反之亦然。
2. 若在惯性系K中$\mathbf E\perp\ \mathbf B$，则$\mathbf E\perp\ \mathbf B$在任意惯性系中都成立，并且可以找到惯性系K'使得其中$\mathbf B=0$（当$E>cB$）或$\mathbf E=0$（当$cB>E$）。

## 5.3 匀速运动电荷的电场

下面用两种方法给出在惯性系K中以速度$V\mathbf e_x$匀速运动的电荷产生的电磁场。

在相对K以$V\mathbf e_x$速度运动的惯性系K'中。K'中的电磁场由静电荷激发，其形式已知。从而我们有：
$$
-\nabla\cdot\phi' = \frac 1 {4\pi\epsilon_0}\frac q {r'^2}\hat{\mathbf r}
\\ \nabla\times\mathbf A'=0
$$
从而可以选取
$$\phi'=\frac q {4\pi\epsilon_0}\frac 1 {r'},\mathbf A'=0$$
变换到K系：
$$
\phi = \gamma(\phi'+VA_x') = \gamma\frac q {4\pi\epsilon_0}\frac 1 {r'}
\\ A_x = \gamma(A_x'+V\phi') = \gamma V \frac q {4\pi\epsilon_0}\frac 1 {r'}
\\ A_y=A_z=0
$$
其中，
$$
\begin{align*}
r' &= \sqrt{\gamma^2(x-Vt)^2+y^2+z^2}
\\ &= R\sqrt{\gamma^2\cos^2\theta+\sin^2\theta}
\end{align*}
$$
其中$\mathbf R$为电荷指向场点的矢量，$\theta$为$\mathbf R$与$x$方向的夹角。
从而电场：
$$
\begin{align*}
\mathbf E &= -\frac{\partial\mathbf{A}}{\partial t} - \nabla\phi
\\ &=  \frac q {4\pi\epsilon_0} \left(-\gamma V \frac{\gamma^2(x-Vt)V}{r'^3}\mathbf e_x + \gamma \frac{\gamma^2(x-Vt)\mathbf e_x+y\mathbf e_y+z\mathbf e_z}{r'^3} \right)
\\ &= \frac q {4\pi\epsilon_0}\frac 1 {r'^3} \left( \gamma(x-Vt) \mathbf e_x + \gamma y\mathbf e_y + \gamma z\mathbf e_z \right)
\\ &= \frac q {4\pi\epsilon_0}\frac 1 {R^2}\frac{\gamma}{(\gamma^2\cos^2\theta+\sin^2\theta)^{3/2}}\hat{\mathbf R}
\end{align*}
$$
可见，运动电荷的电场和静电场相比，在运动方向（$\theta=0$）上衰减了$\frac 1 {\gamma^2}$倍，在垂直方向（$\theta=\frac {\pi} 2 $）上增大了$\gamma$倍。

另一种方法是通过5.1中的电场的洛伦兹变换求出运动电荷的电场：
$$
E_x = E_x',E_y=\gamma E_y',E_z=\gamma E_z'
$$
这看起来与上面的结果是矛盾的：上面的推导给出在运动方向上电场强度衰减了$\frac 1 {\gamma^2}$倍，而这里$x$方向上电场强度的大小在K和K'系中相等。事实上，两个结果并不矛盾，因为$\mathbf E$是空间的函数，而同一点在不同惯性系中的坐标也不相同。例如，考虑$t=0$时刻的电场，我们有：
$$
E_x(x)=E_x'(x')=E_x'(\gamma x)=\frac 1 {\gamma^2}E_x'(x)
$$
$y,z$方向同理，因此两种方法给出相同的结果。