function [netC,performance,percentErrors]=MLPNN(inputData,label)
    % Solve a Pattern Recognition Problem with a Neural Network
    % Script generated by Neural Pattern Recognition app
    % Created 04-Aug-2016 18:46:12
    %
    % This script assumes these variables are defined:
    %
    %   inputData - input data.
    %   label - target data.

    x = inputData';
    t = label';

    % Choose a Training Function
    % For a list of all training functions type: help nntrain
    % 'trainlm' is usually fastest.
    % 'trainbr' takes longer but may be better for challenging problems.
    % 'trainscg' uses less memory. Suitable in low memory situations.
    trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.

    % Create a Pattern Recognition Network
    performance=zeros(28,1);
    percentErrors=zeros(28,1);
    netC={28};
    for i=3:30
        hiddenLayerSize = i;

        net = patternnet(hiddenLayerSize);

        % Setup Division of Data for Training, Validation, Testing
        net.divideParam.trainRatio = 70/100;
        net.divideParam.valRatio = 15/100;
        net.divideParam.testRatio = 15/100;

        % Train the Network
        [net,tr] = train(net,x,t);

        % Test the Network
        y = net(x);
        e = gsubtract(t,y);
        performance(i-2) = perform(net,t,y);
        tind = vec2ind(t);
        yind = vec2ind(y);
        percentErrors(i-2) = sum(tind ~= yind)/numel(tind);
        netC(i-2)={net};
        % View the Network
        % view(net)

        % Plots
        % Uncomment these lines to enable various plots.
    %     figure(i+30), plotperform(tr)
    %     figure(i+31), plottrainstate(tr)
    %     figure(i+32), ploterrhist(e)
%         figure(i+33), plotconfusion(t,y)
    %     figure(i+34), plotroc(t,y)
    end
    netC=netC';