%��ɫƴ�ӹ�һ��

files=dir('E:\taobao\block5\*.txt');
for i=1:length(files)
file=files(i).name;
file=['E:\taobao\block5\',file];%����;����������������˾��ǲ����
%��txt��������
M=load(file);
M=M';%ת��
ca=tabulate(M(:));%������ֵ�����ݵ�ͳ��
%��������
temp = ca(:,2);
[newtemp ind] = sort(temp,'descend');
final = ca(ind,:);
n=length(newtemp);
j=11;
for i=1:n
p=final(i,1);
%ͳһ�ı�ĳԪ�ص�ֵ
if p~=10
idx=find(M==p); % find all p
M(idx)=j; % set j to these indexes
j=j+1;
end
end
%������ĺ�ľ�������1-100
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

