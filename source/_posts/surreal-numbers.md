---
title: 关于超现实数
description: 《研究之美》读书笔记
date: 2020-05-30
mathjax: true
categories:
    - 数学
tags:
    - 数学
---

《研究之美》中描写了这样一个故事：在远离尘世的小岛上“寻找自我”的两人，根据石碑上记载的基本定义，从零开始发展出了一个不同的数学体系——超现实数(**surreal numbers**)。

书中比起介绍的内容，从已知的基本定义开始扩展得出有意义的定理的过程也同样精彩。本文则是一种相对拙劣的总结，试图将其中的内容以一种更清晰易懂的方式重新叙述出来。因此本文不足以成为《研究之美》的替代，也希望本文可以使更多人阅读这一值得被阅读的作品。

## 数的定义和序关系
**数**被定义为两个数集：
$$ x=(X_L,X_R),\ \mathrm{where}\quad X_L\ngeq X_R \tag{1} $$
其中$X_L\ngeq X_R$是指任意$X_L$中的元素$x_L$和$X_R$中的元素$x_R$都有$x_L\ngeq x_R$。（如果$X_L$和$X_R$其中有一个是空集，那么$X_L\ngeq X_R$也是成立的，考虑其逆反命题就能得知这一点）

而**序关系**$x\le y$则定义为：
$$ x\le y \qquad\mathrm{when}\qquad X_L\ngeq y, x\ngeq Y_R \tag{2} $$
（$x\ge y$即是说$y\le x$）

这是一个**递归**的定义，要定义一个数，必须先要有两个数集，而定义数集里的数也需要数······不过这并不是无止境的，因为我们可以拿**空集**来定义数：
$$ 0 = (\emptyset,\emptyset) $$
这里的0只是个记号，不过我们在后面就会看到它的确有0的性质（加法零元）。

书中似乎用了点上帝创世的比喻，我们称0是“**第一天**”创造出来的。有了0之后的第二天，我们便可以将它塞到左集和右集，创造下面两个数：
$$ -1=(\emptyset,\{0\}),\qquad 1=(\{0\},\emptyset) $$
于是我们可以一天天的创造数。这个“创造日”的概念将会在下面被广泛应用到证明中。

*（用形式一点的说法，数$x$的创造日可以递归地定义为  
$d(x)=\max(X_L,X_R)+1$，且$d(0)=1$。这是为了说明创造日是一个有良好定义的概念）*

### $\le$的传递性
下面证明$\le$的**传递性**：
$$ x\le y, y\le z\ \Rightarrow\ x\le z \tag{T1} $$
对$(x,y,z)$的创造日之和归纳，即假设(T1)对创造日之和小于$d(x)+d(y)+d(z)$的一组数都成立。

若$x\nleq z$，有两种可能：
- $X_L$中存在某些$x_L\ge z$，结合$y\le z$由归纳假设有$y\le x_L$，这与$x\le y$矛盾。
- $Z_R$中存在某些$z_R\le x$，结合$x\le y$由归纳假设有$z_R\le y$，这与$y\le z$矛盾。

从而$x\le z$，即(T1)得证。

### $\le$的完全性和自反性
下面证明$\le$的**自反性**，即对任意$x$，
$$ x\le x \tag{T3} $$
各定理的顺序和原书不一定相同，不过为了尊重原书（以及方便），序号还是和原书保持一致。

(T3)容易由对创造日的归纳法给出，$x\le x$即是说$X_L\ngeq x$且$x\ngeq X_R$。而$x_L\ge x$蕴含$X_L\ngeq x_L$，其中必然有$x_L\ngeq x_L$，这和归纳假设矛盾。从而$X_L\ngeq x$成立，$x\ngeq X_R$也可以用相同方法证明。

从而可以证明下面的引理：
$$ X_L\le x,x\le X_R \tag{T2} $$
仍然使用归纳法，$x_L\nleq x$即是说存在一个$x_{LL}\ge x$或$x_L\ge x_R$。后者违反了规则(1)（数的定义）。而前者由归纳假设$x_{LL}\le x_L$和传递律有$x\le x_{LL}\le x_L$，则$X_L\ngeq x_L$，这和(T3)矛盾。

$y\nleq x$即是存在$x_L\ge y$或$x\ge y_R$。由(T2)，这即是说$y\le x_L\le x$或$y\le y_R\le x$。这即是$\le$的**完全性**：
$$ x\nleq y \Rightarrow y\le x \tag{T4} $$

从而我们可以把$x\ngeq y$定义为$x<y$。显然$x<y$蕴含了$x\le y$，于是下面两条传递律也成立：
$$ x<y, y\le z\  \Rightarrow\ x<z \tag{T5} $$
$$ x\le y, y<z\  \Rightarrow\ x\le z \tag{T6} $$

同时$x\le y$的定义也可以改写为：
$$ x\le y \qquad\mathrm{when}\qquad X_L<y, x<Y_R \tag{2'} $$
同时结合(T3)，(T2)可以被改写为
$$ X_L<x<X_R \tag{T2'} $$

我们证明了$\le$满足偏序关系的自反性和传递性，但它并不严格的满足反对称性：可以存在两个数$x,y$，$x\le y,y\le x$，且$x\neq y$。  
当$x\le y,y\le x$时，我们称$x$和$y$“**相似**”：$x\equiv y$。容易验证这是一个等价关系，如果把“$=$”换成“$\equiv$”，我们也可以称$\le$是数集上的全序。

## 加法

### 加法的性质
加法定义为
$$ x+y = ((X_L+y)\cup(Y_L+x),(X_R+y)\cup(Y_R+x)) \tag{3} $$
显然**交换律**成立：
$$ x+y = y+x \tag{T9} $$
有**零元**：
$$ x+0=x \tag{T10} $$
$x+0=(X_L+0,X_R+0)$，从而容易由归纳法证明。

**结合律**：
$$ x+(y+z) = (x+y)+z \tag{T11} $$
用归纳法证明，
$$
\begin{aligned}
    左 = (&((X_L+y)+z)\cup((Y_L+x)+z)\cup(Z_L+(x+y)),
    \\&((X_R+y)+z)\cup((Y_R+x)+z)\cup(Z_R+(x+y)))
\end{aligned}
$$
$$
\begin{aligned}
    右 = (&(X_L+(y+z))\cup((Y_L+z)+x)\cup((Z_L+y)+x),
    \\&(X_R+(y+z))\cup((Y_R+z)+x)\cup((Z_R+y)+x))
\end{aligned}
$$
由归纳假设，这六个集合分别相等。

上面证明的命题都是“$=$”的，即集合的元素也完全相同。我们希望上一节中的相似在加法中也适用，即
$$ x\equiv y\ \Rightarrow \ x+z\equiv y+z \tag{T12} $$
或者，更一般的，
$$ x\le y\ \Rightarrow \ x+z\le y+z \tag{T13} $$
即是要证明$(X_L+z)\cup(Z_L+x)<y+z$，$x+z<(Y_R+z)\cup(Z_R+y)$。然而这里归纳法只能证明$X_L+z\le y+z$。为了排除$x_L+z\equiv y+z$的情况，我们需要(T13)的逆命题也成立：
$$ x+z\le y+z\ \Rightarrow \ x\le y \tag{T14} $$
这里需要证明$x_L<y,x<y_R$。而这里归纳法也只能证明$x_L\le y$，这又会导致对(T13)的依赖。  
一种方法是对$(x,y,z)$的创造日之和做归纳，证明命题“(T13)且(T14)”。不过这会在证明$Z_L+x<y+z$时出现问题：证明$Z_L+x<y+z$需要证明两部分，$Z_L+x\le Z_L+y$和$Z_L+y<z+y$，而后一部分$(z_l,z,y)$的创造日之和不一定小于$(x,y,z)$，于是归纳法失效。

为了解除定理之间的相互依赖，我们使用对称的形式：
$$ \mathrm{V}(x,x',y,y'):\qquad x\le x',y\le y'\ \Rightarrow x+y\le x'+y' $$
$$ \mathrm{VI}(x,x',y,y'):\qquad x+y\ge x'+y',y\le y'\ \Rightarrow x\ge x' $$
要使用归纳法证明$\mathrm{V}(x,x',y,y')$，即  
$$ (X_L+y)\cup(Y_L+x)\ngeq x'+y',x+y \ngeq (X'_R+y)\cup(Y'_R+x) $$
类似之前的讨论，我们需要
$$ \mathrm{VI}(X_L,x',y,y'),\mathrm{VI}(Y_L,y',x,x'),\mathrm{VI}(x,X_R',y,y'),\mathrm{VI}(y,Y_R',x,x') $$
成立。  
而要证明$\mathrm{VI}(x,x',y,y')$，即  
$$ x'_L\ngeq x, x'\ngeq X_R $$
我们需要  
$$ \mathrm{V}(x,X_L',y,y'),\mathrm{V}(X_R,x',y,y')$$
成立。  
注意这时$\mathrm{V}(x,x',y,y')$和$\mathrm{VI}(x,x',y,y')$所依赖的都是创造日之和小于$(x,x',y,y')$的命题。从而这时用归纳法证明“$\mathrm{V}(x,x',y,y')$且$\mathrm{VI}(x,x',y,y')$”是没有问题的。

在最后，我们要证明的是一个相当基础~~（过于基础以至于被忘记需要证明）~~的命题——$x+y$是数。

（需要说明的是，一些定理的证明过程没有依赖规则(1)，从而它们对不满足数的规则的“伪数”也成立，如(T1)(T3)，而本节的(T9)-(T14)和V、VI有些依赖$x$和$y$是数，但没有依赖$x+y$是数。因此在证明过程中使用它们不会构成循环论证。）

这一命题可以不用归纳法直接证明，$x+y$是数即是说
$$ (X_L+y)\cup(Y_L+x)\ngeq(X_R+y)\cup(Y_R+x) $$
可以拆成四个命题，并可以通过套用$\mathrm{VI}(X_L,X_R,y,y)$，$\mathrm{VI}(X_L,x,y,Y_R)$，$\mathrm{VI}(Y_L,y,x,X_R)$，$\mathrm{VI}(Y_L,Y_R,x,x)$直接证明。

### 减法
**加法逆元**定义为：
$$ -x = (-X_R, -X_L) \tag{4} $$
显然有
$$ x=-(-x) \tag{T16} $$
我们先不证明$-x$是数，注意后面的定理中也不会用到这一条件。

**减法**即定义为和逆元的加法：
$$ x-y = x+(-y) \tag{5} $$
下面证明
$$ x-x\equiv 0 \tag{T15} $$
这即是证明
$$ ((X_L+(-x))\cup((-X_R)+x),(X_R+(-x))\cup((-X_L)+x)) \equiv 0 $$
即$x_L+(-x)\ngeq 0,(-x_R)+x\ngeq 0,x_R+(-x)\nleq0,-x_L+x\nleq0$。  
利用归纳法证明，若$x_L+(-x)\ge 0$，则$(-X)_R+x_L=-X_L+x_L>0$。这与归纳假设$x_L-x_L\equiv0$矛盾，从而$x_L+(-x)<0$成立。类似的方法也可以证明另三个条件。

*（(T15)说明减法并不是严格的加法的逆运算——因为这里是“$=$”而不是“$\equiv$”，只有在相似的意义上考虑它们才是逆运算，这也在后面的(T17)中体现。不过从下一节开始我们将只会考虑“$\equiv$”。）*

下面的定理可以由我们已经得到的定理来推出，而不必还原到基本定义了：
$$ (x+y)-y \equiv x \tag{T17} $$
证明：$(x+y)-y = x+(y-y) \equiv x+0 = x$。
$$ -(x+y) = (-x) + (-y) \tag{T18} $$
证明：$-(x+y) = 0-(x+y) = (x-x)+(y-y)-(x+y) = -x-y$
$$ x\le y\ \Rightarrow \ -y\le -x \tag{T19} $$
证明：$x\le y\Rightarrow x-y-x\le y-y-x \Rightarrow -y\le -x$  
有了(T19)，$-x$是数就是显然的了。

## 实数

### 数的构造规律
现在我们来考虑实数是如何构造出来的。我们看到无论是序关系还是加减法运算下，相似的数之间并无什么差别，于是在考虑数如何被构造出来的时候我们也只考虑一组相似的数之中的一个。因此我们需要判断两数相似的判据，比如下面的定理：
$$
\begin{aligned}
    \mathrm{if}\qquad &Y_L < x < Y_R
    \\ \mathrm{then}\qquad &x\equiv (X_L\cup Y_L, X_R\cup Y_R)
\end{aligned}
\tag{T7}
$$

（这是符合直觉的，由于数集上有线性序，可以认为数$x$在$X_L$和$X_R$的中间，而在$x$的两边增加一些元素也不会影响$x$的位置）

令$z=(X_L\cup Y_L, X_R\cup Y_R)$。由(T2')显然有$Z_L=X_L\cup Y_L< x$，$z<z_R\Rightarrow z<X_R$，即$z\le x$。$z\ge x$也易证。从而$x\equiv z$。

进一步的，我们有一个大胆的猜测：若在第$n$日时彼此不相似的数为
$$ x_1 < x_2 < \cdots < x_m $$
则第$n+1$日创造出的新数只有：
$$ \left(\emptyset,\left\{x_{1}\right\}\right),\left(\left\{x_{1}\right\},\left\{x_{2}\right\}\right), \ldots,\left(\left\{x_{m-1}\right\},\left\{x_{m}\right\}\right),\left(\left\{x_{m}\right\}, \emptyset\right) $$

要证明这一猜想，由(T7)，只需要考察$x_1\cdots x_m$中两个数构造出的数$(\left\{x_{i-1}\right\},\left\{x_{j+1}\right\})$，证明其相似于上面的某一数。

为此，我们可以证明下面这个更一般性的定理：
$$
\begin{aligned}
    \quad &若x是满足Y_L<x<Y_R的首个创造出来的数，
    \\ &则x\equiv y。
\end{aligned}
\tag{T8}
$$
由于$x_L$和$x_R$比$x$更早创造，从而$Y_L<x_L<Y_R$和$Y_L<x_R<Y_R$不成立，且$x_L<x<x_R$，从而存在$y_L,y_R$，使$x_L<y_L<y<y_R<x_R$。故$x$满足(T7)的条件，从而$x\equiv y$。 

从而$(\left\{x_{i-1}\right\},\left\{x_{j+1}\right\})$相似于$x_i\cdots x_j$中最先被创造的数，不是一个新数。

### 有限天内可以创造的数
我们有第一天构造的数
$$ 0=(\emptyset,\emptyset) $$
以及第二天
$$ -1=(\emptyset,\{0\}),\qquad 1=(\{0\},\emptyset) $$
（容易验证$-1$是$1$的加法逆元，我们采用的记号是没问题的）

那么第三天创造的数就有：
$$ (\emptyset,\{-1\}),(\{-1\},\{0\}),(\{0\},\{1\}),(\{1\},\emptyset) $$
试着做一下加法：
$$ 1+1=(\{0+1\},\emptyset)=(\{1\},\emptyset) $$
我们把$1+1$定义为$2$，即$2\equiv (\{1\},\emptyset)$。  
而对$b=(\{0\},\{1\})$，
$$ b+b=(\{0+b\},\{1+b\})=(\{b\},\{1+b\}) $$
由于$0<b<1$，$1$就是$b$和$1+b$之间最早创造出来的数，由(T8)，$b+b\equiv 1$，从而可以称$b\equiv\frac{1}{2}$。
![](number-creation.png)

我们看到数的构造似乎有这样的规律，对在第$n$天已经创造出来的数中相邻的两个数$x_i,x_{i+1}$，由它们创造的数$y=(\{x_i\},\{x_{i+1}\})$满足$y+y=x_i+x_{i+1}$。因此我们假设在第$n$天所有被创造出来的数为：
$$ 0,\pm\frac{1}{2^{n}},\cdots,\pm 1,\pm\left(1+\frac{1}{2^{n-1}}\right),\cdots,n+1 $$ 
（为了方便，这里我们称$1$和$-1$被创造出来的那天为第$0$天。）  
（即$0-1$之间是$\frac{i}{2^n}$，$1-2$之间是$1+\frac{i}{2^{n-1}}$······当然我们还没定义乘法和乘方，这里的$\frac{k}{2^n}$可以递归地定义为满足$\frac{k}{2^n}+\frac{k}{2^n}=\frac{k}{2^{n-1}}$的数，其唯一性容易验证，而$\frac{k}{2^0}=k$。）

这一假设等价于在第$n$天创造出来的数
$$ n-i+\frac{k}{2^i} \equiv \left(\left\{n-i+\frac{(k-1)/2}{2^{i-1}}\right\}, \left\{n-i+\frac{(k+1)/2}{2^{i-1}}\right\}\right) $$
（$k$是奇数，否则会更早被创造出来）

用归纳法证明这一假设，分两步进行。首先考虑
$$ 1+x = ((1+X_L)\cup\{x\}, 1+X_R) $$
根据归纳假设，对已经得到的所有数$x$其左集中都可以找到$x_L$使$1+x_L\ge x$，从而上式可以化简为
$$ 1+x = (1+X_L, 1+X_R) $$
于是$n+1$日创造的所有大于1的数就是第$n$日的所有数加1，即这一假设大于1的部分得到证明。

第二步我们考虑$0-1$内相邻的两数$\frac{k}{2^n}$和$\frac{k+1}{2^n}$，由它们构造的新数$y=(\{\frac{k}{2^n}\},\{\frac{k+1}{2^n}\})$，有
$$ y+y = \left(\left\{ \frac{k}{2^n}+y \right\}, \left\{ \frac{k+1}{2^n}+y \right\}\right) $$
从而
$$ (y+y)_L< \frac{2k+1}{2^n} < (y+y)_R $$
若$2k+1\le 2^n$，则由归纳假设$\frac{2k+1}{2^n}$在第$n$日已被创造出来，且是唯一满足上式的数；若$2k+1>2^n$，则前面一段已经证明了它会在第$n+1$日创造出来，且也是唯一满足上式的数。从而由(T8)，
$$ y+y \equiv \frac{2k+1}{2^n} $$
即
$$ y\equiv \frac{2k+1}{2^{n+1}} $$
我们的假设在$0-1$的部分也得到证明。

### $\aleph$天创造的数
我们已经得到有限日内所能创造的数的规律，它们所代表的实数似乎都可以表示成整数除以$2^n$。或者说，它们用二进制表达都是有限位的。而形如
$$ \frac{1}{3}=0.010101\dots $$
的数不能在有限天内构造出来。从定义来看这也是必然的，我们无法通过有限次迭代创造所有实数。

不过我们可以考虑无限集合，让左集从小的方向逼近
$$ X_L=\{0.01,0.0101,\cdots\} $$
而右集从大的方向逼近$\frac{1}{3}$
$$ X_L=\{1,0.1,0.011,\cdots\} $$
我们就可以将其构造出来：
$$ \frac{1}{3}=(X_L,X_R) $$
于是我们在第$\aleph$天得到了所有实数（因为任何一个实数都可以写成一串二进制数）

还不仅如此，我们可以考虑：
$$ \omega = (\{1,2,3,\cdots\},\emptyset) $$
和
$$ \epsilon = \left(\left\{0\right\}, \left\{1,\frac{1}{2},\frac{1}{2^2},\cdots\right\}\right) $$
$\omega$比任何实数都要大，而$\epsilon$严格大于零，却小于任何实数。我们得到了**无穷大**和**非零的无穷小**！  

考虑$\omega$的一些性质：
- 在$\alef+1$天，我们可以创造出：
  $$ \omega+1 = (\{\omega\},\emptyset) $$
  它比$\omega$还要大。以及
  $$ \omega-1 = (\{1,2,\cdots\},\{\omega\}) $$
  它比任何正实数大，但小于$\omega+1$。
- 在$2\alef$天，我们将得到
  $$ 2\omega = (\{\omega+1,\omega+2,\cdots\},\emptyset) $$
- 在$\alef^2$天，我们将得到
  $$ \omega^2 = (\{\omega,2\omega,\cdots\},\emptyset) $$
- 以及
  $$ \omega^\omega = (\{\omega,\omega^2,\cdots\},\emptyset) $$

只要不停下来，数就会不断延伸
![](dont-stop.png)
<p align="center">
だからよ、止まるんじゃねぞ（指造数）
</p>

### 重新考虑归纳法
我们这里需要重新考虑针对创造日的归纳法，对所有自然数有效的归纳法在无穷及无穷之后的天数不一定有效。

不过我们可以这样考虑归纳法，我们使用归纳法时事实上是在说，若命题对$x$不成立，则存在$x'\in X_L\cup X_R$，命题对$x'$也不成立。这将会形成一个数列，后一个数属于前一个数的左集或右集。对有穷的数，这将会终结于空集；但对无穷的数，这将会形成一个无穷祖先数列。而事实上，对我们的创造每一个数，它都不可能是无穷祖先数列的起始元素，因为它的左集和右集中不存在违反待证命题的元素。

不过这番论证似乎还是在用归纳法证明归纳法，我们似乎需要将其视为某种公理来保证归纳法的合理性，同时也是形式地表达在定义新数$x=(X_L,X_R)$时$X_L$和$X_R$的元素是“已经存在的数”的含义。

（这段完全是复读原书）

![](AB.png)
<p align="center">
（AB天下第一！）
</p>

## 乘法

$x$和$y$的乘法$xy$的左集为所有形如
$$ x_Ly+xy_L-x_Ly_L \qquad 或 \qquad x_Ry+xy_R-x_Ry_R $$
的数，右集为所有形如
$$ x_Ly+xy_R-x_Ly_R \qquad 或 \qquad x_Ry+xy_L-x_Ry_L $$
的数。

显然**交换律**
$$ xy=yx \tag{T20} $$
成立，有**零元**
$$ 0x=x \tag{T21} $$
，**幺元**
$$ 1x=x \tag{T22} $$
且
$$ -(xy)=(-x)y \tag{T23} $$

运用我们之前在证明(T13)和(T14)时的归纳法，我们还应该可以证明
$$ x(y+z) \equiv xy+xz \tag{T25} $$
$$ x(yz) \equiv (xy)z \tag{T26} $$
$$ x>x',y>y' \Rightarrow (x-x')(y-y')>0 \tag{T26} $$

同时我们有几个有趣的结果：
$$ \epsilon\omega = 1 $$
$$ \frac{1}{2}\omega = \left(\left\{1,2,3,\cdots\right\}, \left\{\omega-1,\omega-2,\omega-3,\cdots\right\} \right) $$
$$ \sqrt{\omega} = \left(\left\{1,2,3,\cdots\right\}, \left\{\frac{\omega}{1},\frac{\omega}{2},\frac{\omega}{3},\cdots\right\} \right) $$
$$ \sqrt{\epsilon} = \left(\left\{\epsilon,2\epsilon,3\epsilon,\cdots\right\}, \left\{\frac{1}{1},\frac{1}{2},\frac{1}{3},\cdots\right\} \right) $$

> 需要做的事情是无穷的，时间却是有限的······