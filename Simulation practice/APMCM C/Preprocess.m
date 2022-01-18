file = xlsread("C:\Git Code\Mathematical-modeling\Simulation practice\APMCM C\Initial Data\2021亚太杯数据1.xlsx");
result = fillmissing(file,'linear') ;
csvwrite("C:\Git Code\Mathematical-modeling\Simulation practice\APMCM C\Preprocess Data\问题1-1.xlsx",result);