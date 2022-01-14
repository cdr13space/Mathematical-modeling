% 定义归一化正负向指标
% 社会指标
a = [2,2,2];
% 经济指标
b = [1,1,1,1];
% 生态指标
c = [1,2,2,1,2];
% 总归一化指标
ind = [a,b,c];

xdir= dir(fullfile("E:\Git Code\Mathematical-modeling\Simulation practice\2018 E\Preprocess Data\interpolation process",'*.csv'));
w1_matrix = (1:3);
w2_matrix = (1:4);
w3_matrix = (1:5);

for k = 1:20
    % 读取数据
    data = xlsread([xdir(k).folder,'\',xdir(k).name]);
    % 取2005-2020年的12个指标数据
    x = data(36:end,4:end);
    % 计算综合指标和权重
    [indicators,w1,w2,w3]= Comprehensive_index(x,ind);
    % 保存权重矩阵
    w1_matrix = [w1_matrix;w1];
    w2_matrix = [w2_matrix;w2];
    w3_matrix = [w3_matrix;w3];
end

w1_mean = mean(w1_matrix(2:end,:));
w2_mean = mean(w2_matrix(2:end,:));
w3_mean = mean(w3_matrix(2:end,:));



ERI = [];
ESI = [];
SHI = [];
for k = 1:20
    % 读取数据
    data = xlsread([xdir(k).folder,'\',xdir(k).name]);
    % 取2005-2020年的12个指标数据
    Y = data(36:end,4:end);
    % 计算综合指标和权重
    y1 = w1_mean(1)*Y(:,1) + w1_mean(2)*Y(:,2) + w1_mean(3)*Y(:,3);
    y2 = w2_mean(1)*Y(:,4) + w2_mean(2)*Y(:,5) + w2_mean(3)*Y(:,6) + w2_mean(4)*Y(:,7);
    y3 = w3_mean(1)*Y(:,8) + w3_mean(2)*Y(:,9) + w3_mean(3)*Y(:,10) +w3_mean(4)*Y(:,11) + w3_mean(5)*Y(:,12);
    % 保存权重矩阵
    ERI = [ERI,y1];
    ESI = [ESI,y2];
    SHI = [SHI,y3];
end

ERI_mean = transpose(mean(ERI));
ESI_mean = transpose(mean(ESI));
SHI_mean = transpose(mean(SHI));
indicator_mean = [ERI_mean,ESI_mean,SHI_mean];