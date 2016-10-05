function testLabel=TestingMLP(Hnode,inputData)
    load 'tempData/MLPtrain.mat'
    if length(inputData(1,:))==72
        net=netC{Hnode};
        testLabel = net(inputData');
        testLabel=shiftTestLabelForMLP(testLabel);
    else
        net=netC3{Hnode};
        testLabel = net(inputData');
        testLabel=shiftTestLabelForMLP(testLabel);
    end
