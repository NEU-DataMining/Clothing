
files=dir('E:\taobao\test\*.jpg');
for i=1:length(files)
file=files(i).name;
disp(file);
% some process
%I=readimagefunction(file);
% other code
end