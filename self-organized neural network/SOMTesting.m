% cluster data
function [acceptableLabels,unacceptableLabels,testLabels]=SOMTesting(acceptable_array,unacceptable_array,test_array)
    x=vertcat(acceptable_array,unacceptable_array,test_array);
    x=x';
    [r,c]=size(acceptable_array);
    [r1,c1]=size(unacceptable_array);
    dimensions   = [5 5];
    coverSteps   = 100;
    initNeighbor = 10;
    topologyFcn  = 'hextop';
    distanceFcn  = 'linkdist';

    % define net
    net = selforgmap(dimensions,coverSteps,initNeighbor,topologyFcn,distanceFcn);
    [net,tr] = train(net,x);
    y = net(x);
    classes = vec2ind(y);
    acceptableLabels=classes(1:r);
    unacceptableLabels=classes(r+1:r+r1);
    testLabels=classes(r1+1:length(classes));
    acceptableLabels=acceptableLabels';
    unacceptableLabels=unacceptableLabels';