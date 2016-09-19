function out = ConvNeuralNet(input_im)
    load('CNNparameters.mat', '-mat');
    load('cifar10testdata.mat', '-mat');
    
    out = cell(1, 18);
    im = double(input_im);

    out{1,1}  = ImageNormalization(im);
    out{1,2}  = Convolution(out{1,1}, biasvectors{2}, filterbanks{2});
    out{1,3}  = reLU(out{1,2});
    out{1,4}  = Convolution(out{1,3}, biasvectors{4}, filterbanks{4});
    out{1,5}  = reLU(out{1,4});
    out{1,6}  = Maxpool(out{1,5});
    out{1,7}  = Convolution(out{1,6}, biasvectors{7}, filterbanks{7});
    out{1,8}  = reLU(out{1,7});
    out{1,9}  = Convolution(out{1,8}, biasvectors{9}, filterbanks{9});
    out{1,10} = reLU(out{1,9});
    out{1,11} = Maxpool(out{1,10});
    out{1,12} = Convolution(out{1,11}, biasvectors{12}, filterbanks{12});
    out{1,13} = reLU(out{1,12});
    out{1,14} = Convolution(out{1,13}, biasvectors{14}, filterbanks{14});
    out{1,15} = reLU(out{1,14});
    out{1,16} = Maxpool(out{1,15});
    out{1,17} = fullyConnected(out{1,16}, biasvectors{17}, filterbanks{17});
    out{1,18} = softmax(out{1,17});

    %figure; imagesc(orig); truesize(gcf,[64 64]);
    %sprintf('Found:%s',classlabels{IndexOfMax(final)}); 
    %disp(classlabels{IndexOfMax(out{1,18})});
    %disp(out{1,18});
end

function out = IndexOfMax(probabilities)
    m = max(probabilities);
    for i = 1:length(probabilities)
        if (probabilities(i) == m)
            out = i;
        end
    end
end