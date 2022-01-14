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
w1_matrix = [1:3];
w2_matrix = [1:4];
w3_matrix = [1:5];

for k = 1:20
    % 读取数据
    data = xlsread([xdir(k).folder,'\',xdir(k).name]);
    % 取2005-2020年的12个指标数据
    x = data(36:end,4:end);
    % 计算综合指标和权重
    [indicators,w1,w2,w3]= Comprehensive_index(x,ind);
    % 保存权重矩阵
    w1_matrix = [w1_matrix;w1]
    w2_matrix = [w2_matrix;w2]
    w3_matrix = [w3_matrix;w3]
end

w1_mean = mean(w1_matrix(2:end,:))
w2_mean = mean(w2_matrix(2:end,:))
w3_mean = mean(w3_matrix(2:end,:))
