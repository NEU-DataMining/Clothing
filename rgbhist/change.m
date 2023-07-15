%服装拼接原始颜色矩阵变换成最终矩阵
%颜色拼接归一化
files=dir('E:\taobao\block\txt\*.txt');
for i=1:length(files)
file=files(i).name;
file=['E:\taobao\block\txt\',file];%不加;就是输出出来，加了就是不输出
%读txt到矩阵中
M=load(file);
M=M';%转置
ca=tabulate(M(:));%用于数值型数据的统计
%重新排序
temp = ca(:,2);
[newtemp ind] = sort(temp,'descend');
final = ca(ind,:);
n=length(newtemp);
j=200;
%统一改变某元素的值
idx=find(M==1); % 色号1代表黑色，找到所有黑色块
M(idx)=j; % 将所有黑色块代表号改为200
j=j+1;%代表号加1
for i=1:n
p=final(i,1);
if p~=1 %过滤掉黑色块，因为前面已经处理完
idx=find(M==p); % find all p
M(idx)=j; % set j to these indexes
j=j+1;
end
end
%保存更改后的矩阵带编号1-100
%save(file,'M','-ascii');
fid = fopen('test.txt', 'a+');%转换后的带1~100标号的矩阵保存到当前文件夹test.txt文件中，用于svm训练
fprintf(fid,'%s','0 ');
for i=1:10
    for j=1:10
      id=(i-1)*10+j;
      fprintf(fid,'%i',id);
      fprintf(fid,'%s',':');
fprintf(fid, '%6.2f',M(i,j)-200);
fprintf(fid,'%s',' ');
    end
end
fprintf(fid,'%s\n','');
fclose(fid);
end
