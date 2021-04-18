---
title:      矢量和分析和曲线坐标系
description: 电动力学笔记（一）
date:       2019-03-14
mathjax:    true
categories:
    - 笔记
    - 电动力学笔记
tags:
    - 物理
---

# 1.矢量分析

## 1.1 矢量的定义

这里不深究矢量的定义，我们只考虑三维欧式空间$\mathbb{R}^3$中的矢量，它们有三个分量，并且分量在任意的坐标变换下与$\mathbf r=(x,y,z)$具有相同的变换形式。形象地说，“**矢量应该像矢量那样变换**”。

## 1.2 爱因斯坦求和约定

我们经常会遇到形式相同的几项求和的式子，比如：
$$
\mathbf A \cdot \mathbf B = A_1B_1+A_2B_2+A_3B_3 = \sum_{i=1}^3 A_iB_i
$$
我们可以省略求和符号$\sum$，仅使用$A_iB_i$来表示上式，在确定的上下文中这一般不会导致误会。

具体地说，若在表达式中出现了重复指标（称作**哑指标**），那么自动对其求和。（严格地讲要求哑指标一上一下，但是在这里由于$\mathbb R^3$上的基和对偶基是相等的，故不对矢量的协变和逆变表示，即上下指标做区分。在下面曲线坐标系一节将介绍矢量的协变和逆变表示。）

使用爱因斯坦求和约定的表达式还有以下规则：
1. 每一项中一个哑指标最多出现两次。比如不允许出现类似$A_iB_iC_i$的项
2. 一个表达式中所有项中包含的不被求和的指标（即**自由指标**），比如不允许出现类似$A_iB_iC_j+C_k$的表达式。
当然这些规定并不是不允许进行这样的运算，仅仅是说明在矢量分析中不会出现这样的表达式而已。其作用也在于，若推导出了不符合这两条规则的表达式，那么可能需要对计算过程重新检查。

另外，使用爱因斯坦求和约定的表达式的一个常用的性质是，**可以将哑指标替换为其他的指标而不改变表达式的值**。例如：$A_iB_i+A_jB_j=A_iB_i+A_iB_i=2A_iB_i$。这一性质在表达式的化简中经常会用到。

利用爱因斯坦求和约定，我们可以给出$\mathbb R^3$中的矢量的点乘和叉乘的分量形式：

 - 矢量$\mathbf A$用分量表示为$\mathbf A=A_i\mathbf e_i$
 - 从而矢量的点乘为：
$$
\mathbf A \cdot \mathbf B = A_i\mathbf e_i \cdot B_j \mathbf e_j = A_iB_j \mathbf e_i \cdot \mathbf e_j = A_iB_j \delta_{ij} = A_iB_i
$$
其中克罗内克$\delta$函数定义为：
$$
\delta_{ij} = \left\{
\begin{matrix}
 1 & (i=j)
\\0 & (i \neq j)
\end{matrix}
\right.
$$
 - 根据定义，矢量叉乘：
$$
\mathbf A \times \mathbf B = (A_2B_3-A_3B_2)\mathbf e_1 + (A_3B_1-A_1B_3)\mathbf e_2 + (A_1B_2-A_2B_1)\mathbf e_3
$$
可以使用爱因斯坦求和标记记为：
$$
\mathbf A \times \mathbf B = \epsilon_{ijk}A_jB_k\mathbf e_i
$$
其中Levi-Civita符号$\epsilon_{ijk}$定义为：
$$
\epsilon_{ijk}=\left\{
\begin{matrix}
1 & (i,j,k)是(1,2,3)的偶置换
\\-1 & (i,j,k)是(1,2,3)的奇置换
\\0 & 其他（即(i,j,k)中存在两者相等）
\end{matrix}
\right.
$$
另外,Levi-Civita符号有一常用性质：
$$
\epsilon_{ijk}\epsilon_{imn} = \delta_{jm}\delta_{kn} - \delta_{jn}\delta_{km}
$$

## 1.3 矢量分析

两个常用的公式是：
$$ \mathbf A \times(\mathbf B \times \mathbf C)=(\mathbf A\cdot \mathbf C)\mathbf B-(\mathbf A\cdot\mathbf B)\mathbf C \tag{1.3.1} $$
$$ \mathbf A\cdot(\mathbf B\times\mathbf C)=\mathbf B\cdot(\mathbf C\times\mathbf A)=\mathbf C\cdot(\mathbf A\times\mathbf B) \tag{1.3.2} $$
在矢量分析的表达式中经常出现的是纳布拉算符$\nabla$（定义为$\nabla=\frac{\partial}{\partial x^i}\mathbf e_i$），作为微分算符，$\nabla$和分量为实数的矢量的运算规则不尽相同。下面对于出现$\nabla$的表达式，以$\nabla\times(\mathbf A\times \mathbf B)$为例介绍两种分析的方法：
1. 式中出现了两个矢量$\mathbf A$和$\mathbf B$，$\nabla$对二者都有作用，那么可以写成$\nabla_{\mathbf A}\times(\mathbf A\times\mathbf B)+\nabla_{\mathbf B}\times(\mathbf A\times\mathbf B)$，其中$\nabla_{\mathbf A}$只对$\mathbf A$作用，$\nabla_{\mathbf B}$只对$\mathbf B$作用。从而由(1.3.1)式，对第一项有：
$$
\nabla_{\mathbf A}\times(\mathbf A\times\mathbf B)=(\mathbf B\cdot\nabla_{\mathbf A})\mathbf A-(\nabla_{\mathbf A}\cdot\mathbf A)\mathbf B
$$
这里$\nabla_{\mathbf A}$只对$\mathbf A$有作用，因此其与$\mathbf B$的点乘是可以交换的，进行恒等变换使得最后式中$\nabla_{\mathbf A}$只作用在$\mathbf A$上，从而保证在最后化回$\nabla$时不会引起歧义。  
对$\nabla_{\mathbf B}$的式子同理，最后结果为：
$$
\begin{aligned}
\nabla\times(\mathbf A\times \mathbf B)&=(\mathbf B\cdot\nabla_{\mathbf A})\mathbf A-(\nabla_{\mathbf A}\cdot\mathbf A)\mathbf B + (\nabla_{\mathbf B}\cdot\mathbf B)\mathbf A-(\mathbf A\cdot\nabla_{\mathbf B})\mathbf B
\\&=(\mathbf B\cdot\nabla)\mathbf A-(\nabla\cdot\mathbf A)\mathbf B + (\nabla\cdot\mathbf B)\mathbf A-(\mathbf A\cdot\nabla)\mathbf B
\end{aligned}
$$
2. 使用爱因斯坦求和约定展开：
$$
\begin{aligned}
\nabla\times(\mathbf A\times \mathbf B) &= \epsilon_{ijk}\frac{\partial}{\partial x^j}(\mathbf A\times\mathbf B)_k\mathbf e_i
\\ &=\epsilon_{ijk}\frac{\partial}{\partial x^j}(\epsilon_{klm}A_lB_m)\mathbf e_i  = \epsilon_{kij}\frac{\partial}{\partial x^j}(\epsilon_{klm}A_lB_m)\mathbf e_i 
\\&=(\delta_{il}\delta_{jm}-\delta_{im}\delta_{jl})\frac{\partial}{\partial x^j}(A_lB_m)\mathbf e_i
\\ &=\frac{\partial}{\partial x^j}(A_iB_j)\mathbf e_i-\frac{\partial}{\partial x^j}(A_jB_i)\mathbf e_i
\\ &=B_j\frac{\partial A_i}{\partial x^j}\mathbf e_i + \frac{\partial B_j}{\partial x^j}A_i\mathbf e_i - \frac{\partial A_j}{\partial x^j}B_i\mathbf e_i - A_j\frac{\partial B_i}{\partial x^j}\mathbf e_i
\\ &=(\mathbf B\cdot\nabla)\mathbf A + (\nabla\cdot\mathbf B)\mathbf A - (\nabla\cdot\mathbf A)\mathbf B -(\mathbf A\cdot\nabla)\mathbf B
\end{aligned}
$$

两种方法都得到了正确结果。

# 2.曲线坐标系

这一部分的说明旨在表述具有一般性地给出在曲线坐标系对矢量的描述，并介绍同一个矢量的协变和逆变表示。注意我们仍在讨论$\mathbb{R}^3$中的矢量，而非在微分流形上定义的，虽然二者具有相似性，但这里的矢量基和对偶基处于同一个线性空间。

本节内容来自[《Flux Coordinates and Magnetic Field Structure》](https://link.springer.com/book/10.1007%2F978-3-642-75595-8)。

## 2.1 矢量的对偶集合（reciprocal sets）

称矢量集合$\{\mathbf A,\mathbf B,\mathbf C\}$和$\{\mathbf a,\mathbf b,\mathbf c\}$为对偶集合，若：
$$ \mathbf A\cdot\mathbf a=\mathbf B\cdot\mathbf b=\mathbf C\cdot\mathbf c=1 $$
$$ \mathbf A\cdot\mathbf b=\mathbf A\cdot\mathbf c=\cdots=0 $$
。即，一个集合的每个元素都和另一个集合的一个元素的内积为1，并和另外两个元素正交。这两个集合中的元素都是线性无关的（否则，存在$\lambda,\mu,\gamma\neq0$，使$\lambda\mathbf A+\mu\mathbf B+\gamma\mathbf C=0$，从而$(\lambda\mathbf A+\mu\mathbf B+\gamma\mathbf C)\cdot\mathbf a=\lambda=0$，矛盾）。从而，对任意的矢量$\mathbf W$，都可以表示为这两个集合中的元素的线性组合：
$$\mathbf W=(\mathbf W\cdot\mathbf a)\mathbf A+(\mathbf W\cdot\mathbf b)\mathbf B+(\mathbf W\cdot\mathbf c)\mathbf C$$
或：
$$\mathbf W=(\mathbf W\cdot\mathbf A)\mathbf a+(\mathbf W\cdot\mathbf B)\mathbf b+(\mathbf W\cdot\mathbf C)\mathbf c$$

另外，由于$\{\mathbf A,\mathbf B,\mathbf C\}$线性无关，其对偶集合是唯一的，可以表示为：
$$
\mathbf a=\frac{\mathbf B\times\mathbf C}{\mathbf A\cdot(\mathbf B\times\mathbf C)} ,\mathbf b=\frac{\mathbf C\times\mathbf A}{\mathbf B\cdot(\mathbf C\times\mathbf A)} ,\mathbf c=\frac{\mathbf A\times\mathbf B}{\mathbf C\cdot(\mathbf A\times\mathbf B)} \tag{2.1.1}
$$
容易验证(2.1.1)给出的对偶集合满足上面介绍的对偶集合的定义。

## 2.2 曲线坐标基

考虑坐标变换$\mathbf R(u^1,u^2,u^3)$：
$$ x=x(u^1,u^2,u^3) $$
$$ y=y(u^1,u^2,u^3) $$
$$ z=z(u^1,u^2,u^3) $$
要求这个变换是独立的，即可以用$u^1,u^2,u^3$表示$x,y,z$（严谨地说，Jacobi行列式非零）。

令$(u^1,u^2,u^3)$中一个坐标为定值，可以确定一个曲面，称为**坐标曲面**。令两个坐标为定值，则确定了一条曲线，称为**坐标曲线**。显然任意一条坐标曲线都可以看作两个坐标面的交线。

对空间中的任意一点$P$，有三条经过$P$的坐标曲线，坐标曲线的切线方向可以定义一组基：
$$
\mathbf e_1=\frac{\partial \mathbf R}{\partial u^1},\mathbf e_2=\frac{\partial \mathbf R}{\partial u^2},\mathbf e_3=\frac{\partial \mathbf R}{\partial u^3} \tag{2.2.1}
$$
根据Jacobi行列式非零，$\{\mathbf e_1,\mathbf e_2,\mathbf e_3\}$线性无关。这里与直角坐标系的区别在于，坐标基本身是位置的函数，不一定是常量。 

另一方面，过同一点的三个坐标曲面的法线方向也可以定义另一组基。曲面某一点的法线方向应该与曲面上过这一点的曲线的切线方向垂直。注意到$\mathrm{d}u^i=\nabla u^i\cdot\mathrm{d}\mathbf{R}$，从而$\mathrm{d}\mathbf{R}=\frac{\partial \mathbf R}{\partial u^j}\mathbf du^j = \mathbf e_j\mathrm{d}u^j$，带回，$\mathrm{d}u^i=\nabla u^i\cdot\mathbf e_j\mathrm{d}u^j$，由于$u^1,u^2,u^3$互相独立，有：
$$\nabla u^i\cdot\mathbf e_j=\delta_j^i$$
这满足我们对曲线法线的期望，定义另外一组基如下：
$$\mathbf e^1=\nabla u^1,\mathbf e^2=\nabla u^2,\mathbf e^3=\nabla u^3 \tag{2.2.2}$$
另外由推导的过程我们知道，$\{\mathbf e_1,\mathbf e_2,\mathbf e_3\}$和$\{\mathbf e^1,\mathbf e^2,\mathbf e^3\}$是一对对偶矢量集合，分别称作**基**和**对偶基**。

>作为例子，让我们考虑球坐标：
$$ x=r\sin\theta\cos\phi $$
$$ y=r\sin\theta\sin\phi $$
$$ z=r\cos\theta $$
根据2.2.1，坐标基为：
$$ \mathbf{e_r}=\frac{\partial \mathbf R}{\partial r}=\sin\theta\cos\phi \mathbf{e_x}+\sin\theta\sin\phi \mathbf{e_y}+\cos\theta\mathbf{e_z} $$
$$ \mathbf{e_{\theta}}=\frac{\partial \mathbf R}{\partial \theta}=r\cos\theta\cos\phi \mathbf{e_x}+r\cos\theta\sin\phi \mathbf{e_y}-r\sin\theta\mathbf{e_z} $$
$$ \mathbf{e_{\phi}}=\frac{\partial \mathbf R}{\partial \theta}=-r\sin\theta\sin\phi \mathbf{e_x}+r\sin\theta\cos\phi \mathbf{e_y} $$
一般会对其进行归一化，这使它们成为坐标曲线的单位切向量，归一化的结果为：
$$ \mathbf{e_r}=\sin\theta\cos\phi \mathbf{e_x}+\sin\theta\sin\phi \mathbf{e_y}+\cos\theta\mathbf{e_z} $$
$$ \mathbf{e_{\theta}}=\cos\theta\cos\phi \mathbf{e_x}+\cos\theta\sin\phi \mathbf{e_y}-\sin\theta\mathbf{e_z} $$
$$ \mathbf{e_{\phi}}=-\sin\theta\sin\phi \mathbf{e_x}+\sin\theta\cos\phi \mathbf{e_y} $$

## 2.3 矢量的协变和逆变分量

前面我们说过，可以用对偶矢量集合的线性叠加表示任意矢量，即：
$$
\mathbf D = D^i\mathbf e_i = D_i\mathbf e^i
$$
,其中：
$$ D^i=\mathbf D\cdot\mathbf e^i $$
$$ D_i=\mathbf D\cdot\mathbf e_i $$
用上、下指标表示的分量$D^i,D_i$分别称作**逆变分量**、**协变分量**。

下面的论述不完全准确地讨论了协变和逆变分量的含义。考虑不同于$\{\mathbf e_1,\mathbf e_2,\mathbf e_3\}$的另一组线性无关的基$\{\mathbf e_1',\mathbf e_2',\mathbf e_3'\}$，相应的对偶集合$\{\mathbf e^1{}' ,\mathbf e^2{}',\mathbf e^3{}'\}$。两组基之间的坐标变换为$\mathbf e_i'=T_i^{\alpha}\mathbf e_{\alpha},\mathbf e^j{}'=T_{\beta}^j\mathbf e^{\beta}$。由对偶集合的定义，应有：
$$
\begin{aligned}
    \mathbf e_i'\cdot\mathbf e^j{}' &=  T_i^{\alpha}\mathbf e_{\alpha} \cdot T_{\beta}^j\mathbf e^{\beta} = T_i^{\alpha}T_{\beta}^j \delta_{\alpha}^{\beta} = T_i^{\alpha}T_{\alpha}^j
    \\&= \delta_i^j
\end{aligned}
$$
说明基和对偶基的坐标变换矩阵$T_i^{\alpha}$和$T_{\beta}^j$的分量形式构成的矩阵互逆。矢量$\mathbf D$的协变分量$D_i=\mathbf D\cdot\mathbf e_i$，和基的变换方式相同，故称作协变；同理，逆变分量和对偶基的变换方式相同，其变换矩阵为基的逆矩阵，故称为逆变。（事实上$T_i^{\alpha}$和$T_{\beta}^j$不是两个矩阵，而是同一个张量在不同的基下的分量形式）

需要注意矢量的协变表示和逆变表示与协变矢量和逆变矢量是不同的概念，在$\mathbb R^3$中不对后者进行区分。

## 2.4 度规

对任意矢量$\mathbf D$，有：
$$
\begin{aligned}
    D_i &= \mathbf D\cdot\mathbf e_i = (D^j\mathbf e_j)\cdot\mathbf e_i
    \\&=D^j(\mathbf e_i\cdot\mathbf e_j) = g_{ij}D^j
\end{aligned}
$$
由此，根据分量：
$$
g_{ij}=\mathbf e_i\cdot\mathbf e_j = \frac{\partial\mathbf R}{\partial u^i}\cdot\frac{\partial\mathbf R}{\partial u^j} \tag{2.4.1}
$$
确定了一个二阶张量，称作**度规**。这里不准备展开介绍张量的定义，但需注意度规不仅仅是一个矩阵，而应被看做一个线性映射，它建立了基和对偶基下表示的矢量的联系。

度规在对偶基下的分量形式为：
$$
g^{ij}=\mathbf e^i\cdot\mathbf e^j = \nabla u^i\cdot\nabla u^j \tag{2.4.2}
$$

由上面的讨论，我们知道，可以使用度规进行矢量协变和逆变分量的转换。根据爱因斯坦求和约定，可以很容易得到转换的表达式。例如，要得到根据矢量$\mathbf D$的协变分量（下指标）得到逆变分量（上指标），则需要使用度规在对偶基下的分量（两个上指标）进行运算，即哑指标一上一下，自由指标为上指标。从而得到：$D^i=g^{ij}D_j$。

另外，借助度规，可以表示两个矢量的点乘和叉乘运算的同一类分量形式：
$$
\begin{aligned}
    \mathbf A\cdot\mathbf B &= (A^i\mathbf e_i)\cdot(B^j\mathbf e_j)=g_{ij}A^iB^j
    \\&= (A_i\mathbf e^i)\cdot(B_j\mathbf e^j)=g^{ij}A_iB_j
\end{aligned}
$$
特别地，$\mathrm{d}\mathbf{R}\cdot\mathbf{dR} = g_{ij}(\mathrm{d}\mathbf{R})^i(\mathrm{d}\mathbf{R})^j = g_{ij}\mathbf{d}u^i\mathbf{d}u^j$。（其中$(\mathrm{d}\mathbf{R})^i = \nabla u^i\cdot\mathrm{d}\mathbf{R} = \mathbf du^i$），这告诉我们度规也蕴含了曲线坐标系中的线元长度。

对矢量的叉乘：
$$
\begin{aligned}
    \mathbf A\times\mathbf B &= A^iB^j(\mathbf e_i\times\mathbf e_j)
\\&=A^iB^j\epsilon_{kij}\mathbf e^k(\mathbf e_k\cdot(\mathbf e_i\times\mathbf e_j))
\\&=\epsilon_{kij}A^iB^j\mathbf e^k
\end{aligned}
$$
上面的推导用到了(2.1.1)式，当且仅当$(k,i,j)$是$(1,2,3)$的偶置换时有$\mathbf e^k = \frac{\mathbf e_i\times\mathbf e_j}{\mathbf e_k\cdot(\mathbf e_i\times\mathbf e_j)}$，且由(1.3.2)式，对所有偶置换，分母都相等。式中
$$
\begin{aligned}
    J &= \mathbf e_1\cdot(\mathbf e_2\times\mathbf e_3) = \frac{\partial \mathbf R}{\partial u^1}\cdot(\frac{\partial \mathbf R}{\partial u^2}\times\frac{\partial \mathbf R}{\partial u^3})
    \\&=
    \begin{vmatrix}
        \frac{\partial x}{\partial u^1} & \frac{\partial y}{\partial u^1} & \frac{\partial z}{\partial u^1} 
        \\ \frac{\partial x}{\partial u^2} & \frac{\partial y}{\partial u^2} & \frac{\partial z}{\partial u^2}
        \\ \frac{\partial x}{\partial u^3} & \frac{\partial y}{\partial u^3} & \frac{\partial z}{\partial u^3}
    \end{vmatrix}
\end{aligned}
$$
为Jacobi行列式。把度规的分量$g_{ij}$写成矩阵，发现其元素$g_{ij}=\sum_{q=1}^{3}\frac{\partial \mathbf R^q}{\partial u^i}\cdot\frac{\partial \mathbf R^q}{\partial u^j}$，可以写成上面的Jacobi矩阵与其转置的积，那么我们有：
$$ g=det(g_{ij})=J^2 $$