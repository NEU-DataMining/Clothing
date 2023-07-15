%计算每幅图像125维颜色直方图与各个直方图的距离
files1=dir('E:\taobao\upper\colorhist\*.mat');
 for i=1:length(files1)
    file1=files1(i).name;
    M1=load(['E:\taobao\upper\colorhist\',file1]);
    file1(end-3:end)=[];
    M1.h=M1.h';
    files2=dir('E:\taobao\upper body part\colorhist\*.mat');
    for j=1:length(files2)
        file2=files2(j).name;
        M2=load(['E:\taobao\upper body part\colorhist\',file2]);
        M2.h=M2.h';
        dis=pdist2(M1.h,M2.h);
        file2(end-3:end)=[];
        m=['E:\taobao\upper\colorhist\distance125\',file1,'.txt'];
        dlmwrite(m,file2,'-append','delimiter', '');%图片ID
        dlmwrite(m,dis,'-append');%距离
    end
end