function MakeGraphsFromOutputSet(out)

    load('cifar10testdata.mat', '-mat');

    %output some images for layers
    im = out{1};
    figure, imagesc([im(:,:,1), im(:,:,2), im(:,:,3)])    
        colormap(gray), truesize(gcf,[64 96]), box off
        set(gca,'xcolor',get(gcf,'color')), set(gca,'xtick',[]);
        set(gca,'ycolor',get(gcf,'color')),set(gca,'ytick',[]);            
    title(sprintf('image normalizaiton layer 1'));    
    
    im = out{2};
    figure, imagesc([im(:,:,1), im(:,:,2), im(:,:,3), im(:,:,4), im(:,:,5)...
            im(:,:,6), im(:,:,7), im(:,:,8), im(:,:,9), im(:,:,10)]);
        colormap(gray), truesize(gcf,[64 320]), box off
        set(gca,'xcolor',get(gcf,'color')), set(gca,'xtick',[]);
        set(gca,'ycolor',get(gcf,'color')),set(gca,'ytick',[]);            
    title(sprintf('convolution layer 2'));
       
    im = out{4};
    figure, imagesc([im(:,:,1), im(:,:,2), im(:,:,3), im(:,:,4), im(:,:,5)...
            im(:,:,6), im(:,:,7), im(:,:,8), im(:,:,9), im(:,:,10)]);
        colormap(gray), truesize(gcf,[64 320]), box off
        set(gca,'xcolor',get(gcf,'color')), set(gca,'xtick',[]);
        set(gca,'ycolor',get(gcf,'color')),set(gca,'ytick',[]);            
    title(sprintf('convolution layer 4'));

    im = out{9};
    figure, imagesc([im(:,:,1), im(:,:,2), im(:,:,3), im(:,:,4), im(:,:,5)...
            im(:,:,6), im(:,:,7), im(:,:,8), im(:,:,9), im(:,:,10)]);
        colormap(gray), truesize(gcf,[64 320]), box off
        set(gca,'xcolor',get(gcf,'color')), set(gca,'xtick',[]);
        set(gca,'ycolor',get(gcf,'color')),set(gca,'ytick',[]);            
    title(sprintf('convolution layer 9'));    
    
    im = out{14};
    figure, imagesc([im(:,:,1), im(:,:,2), im(:,:,3), im(:,:,4), im(:,:,5)...
            im(:,:,6), im(:,:,7), im(:,:,8), im(:,:,9), im(:,:,10)]);
        colormap(gray), truesize(gcf,[64 320]), box off
        set(gca,'xcolor',get(gcf,'color')), set(gca,'xtick',[]);
        set(gca,'ycolor',get(gcf,'color')),set(gca,'ytick',[]);            
    title(sprintf('convolution layer 14'));    

    results = out{end};
    y = zeros(1, 10);
    
    for i = 1:10
       y(1, i) = results(:,:,i);
    end
    
    figure, barh(y);
    set(gca,'yticklabel',classlabels)
    title(sprintf('final probabilities'));
    ylabel('item class'), xlabel('probability'); 

end