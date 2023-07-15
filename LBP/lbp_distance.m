%lbp distance
files1=dir('E:\taobao\center1\lbp\*.mat');
 for i=1:length(files1)
    file1=files1(i).name;
    M1=load(['E:\taobao\center1\lbp\',file1]);
    file1(end-3:end)=[];
    files2=dir('E:\taobao\center\lbp\*.mat');
    for j=1:length(files2)
        file2=files2(j).name;
        M2=load(['E:\taobao\center\lbp\',file2]);
        dis=pdist2(M1.histLBP13,M2.histLBP13);
        file2(end-3:end)=[];
        m=['E:\taobao\center1\distance\',file1,'.txt'];
        dlmwrite(m,file2,'-append','delimiter', '');%Õº∆¨ID
        dlmwrite(m,dis,'-append');%æ‡¿Î
    end
end