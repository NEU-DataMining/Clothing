function dis=FoirierDistance(I1,I2)
M1=load(['E:\taobao\sleeve-left\foirier\normalization\',I1,'.txt']);
M2=load(['E:\taobao\sleeve-left\foirier\normalization\',I2,'.txt']);
M1=M1';
M2=M2';
dis=pdist2(M1,M2);
%m=['E:\taobao\sleeve-left\distance\foirier\',I1,'most.txt'];
m=['E:\test\foirier\',I1,'most.txt'];
dlmwrite(m,I2,'-append','delimiter', '');%Õº∆¨ID
dlmwrite(m,dis,'-append');%æ‡¿Î

