function CustomTest()
    load('cifar10testdata.mat', '-mat');
    load('CNNparameters.mat', '-mat');

    %reading the files we got from the internet in and classifying them
    files = dir('custom_test/*.jpg');
    for file = files'
        im = imread(strcat('custom_test/',file.name));
        % Do some stuff
        out = ConvNeuralNet(im);
        
        if(strcmp(file.name,'face_1.jpg'))
            MakeGraphsFromOutputSet(out);
        end
        
        classprobvec = squeeze(out{end});
        [maxprob,maxclass] = max(classprobvec);
        fprintf('computed class is %s (actual %s) with probability %.4f\n',...
        classlabels{maxclass},file.name,maxprob);
    end
end
