function out = softmax(im)
    alpha = max(im);
    im = im - alpha;
    sum = 0;
    
    for i = 1:length(im)
       sum = sum + exp(im(:,:,i));
    end
    
    for i = 1:length(im)
        expI = exp(im(:,:,i));
        im(:,:,i) = expI / sum;
    end
    
    out = im;
end