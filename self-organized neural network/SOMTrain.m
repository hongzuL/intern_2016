% cluster data with trained data
function [acceptableLabels,unacceptableLabels,net]=SOMTrain(acceptable_array,unacceptable_array)
    x=vertcat(acceptable_array,unacceptable_array);
    x=x';
    [r1,c1]=size(acceptable_array);
    [r2,c2]=size(unacceptable_array);
    dimensions   = [5 5];
    coverSteps   = 10;
    initNeighbor = 10;
    topologyFcn  = 'hextop';
    distanceFcn  = 'linkdist';

    % define net
    net = selforgmap(dimensions,coverSteps,initNeighbor,topologyFcn,distanceFcn);
    [net,tr] = train(net,x);
    y = net(x);
    classes = vec2ind(y);
    acceptableLabels=classes(1:r1)';
    unacceptableLabels=classes(r1+1:r1+r2)';