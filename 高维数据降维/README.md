# 切片逆回归

## 简介

切片逆回归(Slice Inverse Regression, SIR)是Li(1991)[^1]提出的一种经典的充分降维方法。SIR探究了多维变量$x$对单变量$y$的回归而不是一维变量$y$对多维变量$x$的回归。在对多维解释变量$x$的降维过程中充分利用了$y$的信息。

## 一般模型

1. 一般模型：$y=f(\beta^{T}_{1}x,\dots,\beta_{K}^{T}x,\varepsilon)$
   - $\varepsilon$是一个独立于$x$的随机变量，$f$为一个未知的连接函数；
   - $y$关于$x$的条件分布可以由$x$的$K$个线性组合$\beta^{T}_{1}x,\dots,\beta_{K}^{T}x$得到，并不会损失$x$中包含的原始信息；
   - 等价于在给定$x$的$K$个线性组合时，响应变量$y$与解释变量$x$是独立的。当$K$远小于$x$的维度$p$时，便达到降维目的;

2. 基本定理：
   - 逆回归曲线$E(X|Y)-E(X)$被包含在$\Sigma_{x}\beta_{i},i=1\,\dots,k$张成的线性空间中；
   - 在线性条件下，满足$\Sigma_{\eta}b_{i}=\lambda_{i}\Sigma_{x}b_{i}$的非零相对特征$\lambda_{i}$不超过$k$个，其对应的相对特征向量$b_{i}$被包含在$\beta_{i},i=1,\dots,k$张成的线性空间中；

## 具体步骤

1. 切片逆回归对数据$(Y_{i},X_{i}),(i=1,\dots,n)$进行操作;

2. 通过仿射变换标准化$X_{i}$得到$\widetilde{X_{i}}=\widehat{\Sigma}_{xx}^{-1/2}(X_{i}-\overline{X}),i=1,\dots,n$ ，其中$\widehat{\Sigma}_{xx}$和$\overline{X}$分别是 $X$ 的样本协方差矩阵和样本均值;

3. 将$Y$的取值$Y_{i}$从小到大进行排序，并切为$H$片，记为$I_{1},I_{2},\dots,I_{h}$。其中$I_{h}$包含$Y_{i}$的概率为$P_{h}$：
   $$
   P_{h}=\frac{1}{n}\sum_{i=1}^{n}\delta_{h}(Y_{i})
   $$

   $$
   \delta_{h}\left(Y_{i}\right)=\left\{\begin{array}{l}
   0, \text { if } Y_{i} \text { inside the } \mathrm{h} \\
   1, \text { if } Y_{i} \text { outside the } \mathrm{h}
   \end{array}\right.
   $$

4. 对于每一个切片，计算其$x_{i}$的样本均值$m_{h}$，即$m_{h}=\frac{1}{nP_{h}}\sum_{y\in{I{_h}}}\widetilde{X_{i}}$;

5. 对数据$m_{h}$进行（加权）主成分分析，加权的协方差矩阵为$V=\sum_{h=1}^{H}p_{h}m_{h}m_{h}^{'}$，并找出V的特征值和特征向量。

6. 令$k$个最大的特征向量为$\eta_{k},(k=1,2,\dots,k)$，可得$\beta_{k}=\eta_{k}\Sigma_{xx}^{-\frac{1}{2}},k=1,2,\dots,k$



[^1]: Li, Ker-Chau. “Sliced Inverse Regression for Dimension Reduction: Rejoinder.” *Journal of the American Statistical Association*, vol. 86, no. 414, 1991, pp. 337–42. *JSTOR*, https://doi.org/10.2307/2290568. Accessed 17 Jul. 2022.

