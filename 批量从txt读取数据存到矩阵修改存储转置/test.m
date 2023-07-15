fid = fopen('exp.txt', 'wt');
for i=1:10
    for j=1:10
      id=(i-1)*10+j;
      fprintf(fid,'%i',id);
      fprintf(fid,'%s',':');
fprintf(fid, '%6.2f',M(i,j));
fprintf(fid,'%s',' ');
    end
end
%y=M(4,4);
fclose(fid);