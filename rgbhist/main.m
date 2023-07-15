

%计算每个upper body part的125维颜色直方图
 files=dir('E:\taobao\upper\*.jpg');
 for i=1:length(files)
 file=files(i).name;
%  file(end-4:end)=[];
%  file=[file,'7.jpg']
 I=imread(['E:\taobao\upper\',file]);
 h=rgbhist(I,5,1);
 file(end-3:end)=[];
%  file(end-4:end)=[];
%  file=[file,'6'];
save(['E:\taobao\upper\colorhist\',file,'.mat'],'h');%保存排好序的结果
 end




% 针对拼接服装图像剪切成100块后对每块的主颜色进行统计
% input_block_forder='E:\taobao\block\';
% forders=dir('E:\taobao\block\*');
% for i=3:length(forders)
%     forder=forders(i).name;
%     f_forder=[input_block_forder,forder];
%     forder_jpg=[f_forder,'\*.jpg'];
%     files=dir(forder_jpg); 
%     forder_txt=[input_block_forder,forder,'.txt'];   
%     for j=1:100          %100块
%         f_jpg=[f_forder,'\' ,num2str(j),'.jpg'];
%         I=imread(f_jpg);
%         h=rgbhist(I,5,0);     %0表示原始值，未经过归一化
%         fid = fopen(forder_txt, 'a+');
%         color=0; 
%         %fprintf(fid,'%i',j);
%         %fprintf(fid,'%s',':');
%        
%         %获取主颜色
%         for m=1:125
%            if h(m)>color
%                color=h(m);
%                n=m;
%            end
%         end
%         %去除皮肤
%         if n==95||n==100%在125维颜色直方图中皮肤的色号是95和100
%             n=1;
%         end
%          fprintf(fid, '%d',n);
%          fprintf(fid,'%s',' ');
%          %为了实现按照矩阵的形式存储到文件中
%          if mod(j,10)==0
%              j
%              fprintf(fid,'%s\n','');
%          end
%           fclose(fid);
%     end
%   
% end



% row_cmap = 27;  %定义色图矩阵的行数
% color_map1=zeros(row_cmap,3);  %定义色图矩阵
% color_r = 1/(row_cmap-1):1/(row_cmap-1):1/(row_cmap-1); 
% color_g = 1/(row_cmap-1):1/(row_cmap-1):1/(row_cmap-1); 
% color_b = 1/(row_cmap-1):1/(row_cmap-1):1/(row_cmap-1); 
% color_map1(:,1) = color_r; 
% color_map1(:,2) = color_g;
% color_map1(:,3) = color_b;
% colormap(color_map1);
% colorbar;


%彩色图是没有直方图的，只能在rgb方向分别求直方图在合并一下,简单来做可以用rgb2gray转到灰度图，再在二维上进行直方图绘制
%I=imread('E:\1.jpg');  % 文件名自己改 
%siz=size(I); 
%I1=reshape(I,siz(1)*siz(2),siz(3));  % 每个颜色通道变为一列 
%I1=double(I1); 
%[N,X]=hist(I,[0:5:255]);    % 如果需要小矩形宽一点，划分区域少点，可以把步长改大，比如0:5:255 
%bar(X,N(:,[3 2 1]));    % 柱形图，用N(:,[3 2 1])是因为默认绘图的时候采用的颜色顺序为b,g,r,c,m,y,k，跟图片的rgb顺序正好相反，所以把图片列的顺序倒过来，让图片颜色通道跟绘制时的颜色一致 
%xlim([0 26]) 
%hold on 
%plot(X,N(:,[3 2 1]));    % 上边界轮廓 
%hold off
%n=27;
%map=colormap(hsv(n));%显示rgb的颜色图谱
%pcolor([1:n+1;1:n+1]')