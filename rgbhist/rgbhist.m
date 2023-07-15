function H = rgbhist(I,nBins,Nind)
%% RGBHIST: color Histogram of an RGB image.
%代码下载自：http://www.mathworks.com/matlabcentral/fileexchange/4875-color-image-histogram
% nBins   : number of bins per EACH color => histogram is 'nBins^3' long.
% Nind    : Normalization index
%
%           0 -> Un-Normalized historam
%           1 -> l1 normalized
%           2 -> l2 normalized
%
% H       : The vectorized histogram.
%
% Author  : Mopuri K Reddy, SERC, IISc, Bengalur, INDIA.
% Date    : 25/10/2013.

if (size(I, 3) ~= 3)
    error('rgbhist:numberOfSamples', 'Input image must be RGB.')
end

if(nargin<3)
    Nind=0;
    % Default is un-normalized histogram
end
H=zeros([nBins nBins nBins]);
for i=1:size(I,1)
    for j=1:size(I,2)
        p=double(reshape(I(i,j,:),[1 3]));
        p=floor(p/(256/nBins))+1;
        H(p(1),p(2),p(3))=H(p(1),p(2),p(3))+1;
    end
end

H=H(:);
% Un-Normalized histogram

if(Nind==1)
    H=H./sum(H);
    % l1 normalization普通的归一化，看所占比例
else if(Nind==2)
        H=normc(H);
        % l2 normalization利用最大奇异值的归一化
    end
end



