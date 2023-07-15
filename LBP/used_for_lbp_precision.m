files=dir('E:\taobao\center\lbp_sort\*.mat');%保存的是排好序的颜色匹配结果
s=0.0;
for i=1:length(files)
    file_name=files(i).name;
    I=file_name;
    I(end-3:end)=[];
    A=load(['E:\taobao\center\lbp_sort\',file_name]);%读文件到矩阵
    f=['E:\taobao\center\lbp_sort\',I,'.mat'];
    load (f);
    pic=['E:\taobao\center\',I,'.jpg'];
    set (gcf,'Position',[100,300,1500,500], 'color','w')%修改窗口的位置和大小
    subplot(1,6,1);%表示在1行6列的第一个位置画图
    title('检索图像');
    imshow(pic)
    hold on
    
    for i=2:6%从第二个开始
    subplot(1,6,i);%表示在1行6列的第i个位置画图
    file=B(i,1);%取每行第一个元素的值
    file=num2str(file);%数字转换为字符
    file=['E:\taobao\center\',file,'.jpg'];
    imshow(file)
   
   % pause
    end
     %交互输入框
    prompt={'输入与查询图像匹配的个数：'};%设置提示字符串                
    name='Enter match Number';%设置标题
    numlines=1;%指定输入数据的行数                
    defAns={'5'};%设定默认值                
    Resize='on';%设定对话框尺寸可调节                
    answer=inputdlg(prompt,name,numlines,defAns,'on')%创建输入对话框       
    num=answer(1); 
    a=str2num(num{1});
    a=a/5;
    s=s+a;
    
end
s=s/3546