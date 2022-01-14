xdir= dir(fullfile("Data\initial Data",'*.csv'))
for k = 1:20
    file = xlsread([xdir(k).folder,'\',xdir(k).name])
    result = fillmissing(file,'pchip')
    csvwrite(['Data\Preprocess Data\',xdir(k).name],result)
end
