function [W, FCI] = CVM( x , ind )
[ERI,ESI,SHI]= CEI(x,ind)
X = [ERI',ESI',SHI']
[m,n]=size(X);
v=zeros(1,n);
W=zeros(1,n);
for i=1:n
    v(i)=std(X(:,i))/mean(X(:,i));
end
for i=1:n
   W(i)=v(i)/sum(v);
end
FCI = X*W'