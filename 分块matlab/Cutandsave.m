%�õ�ͼƬ������ͼƬ�ֳ���ȵ�����Ȼ��õ�ÿ������ֱ𱣴棺
q=database('taobao','root','','com.mysql.jdbc.Driver','jdbc:mysql://127.0.0.1:3306/taobao');
ping(q)
cursorA = exec(q,'select * from p1');
cursorA=fetch(cursorA) ;
cur=cursorA.data
num=rows(cursorA)
a=cur(1:num,2);
for n=1:1:391
m=a{n,1}
str1='E:/taobao/4/margin/'
str2='3.jpg'
str=[str1,m,str2]
Im=imread(str);
imshow(Im)
hold on
L = size(Im);
height=100;
width=120;
max_row = floor(L(1)/height);%ʵ��ͼƬΪ500*600����max_row=10,max_col=10
max_col = floor(L(2)/width);
seg = cell(max_row,max_col);
%�ֿ�
for row = 1:max_row      
    for col = 1:max_col        
    seg(row,col)= {Im((row-1)*height+1:row*height,(col-1)*width+1:col*width,:)};   
    end
end 
for i=1:max_row*max_col
imwrite(seg{i},strcat('E:/taobao/4/block/',m,int2str(i),'.jpg'));   %�ѵ�i֡��ͼƬдΪ'mi.bmp'����
end
%�����ֿ�ı߽�
for row = 1:max_row      
    for col = 1:max_col  
 rectangle('Position',[120*(col-1),100*(row-1),120,100],...
         'LineWidth',2,'LineStyle','-','EdgeColor','r');
        end
end 
hold off
end