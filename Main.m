function Main()
    %loading this file defines imageset, trueclass, and classlabels
    load('cifar10testdata.mat', '-mat');

    confusionMatrix = zeros(10, 10);
    classifyPlot = zeros(1, 10);

    fprintf('classifying 10,000 cifar10testdata images...\n');
    
    %some sample code to read and display one image from each class
    for classindex = 1:10
        %get indices of all images of that class
        inds = find(trueclass==classindex);
        %take first one
        for imNum = 1:1000
            imrgb = imageset(:,:,:,inds(imNum));    %load each img into
            out = ConvNeuralNet(imrgb);             %  CNN

            classprobvec = squeeze(out{end});
            [maxprob,maxclass] = max(classprobvec);

            %placing what the img was computed as in the matrix
            confusionMatrix(classindex, maxclass) = confusionMatrix(classindex, maxclass) + 1;
            pos = GetCorrectClassPosition(classindex, classprobvec);
            classifyPlot = PlotClassification(classifyPlot, pos);
            
        end
        fprintf('%d percent done...\n', classindex * 10);
    end

    disp(confusionMatrix);
    disp(classifyPlot);
end

function out = GetCorrectClassPosition(classindex, classprobvec)
    out = 1;

    [maxprob,maxclass] = max(classprobvec);
    while maxclass ~= classindex
        classprobvec(maxclass) = 0;
        out = out + 1;
        [maxprob,maxclass] = max(classprobvec);
    end
end
