%颜色拼接归一化

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
j=11;
for i=1:n
p=final(i,1);
%统一改变某元素的值
if p~=10
idx=find(M==p); % find all p
M(idx)=j; % set j to these indexes
j=j+1;
end
end
%保存更改后的矩阵带编号1-100
%save(file,'M','-ascii');
fid = fopen('test.txt', 'a+');
fprintf(fid,'%s','1 ');
for i=1:10
    for j=1:10
      id=(i-1)*10+j;
      fprintf(fid,'%i',id);
      fprintf(fid,'%s',':');
fprintf(fid, '%6.2f',M(i,j));
fprintf(fid,'%s',' ');
    end
end
fprintf(fid,'%s\n','');
fclose(fid);
end

