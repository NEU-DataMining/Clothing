files=dir('E:\taobao\sleeve-left\distance\sort_all\*.mat');%保存的是排好序的颜色匹配结果
s=0.0;
for i=1:length(files)
    file_name=files(i).name;
    I=file_name;
    I(end-3:end)=[];
     f=['E:\taobao\sleeve-left\distance\sort_all\',I,'.mat'];
     load (f);
    pic=['E:\taobao\train\',I,'.jpg'];
    set (gcf,'Position',[300,0,1000,1000], 'color','w')%修改窗口的位置和大小
    subplot(1,3,1);%表示在1行6列的第一个位置画图
    title('检索图像');
    imshow(pic)
    hold on
    
    for i=2:3%从第二个开始
    subplot(1,3,i);%表示在1行6列的第i个位置画图
    file=B(i,1);%取每行第一个元素的值
    file=num2str(file);%数字转换为字符
    file=['E:\taobao\train\',file,'.jpg'];
    imshow(file)
    end
     %交互输入框
    prompt={'输入领子与查询图像匹配的个数：'};%设置提示字符串                
    name='Enter match Number';%设置标题
    numlines=1;%指定输入数据的行数                
    defAns={'2'};%设定默认值                
    Resize='on';%设定对话框尺寸可调节                
    answer=inputdlg(prompt,name,numlines,defAns,'on')%创建输入对话框       
    num=answer(1); 
    a=str2num(num{1});
    a=a/2;
    s=s+a;
    
end
s=s/3547