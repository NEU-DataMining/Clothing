a=load('result.txt');
b=load('used_for_get_pic_id.txt');
B=reshape(b,[2 numel(b)/2]);%ת�������о���
B=B';%ת�ã�ת������
B(:,2) = [];%ȥ������ĳһ��
A=[B,a];%�ϲ���������
save id_list B %����ͼƬid
save texture_result A %���������
