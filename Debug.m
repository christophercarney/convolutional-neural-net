function Debug()
    load('debuggingTest.mat');
    load('CNNparameters.mat', '-mat');
    load('cifar10testdata.mat', '-mat');
    
    im = imread('airplane_test.jpg');
    %sample code to show image and access expected results
    figure; imagesc(im); truesize(gcf,[64 64]);
    out = ConvNeuralNet(im);
    for d = 1:length(layerResults)
        %result = layerResults{d};
        %fprintf('actual layer %d output is size %d x %d x %d\n',...
        %d,size(result,1),size(result,2), size(result,3));
    
        result2 = out{d};
        fprintf('computed layer %d output is size %d x %d x %d\n',...
        d,size(result2,1),size(result2,2), size(result2,3));
    
        %diff = setdiff(result, result2);
        %if(length(diff) ~= 0)
        %    fprintf('computed layer %d differs from actual\n', d);
        %end
    end
    %find most probable class
    %classprobvec = squeeze(layerResults{end});
    %[maxprob,maxclass] = max(classprobvec);
    %note, classlabels is defined in ?cifar10testdata.mat?
    %fprintf('actual class is %s with probability %.4f\n',...
    %classlabels{maxclass},maxprob);

    %find most probable class
    classprobvec = squeeze(out{end});
    [maxprob,maxclass] = max(classprobvec);
    %note, classlabels is defined in ?cifar10testdata.mat?
    fprintf('computed class is %s with probability %.4f\n',...
    classlabels{maxclass},maxprob);

end