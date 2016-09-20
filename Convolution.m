function out = Convolution(im,biasvector,filterbank)
    s = size(im);
    out = zeros(s(1), s(2), 10);
    sf = size(filterbank);
    
    for i = 1:sf(4);
        %get filter for layer
        filt = filterbank(:,:,:,i);
        
        %store temp convolves until we add them
        tempConv = cell(1,s(3));
        
        %conv each layer with it's layer's filter
        for j = 1:s(3)
            tempConv{1,j} = imfilter(im(:,:,j), filt(:,:,j), 'conv', 'same');
        end
        
        conv = 0;
        
        %adding all k layers together to form 1 layer
        for k = 1:s(3)
            conv = conv + tempConv{1,k};
        end
        
        %factor in bias and add to conv layer D2
        conv = conv + biasvector(i);
        out(:,:,i) = conv;
    end
end
