- GitHub Flavored Markdown不支持Latex渲染，请下载后使用VScode或Obsidian等软件配套食用
- 参考来源：[知乎：熵权法确定权重](https://zhuanlan.zhihu.com/p/28067337)

# 基本原理

- 在信息论中，**熵是对不确定性的一种度量**。
- 不确定性越大，熵就越大，包含的信息量越大；不确定性越小，熵就越小，包含的信息量就越小。
- 根据熵的特性，可以通过计算熵值来判断一个事件的随机性及无序程度，也可以用熵值来判断某个指标的离散程度，指标的离散程度越大，该指标对综合评价的影响（权重）越大。比如样本数据在某指标下取值都相等，则该指标对总体评价的影响为0，权值为0.
- 熵权法是一种客观赋权法，因为它仅依赖于数据本身的离散性。

# 熵值法步骤

1. 对<img alt="$n$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align="middle" width="9.86687624999999pt" height="14.15524440000002pt"/>个样本，<img alt="$m$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/0e51a2dede42189d77627c4d742822c3.svg" align="middle" width="14.433101099999991pt" height="14.15524440000002pt"/>个指标，则<img alt="$x_{ij}$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/64f56542d8c96b6573f52b8e6135215f.svg" align="middle" width="20.15039564999999pt" height="14.15524440000002pt"/>为第<img alt="$i$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/77a3b857d53fb44e33b53e4c8b68351a.svg" align="middle" width="5.663225699999989pt" height="21.68300969999999pt"/>个样本的第<img alt="$j$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/36b5afebdba34564d884d347484ac0c7.svg" align="middle" width="7.710416999999989pt" height="21.68300969999999pt"/>个指标的数值<img alt="$(i=1,\cdots, n; j=1,\cdots,m)$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/4d7886af12c361389d1d1c4b301c2b34.svg" align="middle" width="196.57676775pt" height="24.65753399999998pt"/>
2. 指标的归一化处理：异质指标同质化
    - 由于各项指标的**计量单位并不统一**，因此在用它们计算综合指标前，先要进行标准化处理，即把指标的绝对值转化为相对值，从而解决各项不同质指标值的同质化问题。
    - 另外，**正向指标和负向指标数值代表的含义不同**（正向指标数值越高越好，负向指标数值越低越好），因此，对于正向负向指标需要采用不同的算法进行数据标准化处理：
    - 为了方便起见，归一化后的数据$x_{ij}^{'}$仍记为$x_{ij}$。
<p align="center"><img alt="$$&#10;\begin{array}{l}&#10;x_{i j}^{\prime}=\frac{x_{i j}-\min \left\{x_{1 j}, \ldots, x_{n j}\right\}}{\max \left\{x_{1 j}, \ldots, x_{r j}\right\}-\min \left\{x_{1 j}, \ldots, x_{n j}\right\}}&#10;\end{array}&#10;$$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/146624fac19f67a871f43b2fbb17a83b.svg" align="middle" width="245.7691698pt" height="25.878595049999998pt"/></p>
<p align="center"><img alt="$$&#10;\begin{array}{l}x_{i j}^{\prime}=\frac{\max \left\{x_{1 j}, \ldots, x_{n j}\right\}-x_{i j}}{\max \left\{x_{1 j}, \ldots, x_{n j}\right\}-\min \left\{x_{1 j}, \ldots, x_{n j}\right\}}&#10;\end{array}&#10;$$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/0887dc64f3523ce028d690082907d9cb.svg" align="middle" width="247.20564495pt" height="25.878595049999998pt"/></p>

3. 计算第<img alt="$j$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/36b5afebdba34564d884d347484ac0c7.svg" align="middle" width="7.710416999999989pt" height="21.68300969999999pt"/>项指标下第<img alt="$i$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/77a3b857d53fb44e33b53e4c8b68351a.svg" align="middle" width="5.663225699999989pt" height="21.68300969999999pt"/>个样本值占该指标的比重：
<p align="center"><img alt="$$&#10;\begin{array}{l}p_{i j}=\frac{x_{i j}}{\sum_{i=1}^{n} x_{i j}}, \quad i=1, \cdots, n, j=1, \cdots, m&#10;\end{array}&#10;$$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/8c38bc3f7a4014eab59a57321135fc15.svg" align="middle" width="306.53387655pt" height="22.6594797pt"/></p>

4. 计算第<img alt="$j$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/36b5afebdba34564d884d347484ac0c7.svg" align="middle" width="7.710416999999989pt" height="21.68300969999999pt"/>项指标的熵值：
   - 其中，$k=\frac{1}{ln(n)}>0$ 满足$e{j} \ge 0$;
<p align="center"><img alt="$$&#10;\begin{array}{l}e_{j}=-k \sum_{i=1}^{n} p_{i j} \ln \left(p_{i j}\right), \quad j=1, \cdots, m&#10;\end{array}&#10;$$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/e87251f5056c4e920ebbd563ea593b8a.svg" align="middle" width="292.9990965pt" height="18.150897599999997pt"/></p>

5. 计算信息熵冗余度（差异）：
<p align="center"><img alt="$$&#10;\begin{array}{l}d_{j}=1-e_{j}, \quad j=1, \cdots, m&#10;\end{array}&#10;$$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/8cc184d12eef7cfc531d777494fb3c39.svg" align="middle" width="195.58463594999998pt" height="16.1187015pt"/></p>

6. 计算各项指标的权重：
<p align="center"><img alt="$$&#10;\begin{array}{l}d_{j}=1-e_{j}, \quad j=1, \cdots, mw_{j}=\frac{d_{j}}{\sum_{j=1}^{m} d_{j}}, \quad j=1, \cdots, m&#10;\end{array}&#10;$$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/be3283caea26d7a9b0c1f76c854e8746.svg" align="middle" width="404.6606157pt" height="27.294197699999994pt"/></p>

7. 计算各样本的综合得分：
   - 其中，$x_{ij}$为标准化后的数据。
<p align="center"><img alt="$$&#10;\begin{array}{l}s_{i}=\sum_{j=1}^{m} w_{j} x_{i j}, \quad i=1, \cdots, n&#10;\end{array}&#10;$$" src="https://rawgit.com/ub	git@github.com:xwj770427414/Mathematical-modeling/None/svgs/58ee328820e98af95ac11e6eda8ce5cc.svg" align="middle" width="227.10499514999998pt" height="20.38834215pt"/></p>