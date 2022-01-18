function [s,w]=Entropy_Weight_Method(x,ind)
% 熵权法（EWM）
% 输入变量：
% x：原始数据矩阵, 一行代表一个样本, 每列对应一个指标；
% ind：指示向量，指示各列正向指标还是负向指标，1表示正向指标，2表示负向指标；
% 输出变量：
% s：各行的得分；
% w：各指标权重；
[n,m]=size(x); % n个样本, m个指标
%%数据的归一化处理
for i=1:m
    if ind(i)==1 %正向指标归一化
        Y(:,i)=MinMaxNormalized(x(:,i),1,0.0001,0.9999);   
    else %负向指标归一化
        Y(:,i)=MinMaxNormalized(x(:,i),2,0.0001,0.9999);
    end
end
%比重p(i,j)
for i=1:n
    for j=1:m
        p(i,j)=Y(i,j)/sum(Y(:,j));
    end
end
%第j个指标的熵值e(j)
k=1/log(n);
for j=1:m
    e(j)=-k*sum(p(:,j).*log(p(:,j)));
end
d=ones(1,m)-e; %信息熵冗余度
w=d./sum(d); 
s=100*w*Y'; 