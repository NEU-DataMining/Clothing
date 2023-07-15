files=dir('E:\taobao\collar\*.jpg');
for i=1:length(files)
file=files(i).name;
file(end-4:end)=[];
m=file;
m=[m,'6'];
file=[file,'7.jpg'];
mkdir('E:\taobao\block\',m);%创建子文件夹
disp(file);
file=['E:\taobao\upper body part\',file]
Im=imread(file);
%imshow(Im)
%hold on
L = size(Im);
%I=readimagefunction(file);
height=30;
width=30;
max_row = floor(L(1)/height);%实验图片为300*300，则max_row=10,max_col=10
max_col = floor(L(2)/width);
seg = cell(max_row,max_col);
%分块
for row = 1:max_row      
    for col = 1:max_col        
    seg(row,col)= {Im((row-1)*height+1:row*height,(col-1)*width+1:col*width,:)};   
    end
end 
for i=1:max_row*max_col
   
imwrite(seg{i},strcat('E:\taobao\block\',m,'\',int2str(i),'.jpg'));   %把第i帧的图片写为'mi.jpg'保存
end
%画出分块的边界
for row = 1:max_row      
    for col = 1:max_col  
 rectangle('Position',[30*(col-1),30*(row-1),30,30],...
         'LineWidth',2,'LineStyle','-','EdgeColor','r');
        end
end 
hold off
end