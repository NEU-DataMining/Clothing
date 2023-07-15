function dis=GistDistance(I1,I2)
M1=load(strcat('E:\taobao\sleeve-left\gist\normalization\',I1,'.txt'));
M2=load(strcat('E:\taobao\sleeve-left\gist\normalization\',I2,'.txt'));
M1=M1';
M2=M2';
dis=pdist2(M1,M2);
%m=['E:\taobao\sleeve-left\distance\gist\',I1,'most.txt'];
m=['E:\test\gist\',I1,'most.txt'];
dlmwrite(m,I2,'-append','delimiter', '');%Õº∆¨ID
dlmwrite(m,dis,'-append');%æ‡¿Î