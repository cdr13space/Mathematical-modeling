xdir= dir(fullfile("Data\initial Data",'*.csv'))
for k = 1:20
    file = xlsread([xdir(k).folder,'\',xdir(k).name])
    % pchip 分段三次 Hermite 插值多项式
    % result = fillmissing(file,'pchip')  
    % spline 三次方样条数据插值
    result = fillmissing(file,'spline')
    csvwrite(['Data\Preprocess Data\',xdir(k).name],result)
end
