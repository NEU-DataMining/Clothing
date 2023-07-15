function [shape_fea,border_fft] = make_fft_sec(image_edged,ncoef)

% find border
f=find(image_edged);
lenf=length(f);

[new_indeces] = find_close_indeces(image_edged);
ii = new_indeces(:,2);
jj = new_indeces(:,1);
border_cmplx=ii+j*jj;

border_fft = fftshift(fft(border_cmplx));

if  mod(lenf,2) % odd
    lenf = lenf-1;
end
rc = fix(lenf/2)+1;  


p1 = [ (rc+1):(rc+1+ncoef-1)];
p2 = [ (rc-1):-1:(rc-1-ncoef+1)];

border_ifft=zeros(1,lenf);
for ind=1:(ncoef)
    mfreq_vec = zeros(1,lenf);
    mfreq_vec(p1(ind)) = border_fft(p1(ind));
    mfreq_vec(p2(ind)) = border_fft(p2(ind));
    border_ifft = border_ifft+(ifft(ifftshift(mfreq_vec)));
end
shape_fea = border_fft([p1,p2]);
shape_fea = shape_fea(2:end);
shape_fea = shape_fea/shape_fea(1);