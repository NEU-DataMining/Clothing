%特征向量归一化
files=dir('E:\taobao\sleeve-left\*.jpg');
for i=1:length(files)
file=files(i).name;
I2=file;
I2(end-3:end)=[];
a=load(['E:\taobao\sleeve-left\foirier\',I2,'.txt']);
for i=1:size(a)
    a(i)=a(i)/1;
    m=['E:\taobao\sleeve-left\foirier\normalization\',I2,'.txt'];
    dlmwrite(m,a(i),'-append');%距离
end
end