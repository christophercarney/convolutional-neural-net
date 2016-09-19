function out = Convolution(im,biasvector,filterbank)
    s = size(im);
    out = zeros(s(1), s(2), 10);
    sf = size(filterbank);
    
    for i = 1:sf(4);
        filt = filterbank(:,:,:,i);
        
        tempConv = cell(1,s(3));
        for j = 1:s(3)
            tempConv{1,j} = imfilter(im(:,:,j), filt(:,:,j), 'conv', 'same');
            %conv = conv(:,:,1) + conv(:,:,2) + conv(:,:,3);
            %conv = conv + biasvector(i); 
            %out(:,:,i) = conv;
        end
        
        conv = 0;
        for k = 1:s(3)
            conv = conv + tempConv{1,k};
        end
        conv = conv + biasvector(i);
        out(:,:,i) = conv;
    end
end
