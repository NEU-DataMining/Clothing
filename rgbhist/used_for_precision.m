files=dir('E:\taobao\upper body part\colorhist\distance125\color_sort_all\*.mat');%��������ź������ɫƥ����
s=0.0;
for i=1:length(files)
    file_name=files(i).name;
    I=file_name;
    I(end-3:end)=[];
    A=load(['E:\taobao\upper body part\colorhist\distance125\color_sort_all\',file_name]);%���ļ�������
    f=['E:\taobao\upper body part\colorhist\distance125\color_sort_all\',I,'.mat'];
    load (f);
    I(end-0:end)=[];
    I=[I,'7'];
    pic=['E:\taobao\upper body part\',I,'.jpg'];
    set (gcf,'Position',[100,300,1500,500], 'color','w')%�޸Ĵ��ڵ�λ�úʹ�С
    subplot(1,6,1);%��ʾ��1��6�еĵ�һ��λ�û�ͼ
    title('����ͼ��');
    imshow(pic)
    hold on
    
    for i=2:6%�ӵڶ�����ʼ
    subplot(1,6,i);%��ʾ��1��6�еĵ�i��λ�û�ͼ
    file=B(i,1);%ȡÿ�е�һ��Ԫ�ص�ֵ
    file=num2str(file);%����ת��Ϊ�ַ�
    file(end-0:end)=[];
    file=[file,'7'];
    file=['E:\taobao\upper body part\',file,'.jpg'];
    imshow(file)
   
   % pause
    end
     %���������
    prompt={'�������ѯͼ��ƥ��ĸ�����'};%������ʾ�ַ���                
    name='Enter match Number';%���ñ���
    numlines=1;%ָ���������ݵ�����                
    defAns={'5'};%�趨Ĭ��ֵ                
    Resize='on';%�趨�Ի���ߴ�ɵ���                
    answer=inputdlg(prompt,name,numlines,defAns,'on')%��������Ի���       
    num=answer(1); 
    a=str2num(num{1});
    a=a/5;
    s=s+a;
    
end
s=s/3546