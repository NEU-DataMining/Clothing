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
fid = fopen('test.txt', 'a+');
fprintf(fid, '%s',file);   
  fprintf(fid, '%s',':');
  fprintf(fid,'%s\n','');
for i=1:n
p=final(i,1);
%ͳһ�ı�ĳԪ�ص�ֵ
if p~='10'
fprintf(fid, '%6.2f',p);
fprintf(fid,'%s\n','');
end
end
fclose(fid);
end
