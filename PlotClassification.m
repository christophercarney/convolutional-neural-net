function out = PlotClassification(inPlot, position)
    count = 11 - position;
    %inPlot(1, count) = inPlot(1, count) + 1;
    %count = count - 1;
    inds = 10;
    while inds ~= (10 - count) 
        inPlot(1, inds) = inPlot(1, inds) + 1;
        inds = inds - 1;
    end
    
    out = inPlot;
end