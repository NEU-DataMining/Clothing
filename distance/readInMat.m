%计算全部的图像三种特征之间的总距离并降序排序
files=dir('E:\taobao\sleeve-left2\*.jpg');
for i=1:length(files)
    file_name=files(i).name;
    I=file_name;
    I(end-3:end)=[];
    %I='198798211016';%输入的查询图像
    A=load(['E:\taobao\sleeve-left\distance\foirier\',I,'most.txt']);%读文件到矩阵
    B=reshape(A,[2 numel(A)/2]);%转换成两行矩阵
    B=B';%转置，转成两列
    A=load(['E:\taobao\sleeve-left\distance\phog\',I,'most.txt']);%读文件到矩阵
    A=reshape(A,[2 numel(A)/2]);%转换成两行矩阵
    A=A';%转置，转成两列
    B=[B,A];%合并两个矩阵
    A=load(['E:\taobao\sleeve-left\distance\gist\',I,'most.txt']);%读文件到矩阵
    A=reshape(A,[2 numel(A)/2]);%转换成两行矩阵
    A=A';%转置，转成两列
    B=[B,A];
    B(:,3) = [];%去掉矩阵某一列
    B(:,4) = [];

    %三种特征的距离求和
    for i=1:3546
        B(i,5)=sum(B(i,2:4));
    end
    B=sortrows(B,5);%按第五列大小排序
    save(['E:\taobao\sleeve-left\distance\sort_all\',I,'.mat'],'B');%保存排好序的结果
end
