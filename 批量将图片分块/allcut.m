files=dir('E:\taobao\collar\*.jpg');
for i=1:length(files)
file=files(i).name;
file(end-4:end)=[];
m=file;
m=[m,'6'];
file=[file,'7.jpg'];
mkdir('E:\taobao\block\',m);%�������ļ���
disp(file);
file=['E:\taobao\upper body part\',file]
Im=imread(file);
%imshow(Im)
%hold on
L = size(Im);
%I=readimagefunction(file);
height=30;
width=30;
max_row = floor(L(1)/height);%ʵ��ͼƬΪ300*300����max_row=10,max_col=10
max_col = floor(L(2)/width);
seg = cell(max_row,max_col);
%�ֿ�
for row = 1:max_row      
    for col = 1:max_col        
    seg(row,col)= {Im((row-1)*height+1:row*height,(col-1)*width+1:col*width,:)};   
    end
end 
for i=1:max_row*max_col
   
imwrite(seg{i},strcat('E:\taobao\block\',m,'\',int2str(i),'.jpg'));   %�ѵ�i֡��ͼƬдΪ'mi.jpg'����
end
%�����ֿ�ı߽�
for row = 1:max_row      
    for col = 1:max_col  
 rectangle('Position',[30*(col-1),30*(row-1),30,30],...
         'LineWidth',2,'LineStyle','-','EdgeColor','r');
        end
end 
hold off
end