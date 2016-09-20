function Debug()
    load('debuggingTest.mat');
    load('CNNparameters.mat', '-mat');
    load('cifar10testdata.mat', '-mat');
    
    %sample code to show image and access expected results
    figure; imagesc(imrgb); truesize(gcf,[64 64]);
    out = ConvNeuralNet(imrgb);
    for d = 1:length(layerResults)
        %stored debugging result
        result = layerResults{d};
        fprintf('actual layer %d output is size %d x %d x %d\n',...
        d,size(result,1),size(result,2), size(result,3));
    
        %result of our CNN 
        result2 = out{d};
        fprintf('computed layer %d output is size %d x %d x %d\n',...
        d,size(result2,1),size(result2,2), size(result2,3));
    
        %stop with debugger here as needed and check out
        %   results and differences between steps
        disp(setdiff(result, result2));
    end

    %find most probable class
    classprobvec = squeeze(out{end});
    [maxprob,maxclass] = max(classprobvec);
    %note, classlabels is defined in ?cifar10testdata.mat?
    fprintf('computed class is %s with probability %.4f\n',...
    classlabels{maxclass},maxprob);
    %acutal is airplane, CNN computes airplane

end