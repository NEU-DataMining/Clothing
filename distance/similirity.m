files1=dir('E:\taobao\sleeve-left\*.jpg');
for i=1:length(files1)
    file1=files1(i).name;
    I1=file1;
    I1(end-3:end)=[];
    files2=dir('E:\taobao\sleeve-left2\*.jpg');
    for j=1:length(files2)
        file2=files2(j).name;
        I2=file2;
        I2(end-3:end)=[];
        d1=phogDistance(I1,I2);
        d2=GistDistance(I1,I2);
        d3=FoirierDistance(I1,I2);
    end
end