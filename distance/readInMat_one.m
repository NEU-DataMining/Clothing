%����ȫ����ͼ��֮��ľ���
files=dir('E:\taobao\collar2\*.jpg');
for i=1:length(files)
    file_name=files(i).name;
    I=file_name;
    I(end-3:end)=[];
    %I='198798211016';%����Ĳ�ѯͼ��
    A=load(['E:\taobao\collar\distance\foirier\',I,'most.txt']);%���ļ�������
    B=reshape(A,[2 numel(A)/2]);%ת�������о���
    B=B';%ת�ã�ת������
    B=sortrows(B,2);%�������д�С����
    save(['E:\taobao\collar\distance\sort_foirier\',I,'.mat'],'B');%�����ź���Ľ��
end
