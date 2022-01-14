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

FCI_result = [];
ERI_result = [];
ESI_result = [];
SHI_result = [];
for k = 1:20
    % 读取数据
    data = xlsread([xdir(k).folder,'\',xdir(k).name]);
    % 取2005-2020年的12个指标数据
    x = data(36:end,4:end);
    % 计算综合指标FCI
    [ERI,ESI,SHI,result] = FCI(x,ind);
    % 保存指标矩阵
    FCI_result = [FCI_result,result];
    ERI_result = [ERI_result,ERI];
    ESI_result = [ESI_result,ESI];
    SHI_result = [SHI_result,SHI];
end

FCI_result = FCI_result * 100;
ERI_result = ERI_result * 100;
ESI_result = ESI_result * 100;
SHI_result = SHI_result * 100;

year = transpose(2005:2020)
FCI_result = [year,FCI_result];
ERI_result = [year,ERI_result];
ESI_result = [year,ESI_result];
SHI_result = [year,SHI_result];
csvwrite("E:\Git Code\Mathematical-modeling\Simulation practice\2018 E\Result\FCI.csv",FCI_result);
csvwrite("E:\Git Code\Mathematical-modeling\Simulation practice\2018 E\Result\ERI.csv",ERI_result);
csvwrite("E:\Git Code\Mathematical-modeling\Simulation practice\2018 E\Result\ESI.csv",ESI_result);
csvwrite("E:\Git Code\Mathematical-modeling\Simulation practice\2018 E\Result\SHI.csv",SHI_result);


