% cluster data with trained data
function [acceptableLabels,unacceptableLabels,acceptableLabels_test,unacceptableLabels_test]=SOMcluster(acceptable_array,unacceptable_array,acceptable_array_test,unacceptable_array_test)
    x=vertcat(acceptable_array,unacceptable_array,acceptable_array_test,unacceptable_array_test);
    x=x';
    [r1,c1]=size(acceptable_array);
    [r2,c2]=size(unacceptable_array);
    [r3,c3]=size(acceptable_array_test);
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
    acceptableLabels=classes(1:r1);
    unacceptableLabels=classes(r1+1:r1+r2);
    acceptableLabels_test=classes(r1+r2+1:r1+r2+r3);
    unacceptableLabels_test=classes(r1+r2+r3+1:length(classes));
    acceptableLabels=acceptableLabels';
    unacceptableLabels=unacceptableLabels';
    acceptableLabels_test=acceptableLabels_test';
    unacceptableLabels_test=unacceptableLabels_test';