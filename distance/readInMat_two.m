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
    A=load(['E:\taobao\collar\distance\phog\',I,'most.txt']);%���ļ�������
    A=reshape(A,[2 numel(A)/2]);%ת�������о���
    A=A';%ת�ã�ת������
    B=[B,A];%�ϲ���������
    B(:,3) = [];%ȥ������ĳһ��

    %���������ľ������
    for i=1:3547
        B(i,4)=sum(B(i,2:3));
    end
    B=sortrows(B,4);%�������д�С����
    save(['E:\taobao\collar\distance\sort_pg\',I,'.mat'],'B');%�����ź���Ľ��
end
