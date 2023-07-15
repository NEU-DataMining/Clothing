%对图像LBP间距离进行降序排序
files=dir('E:\taobao\center1\distance\*.txt');
for i=1:length(files)
    file_name=files(i).name;
    I=file_name;
    I(end-3:end)=[];
    A=load(['E:\taobao\center1\distance\',file_name]);%读文件到矩阵
    B=reshape(A,[2 numel(A)/2]);%转换成两行矩阵
    B=B';%转置，转成两列
    B=sortrows(B,2);%按第2列大小排序
    save(['E:\taobao\center1\lbp_sort\',I,'.mat'],'B');%保存排好序的结果
end