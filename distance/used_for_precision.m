files=dir('E:\taobao\sleeve-left\distance\sort_all\*.mat');%��������ź������ɫƥ����
s=0.0;
for i=1:length(files)
    file_name=files(i).name;
    I=file_name;
    I(end-3:end)=[];
     f=['E:\taobao\sleeve-left\distance\sort_all\',I,'.mat'];
     load (f);
    pic=['E:\taobao\train\',I,'.jpg'];
    set (gcf,'Position',[300,0,1000,1000], 'color','w')%�޸Ĵ��ڵ�λ�úʹ�С
    subplot(1,3,1);%��ʾ��1��6�еĵ�һ��λ�û�ͼ
    title('����ͼ��');
    imshow(pic)
    hold on
    
    for i=2:3%�ӵڶ�����ʼ
    subplot(1,3,i);%��ʾ��1��6�еĵ�i��λ�û�ͼ
    file=B(i,1);%ȡÿ�е�һ��Ԫ�ص�ֵ
    file=num2str(file);%����ת��Ϊ�ַ�
    file=['E:\taobao\train\',file,'.jpg'];
    imshow(file)
    end
     %���������
    prompt={'�����������ѯͼ��ƥ��ĸ�����'};%������ʾ�ַ���                
    name='Enter match Number';%���ñ���
    numlines=1;%ָ���������ݵ�����                
    defAns={'2'};%�趨Ĭ��ֵ                
    Resize='on';%�趨�Ի���ߴ�ɵ���                
    answer=inputdlg(prompt,name,numlines,defAns,'on')%��������Ի���       
    num=answer(1); 
    a=str2num(num{1});
    a=a/2;
    s=s+a;
    
end
s=s/3547