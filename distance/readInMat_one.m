%计算全部的图像之间的距离
files=dir('E:\taobao\collar2\*.jpg');
for i=1:length(files)
    file_name=files(i).name;
    I=file_name;
    I(end-3:end)=[];
    %I='198798211016';%输入的查询图像
    A=load(['E:\taobao\collar\distance\foirier\',I,'most.txt']);%读文件到矩阵
    B=reshape(A,[2 numel(A)/2]);%转换成两行矩阵
    B=B';%转置，转成两列
    B=sortrows(B,2);%按第五列大小排序
    save(['E:\taobao\collar\distance\sort_foirier\',I,'.mat'],'B');%保存排好序的结果
end
