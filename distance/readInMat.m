%����ȫ����ͼ����������֮����ܾ��벢��������
files=dir('E:\taobao\sleeve-left2\*.jpg');
for i=1:length(files)
    file_name=files(i).name;
    I=file_name;
    I(end-3:end)=[];
    %I='198798211016';%����Ĳ�ѯͼ��
    A=load(['E:\taobao\sleeve-left\distance\foirier\',I,'most.txt']);%���ļ�������
    B=reshape(A,[2 numel(A)/2]);%ת�������о���
    B=B';%ת�ã�ת������
    A=load(['E:\taobao\sleeve-left\distance\phog\',I,'most.txt']);%���ļ�������
    A=reshape(A,[2 numel(A)/2]);%ת�������о���
    A=A';%ת�ã�ת������
    B=[B,A];%�ϲ���������
    A=load(['E:\taobao\sleeve-left\distance\gist\',I,'most.txt']);%���ļ�������
    A=reshape(A,[2 numel(A)/2]);%ת�������о���
    A=A';%ת�ã�ת������
    B=[B,A];
    B(:,3) = [];%ȥ������ĳһ��
    B(:,4) = [];

    %���������ľ������
    for i=1:3546
        B(i,5)=sum(B(i,2:4));
    end
    B=sortrows(B,5);%�������д�С����
    save(['E:\taobao\sleeve-left\distance\sort_all\',I,'.mat'],'B');%�����ź���Ľ��
end
