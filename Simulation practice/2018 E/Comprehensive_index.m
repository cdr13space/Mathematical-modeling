function [indicators,w1,w2,w3]= Comprehensive_index(x,ind)
% 计算三种分类的综合评价指标
% 输入变量：
% x：原始数据矩阵, 一行代表一个样本, 每列对应一个指标；
% ind：指示向量，指示各列正向指标还是负向指标，1表示正向指标，2表示负向指标；
% 输出变量：
% ERI：经济衰退指数 economic recession index；
% ESI：生态系统可持续性指数 ecosystem sustainability index；
% SHI：社会可居住性 social habitability index；

% 计算归一化矩阵
[n,m]=size(x); % n个样本, m个指标
for i=1:m
    if ind(i)==1 %正向指标归一化
        Y(:,i)=MinMaxNormalized(x(:,i),1,0.0001,0.9999);   
    else %负向指标归一化
        Y(:,i)=MinMaxNormalized(x(:,i),2,0.0001,0.9999);
    end
end

% 熵权法
[s1,w1]=Entropy_Weight_Method(x(:,1:3),ind(1:3));
[s2,w2]=Entropy_Weight_Method(x(:,4:7),ind(4:7));
[s3,w3]=Entropy_Weight_Method(x(:,8:end),ind(8:end));

% 输出三种指标矩阵
ERI = w1(1)*Y(:,1) + w1(2)*Y(:,2) + w1(3)*Y(:,3)
ESI = w2(1)*Y(:,4) + w2(2)*Y(:,5) + w2(3)*Y(:,6) + w2(4)*Y(:,7)
SHI = w3(1)*Y(:,8) + w3(2)*Y(:,9) + w3(3)*Y(:,10) +w3(4)*Y(:,11) + w3(5)*Y(:,12)
indicators = [ERI,ESI,SHI]