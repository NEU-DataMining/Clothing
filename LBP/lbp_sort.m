%��ͼ��LBP�������н�������
files=dir('E:\taobao\center1\distance\*.txt');
for i=1:length(files)
    file_name=files(i).name;
    I=file_name;
    I(end-3:end)=[];
    A=load(['E:\taobao\center1\distance\',file_name]);%���ļ�������
    B=reshape(A,[2 numel(A)/2]);%ת�������о���
    B=B';%ת�ã�ת������
    B=sortrows(B,2);%����2�д�С����
    save(['E:\taobao\center1\lbp_sort\',I,'.mat'],'B');%�����ź���Ľ��
end