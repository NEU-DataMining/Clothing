function bUni = IsUniform(bits)
%判断某一个位串模式bits是否是uniform模式
%输入：bits---二进制LBP模式串
%返回值：bUni---=1，if bits 是uniform模式串；=2，if bits不是uniform模式串

n=length(bits);

nJmp = 0;%位数跳变（0->1 or 1->0）
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
