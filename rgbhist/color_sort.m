%��ͼ����ɫ�������н�������
files=dir('E:\taobao\upper\colorhist\distance125\*.txt');
for i=1:length(files)
    file_name=files(i).name;
    I=file_name;
    I(end-3:end)=[];
    A=load(['E:\taobao\upper\colorhist\distance125\',file_name]);%���ļ�������
    B=reshape(A,[2 numel(A)/2]);%ת�������о���
    B=B';%ת�ã�ת������
    B=sortrows(B,2);%�������д�С����
    save(['E:\taobao\upper\colorhist\distance125\color_sort_all\',I,'.mat'],'B');%�����ź���Ľ��
end