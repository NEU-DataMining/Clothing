function bUni = IsUniform(bits)
%�ж�ĳһ��λ��ģʽbits�Ƿ���uniformģʽ
%���룺bits---������LBPģʽ��
%����ֵ��bUni---=1��if bits ��uniformģʽ����=2��if bits����uniformģʽ��

n=length(bits);

nJmp = 0;%λ�����䣨0->1 or 1->0��
for ii=1:(n-1)
    if(bits(ii)~=bits(ii+1))
        nJmp=nJmp+1;
    end
end
if (bits(n)~=bits(1))
    nJmp=nJmp+1;
end
if nJmp>2
    bUni=false;
else
    bUni=true;
end
