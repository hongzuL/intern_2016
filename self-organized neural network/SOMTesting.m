% cluster data
function [testLabels]=SOMTesting(test_array,net)
    x=vertcat(test_array);
    x=x';
    [net,tr] = train(net,x);
    y = net(x);
    classes = vec2ind(y);
    testLabels=classes';