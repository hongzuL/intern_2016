% cluster data
function [acceptableLabels,unacceptableLabels]=SOMValidate(acceptable_array,unacceptable_array,net)
    x=vertcat(acceptable_array,unacceptable_array);
    x=x';
    [r1,c1]=size(acceptable_array);
    [r2,c2]=size(unacceptable_array);
    [net,tr] = train(net,x);
    y = net(x);
    classes = vec2ind(y);
    acceptableLabels=classes(1:r1)';
    unacceptableLabels=classes(r1+1:r1+r2)';