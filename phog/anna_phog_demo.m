%批量phog
imlist = dir('E:/taobao/sleeve-left/*.jpg');
for i = 1:length(imlist)
    image=['E:/taobao/sleeve-left/',[imlist(i).name]];
    %image = imread('E:/taobao/collar/'[imlist(i).name]);
    [rows,cols,s] = size(imread(image)); 
    m=imlist(i).name;
    m(end-3:end)=[];
     m=['E:/taobao/sleeve-left/phog/',m,'.txt'];
    % mkdir('E:cut\',m);%创建块保存路径
    bin=12;
L= 3;
angle = 180;
roi = [1;rows;1;cols];
I=image;
p = anna_phog(I,bin,angle,L,roi,m)
end