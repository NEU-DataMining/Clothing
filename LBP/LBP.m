files=dir('E:\taobao\center1\*.jpg');
for i=1:length(files)
file=files(i).name;
f_jpg=['E:\taobao\center1\',file];%����;����������������˾��ǲ����
    %f_jpg=['E:\lbptrain\b\' num2str(i) '.jpg'];
    I=imread(f_jpg);
    %[histLBP11,MatLBP11,MatLBP_MB11]=getMBLBPFea(I,1);
   % [histLBP12,MatLBP12,MatLBP_MB12]=getMBLBPFea(I,2);
    [histLBP13,MatLBP13,MatLBP_MB13]=getMBLBPFea(I,3);
   % [histLBP21,MatLBP21,MatLBP_MB21]= getMBLBPFea_33(I,1);
    %[histLBP21,MatLBP21,MatLBP_MB21]= getMBLBPFea_33(I,2);
   % [histLBP21,MatLBP21,MatLBP_MB21]= getMBLBPFea_33(I,3);
    %figure;
    %imshow(I);
    %figure;
    histLBP13;
    file(end-3:end)=[];
   % subplot(2,3,1);hist(histLBP12,59);title('Ϊ1ʱ��ֱ��ͼ');
   % subplot(2,3,2);imshow(MatLBP_MB12,[]);title('Ϊ1ʱ��ͼ��');
   save(['E:\taobao\center1\lbp\',file],'histLBP13')
end