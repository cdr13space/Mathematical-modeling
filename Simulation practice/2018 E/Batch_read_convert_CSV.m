xdir = dir(fullfile("E:\Git Code\Mathematical-modeling\Simulation practice\2018 E\Preprocess Data\Break up",'*.csv'))
for k = 1:20
    file = xlsread([xdir(k).folder,'\',xdir(k).name])
    % pchip 分段三次 Hermite 插值多项式
    result = fillmissing(file,'pchip')  
    % spline 三次方样条数据插值
    % result = fillmissing(file,'spline')
    csvwrite(['E:\Git Code\Mathematical-modeling\Simulation practice\2018 E\Preprocess Data\interpolation process\',xdir(k).name],result)
end
