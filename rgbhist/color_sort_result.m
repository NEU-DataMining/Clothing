%展示颜色匹配结果
%I='136904976086';%368882725416,171852730266,366776251236,371922058006,373318030246,366716506506,353681635006,386655429626,405676416526,393827498866,396593508846,396194943506,400193781676,400164182876,400489329286,404676305596,430202493506

f=['E:\taobao\upper body part\colorhist\distance125\color_sort_all\',I,'.mat']
load (f);
for i=1:11
file=B(i,1);%取每行第一个元素的值
file=num2str(file);%数字转换为字符
file(end-0:end)=[];
file=[file,'7'];
file=['E:\taobao\upper body part\',file,'.jpg'];
imshow(file)
pause
end