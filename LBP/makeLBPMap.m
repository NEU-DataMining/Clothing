function vecLBPMap = makeLBPMap
%���ɣ�8,2������uniform LBPֱ��ͼ��ӳ���ϵ������256���Ҷ�ֵӳ�䵽59���ռ�����
%���еķ�uniform����һ���ռ�����

vecLBPMap = zeros(1,256);%��ʼ��ӳ���
 
bits = zeros(1,8);%8λ������ģʽ��

nCurBin=1;

for ii =0:255
    num =ii;
    nCnt=0;
    
    %��ûҶ�num�Ķ����Ʊ�ʾbits
    while (num)
        bits(8-nCnt)=mod(num,2);
        num=floor(num/2);
        nCnt=nCnt+1;
    end
    
    if IsUniform(bits)%�ж�bits�ǲ���uniformģʽ
        vecLBPMap(ii+1)=nCurBin;%ÿ��uniformģʽ����һ���ռ���
        nCurBin=nCurBin + 1;
    else
        vecLBPMap(ii+1)=59;%���з�uniformģʽ�������59���ռ���
    end
end

%����ӳ���
save('LBPMap.mat','vecLBPMap');