NUM = 5;
 imlist = dir('E:/taobao/sleeve-left/*.jpg');
%for i = 1:length(imlist)
   % image1=['E:/taobao/collar/',[imlist(i).name]];
   % imT   = imread(image1);
    %imT   =rgb2gray(imT);
    %edgeT = edge(imT,'canny');
    %[shape_feaT] = make_fft_sec(edgeT,NUM);
    for j=1:length(imlist)
        image2=['E:/taobao/sleeve-left/',[imlist(j).name]];
       im1   = imread(image2);
       im1   =rgb2gray(im1);
       edge1 = edge(im1,'canny');
       [shape_fea1] = make_fft_sec(edge1,NUM);
       %distance1 = sum(abs(shape_feaT-shape_fea1));
       m=imlist(j).name;
    m(end-3:end)=[];
    m=['E:/taobao/sleeve-left/foirier/',m,'.txt'];
    dlmwrite(m,shape_fea1,'\n');
%%imT   = imread('testX\1.jpg');
%%imT   =rgb2gray(imT);
%%edgeT = edge(imT,'canny');
%%[shape_feaT] = make_fft_sec(edgeT,NUM);
%
%
%%im1   = imread('testX\2.jpg');
%%im1   =rgb2gray(im1);
%%edge1 = edge(im1,'canny');
%%[shape_fea1] = make_fft_sec(edge1,NUM);
%%distance1 = sum(abs(shape_feaT-shape_fea1));
%
%
     % distance1
         
     % distance1<10
    end
%end
