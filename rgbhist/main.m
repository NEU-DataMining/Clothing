

%����ÿ��upper body part��125ά��ɫֱ��ͼ
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
save(['E:\taobao\upper\colorhist\',file,'.mat'],'h');%�����ź���Ľ��
 end




% ���ƴ�ӷ�װͼ����г�100����ÿ�������ɫ����ͳ��
% input_block_forder='E:\taobao\block\';
% forders=dir('E:\taobao\block\*');
% for i=3:length(forders)
%     forder=forders(i).name;
%     f_forder=[input_block_forder,forder];
%     forder_jpg=[f_forder,'\*.jpg'];
%     files=dir(forder_jpg); 
%     forder_txt=[input_block_forder,forder,'.txt'];   
%     for j=1:100          %100��
%         f_jpg=[f_forder,'\' ,num2str(j),'.jpg'];
%         I=imread(f_jpg);
%         h=rgbhist(I,5,0);     %0��ʾԭʼֵ��δ������һ��
%         fid = fopen(forder_txt, 'a+');
%         color=0; 
%         %fprintf(fid,'%i',j);
%         %fprintf(fid,'%s',':');
%        
%         %��ȡ����ɫ
%         for m=1:125
%            if h(m)>color
%                color=h(m);
%                n=m;
%            end
%         end
%         %ȥ��Ƥ��
%         if n==95||n==100%��125ά��ɫֱ��ͼ��Ƥ����ɫ����95��100
%             n=1;
%         end
%          fprintf(fid, '%d',n);
%          fprintf(fid,'%s',' ');
%          %Ϊ��ʵ�ְ��վ������ʽ�洢���ļ���
%          if mod(j,10)==0
%              j
%              fprintf(fid,'%s\n','');
%          end
%           fclose(fid);
%     end
%   
% end



% row_cmap = 27;  %����ɫͼ���������
% color_map1=zeros(row_cmap,3);  %����ɫͼ����
% color_r = 1/(row_cmap-1):1/(row_cmap-1):1/(row_cmap-1); 
% color_g = 1/(row_cmap-1):1/(row_cmap-1):1/(row_cmap-1); 
% color_b = 1/(row_cmap-1):1/(row_cmap-1):1/(row_cmap-1); 
% color_map1(:,1) = color_r; 
% color_map1(:,2) = color_g;
% color_map1(:,3) = color_b;
% colormap(color_map1);
% colorbar;


%��ɫͼ��û��ֱ��ͼ�ģ�ֻ����rgb����ֱ���ֱ��ͼ�ںϲ�һ��,������������rgb2grayת���Ҷ�ͼ�����ڶ�ά�Ͻ���ֱ��ͼ����
%I=imread('E:\1.jpg');  % �ļ����Լ��� 
%siz=size(I); 
%I1=reshape(I,siz(1)*siz(2),siz(3));  % ÿ����ɫͨ����Ϊһ�� 
%I1=double(I1); 
%[N,X]=hist(I,[0:5:255]);    % �����ҪС���ο�һ�㣬���������ٵ㣬���԰Ѳ����Ĵ󣬱���0:5:255 
%bar(X,N(:,[3 2 1]));    % ����ͼ����N(:,[3 2 1])����ΪĬ�ϻ�ͼ��ʱ����õ���ɫ˳��Ϊb,g,r,c,m,y,k����ͼƬ��rgb˳�������෴�����԰�ͼƬ�е�˳�򵹹�������ͼƬ��ɫͨ��������ʱ����ɫһ�� 
%xlim([0 26]) 
%hold on 
%plot(X,N(:,[3 2 1]));    % �ϱ߽����� 
%hold off
%n=27;
%map=colormap(hsv(n));%��ʾrgb����ɫͼ��
%pcolor([1:n+1;1:n+1]')