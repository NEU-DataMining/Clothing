%��װƴ��ԭʼ��ɫ����任�����վ���
%��ɫƴ�ӹ�һ��
files=dir('E:\taobao\block\txt\*.txt');
for i=1:length(files)
file=files(i).name;
file=['E:\taobao\block\txt\',file];%����;����������������˾��ǲ����
%��txt��������
M=load(file);
M=M';%ת��
ca=tabulate(M(:));%������ֵ�����ݵ�ͳ��
%��������
temp = ca(:,2);
[newtemp ind] = sort(temp,'descend');
final = ca(ind,:);
n=length(newtemp);
j=200;
%ͳһ�ı�ĳԪ�ص�ֵ
idx=find(M==1); % ɫ��1�����ɫ���ҵ����к�ɫ��
M(idx)=j; % �����к�ɫ�����Ÿ�Ϊ200
j=j+1;%����ż�1
for i=1:n
p=final(i,1);
if p~=1 %���˵���ɫ�飬��Ϊǰ���Ѿ�������
idx=find(M==p); % find all p
M(idx)=j; % set j to these indexes
j=j+1;
end
end
%������ĺ�ľ�������1-100
%save(file,'M','-ascii');
fid = fopen('test.txt', 'a+');%ת����Ĵ�1~100��ŵľ��󱣴浽��ǰ�ļ���test.txt�ļ��У�����svmѵ��
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
