function [ image ] = fullyConnected(im,biasvector,filterbank)

im = double(im);
image = zeros(1,1,10,'double'); 

for i = 1:10
    
    ima = filterbank(:,:,:,i);
    imb = dot(ima,im);
    imc = sum(imb(:));
    image(:,:,i) = imc + biasvector(i);
    
end    

end

