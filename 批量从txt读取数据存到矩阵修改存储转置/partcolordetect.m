files=dir('E:\taobao\block5\*.txt');
for i=1:length(files)
file=files(i).name;
file=['E:\taobao\block5\',file];%不加;就是输出出来，加了就是不输出
%读txt到矩阵中
M=load(file);
M=M';%转置
ca=tabulate(M(:));%用于数值型数据的统计
%重新排序
temp = ca(:,2);
[newtemp ind] = sort(temp,'descend');
final = ca(ind,:);
n=length(newtemp);
fid = fopen('test.txt', 'a+');
fprintf(fid, '%s',file);   
  fprintf(fid, '%s',':');
  fprintf(fid,'%s\n','');
for i=1:n
p=final(i,1);
%统一改变某元素的值
if p~='10'
fprintf(fid, '%6.2f',p);
fprintf(fid,'%s\n','');
end
end
fclose(fid);
end
