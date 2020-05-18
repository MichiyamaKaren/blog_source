---
title:      n维正态分布的似然估计
description: 
date:       2019-04-08
author:     y
mathjax:    true
categories:

tags:
    - 数学
---

$n$维向量$\mathbf x=(x_1,\cdots,x_n)$满足正态分布，概率密度函数为：
$$p(\mathbf x) = \frac{1}{(2\pi)^{n/2}|\mathbf C|^{1/2}} \exp\left( -\frac 1 2 \sum_{i,j=1}^n (x_i-m_i)C^{-1}_{ij}(x_j-m_j) \right)$$
均值$\mathbf m$和协方差矩阵$\mathbf C$的定义为：
$$
\mathbf m = E(\mathbf x)
\\ \mathbf C = E\left((\mathbf x-\mathbf m)(\mathbf x-\mathbf m)^T\right)
$$

现有$N$个样本$\mathbf x_1,\cdots,\mathbf x_N$，使用极大似然估计来估计$\mathbf m$和$\mathbf C$。似然函数为：
$$
\begin{aligned}
H(\mathbf m, \mathbf C) &= \sum_{k=1}^N \ln p(\mathbf x_k)
\\&= -\frac 1 2 \sum_{k=1}^N\sum_{i,j=1}^n (x_{ki}-m_i)C^{-1}_{ij}(x_{kj}-m_j) -\frac N 2 \ln |\mathbf C| -\frac{nN}2\ln 2\pi
\end{aligned}
$$
估计的参数应使$H$取极值。

对$\mathbf m$：
$$
\begin{aligned}
\frac{\partial H}{\partial m_l} &= \frac 1 2 \sum_{k=1}^N\sum_{i,j=1}^n C^{-1}_{ij}[\delta_{li}(x_{kj}-m_j)+\delta_{lj}(x_{ki}-m_i)]
\\&= \frac 1 2\sum_{k=1}^N[\sum_{j=1}^n C^{-1}_{lj}(x_{kj}-m_j)+\sum_{i=1}^n C^{-1}_{il}(x_{ki}-m_i)]
\\&= \sum_{k=1}^N\sum_{i=1}^n C^{-1}_{il}(x_{ki}-m_i) = 0
\end{aligned}
$$
最后一步是因为$\mathbf C$是对称矩阵（由定义显然）。从而有：
$$\sum_{i=1}^nC^{-1}_{il}(\sum_{k=1}^N x_{ki} - Nm_i) =0$$
对$l=0,\cdots,n$成立。写成矩阵形式，即为：
$$\mathbf C^{-1} (\sum_{k=1}^N \mathbf x_k - N\mathbf m) =0$$
由于$\mathbf C^{-1}$是可逆矩阵，要使上式成立，应有：
$$\mathbf{\hat m}=\frac 1 N \sum_{k=1}^N \mathbf x_k$$
即为$\mathbf m$的极大似然估计值。

对$\mathbf C$，首先考虑$\mathbf C^{-1}$的行列式$|\mathbf C^{-1}|$对$C^{-1}_{lm}$的偏导数$\frac{\partial |\mathbf C^{-1}|}{\partial C^{-1}_{lm}}$：
将$|\mathbf C^{-1}|$按第$l$行展开，有：
$$|\mathbf C^{-1}|=\sum_{i=1}^n C^{-1}_{li}c_{li}$$
其中$c_{li}$是$C^{-1}_{li}$的代数余子式，同时也是$\mathbf C^{-1}$的伴随矩阵的$l,i$元素。对任意矩阵$\mathbf A$，其伴随矩阵$\mathbf A^* = |\mathbf A| \mathbf A^{-1} $，因此$c_{li} = |\mathbf C^{-1}|(C^{-1})^{-1}_{li} = |\mathbf C^{-1}|C_{li} $。
$l$行的代数余子式不显含$C^{-1}_{lm}$，从而有：
$$\frac{\partial |\mathbf C^{-1}|}{\partial C^{-1}_{lm}} = c_{lm} = |\mathbf C^{-1}|C_{lm}$$
故：
$$
\begin{aligned}
\frac{\partial H}{\partial C^{-1}_{lm}} &= -\frac 1 2 \sum_{k=1}^N (x_{kl}-m_l)(x_{km}-m_m) +\frac N {2|\mathbf C^{-1}|}\frac{\partial |\mathbf C^{-1}|}{\partial C^{-1}_{lm}}
\\&= -\frac 1 2 \sum_{k=1}^N (x_{kl}-m_l)(x_{km}-m_m)  + \frac N 2 C_{lm} =0
\end{aligned}
$$
从而有$C_{lm}$的极大似然估计值：
$$\hat{C}_{lm} = \frac 1 N \sum_{k=1}^N (x_{kl}-\hat m_l)(x_{km}-\hat m_m)$$
写成矩阵形式：
$$ \hat{\mathbf C} = \frac 1 N \sum_{k=1}^N (\mathbf x_k - \hat{\mathbf m})(\mathbf x_k - \hat{\mathbf m})^T $$