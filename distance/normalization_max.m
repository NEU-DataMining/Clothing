%��ȡÿĳ���������������ֵ
files=dir('E:\taobao\sleeve-left\*.jpg');
for i=1:length(files)
file=files(i).name;
I2=file;
I2(end-3:end)=[];
a=load(['E:\taobao\sleeve-left\foirier\',I2,'.txt']);
ma=max(a);
m='E:\taobao\sleeve-left\distance\foirier\normalization_max.txt';
dlmwrite(m,ma,'-append');%����
end
a=load('E:\taobao\sleeve-left\distance\foirier\normalization_max.txt');
%ma=max(a);%�����ֵ
ma=mode(a);%������