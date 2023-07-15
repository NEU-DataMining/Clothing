function dis=phogDistance(I1,I2)
tic
M1=load(['E:\taobao\sleeve-left\phog\normalization\',I1,'.txt']);
M2=load(['E:\taobao\sleeve-left\phog\normalization\',I2,'.txt']);
M1=M1';
M2=M2';

dis=pdist2(M1,M2);
toc

%m=['E:\taobao\sleeve-left\distance\phog\',I1,'most.txt'];
m=['E:\test\phog\',I1,'most.txt'];
dlmwrite(m,I2,'-append','delimiter', '');%Õº∆¨ID
dlmwrite(m,dis,'-append');%æ‡¿Î