a=load('result.txt');
b=load('used_for_get_pic_id.txt');
B=reshape(b,[2 numel(b)/2]);%转换成两行矩阵
B=B';%转置，转成两列
B(:,2) = [];%去掉矩阵某一列
A=[B,a];%合并两个矩阵
save id_list B %所有图片id
save texture_result A %纹理分类结果
