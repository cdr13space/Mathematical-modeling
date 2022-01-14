function [W, FCI] = CVM(x)
% 计算三种分类的综合评价指标
[~,n]=size(x);
v=zeros(1,n);
W=zeros(1,n);
for i=1:n
    v(i)=std(x(:,i))/mean(x(:,i));
end
for i=1:n
   W(i)=v(i)/sum(v);
end
FCI = x*W';