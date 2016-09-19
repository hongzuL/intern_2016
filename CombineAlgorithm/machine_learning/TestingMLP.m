function testLabel=TestingMLP(Hnode,inputData)
    load '../tempData/MLPtrain.mat'
    net=netC{Hnode};
    testLabel = net(inputData');
    testLabel=shiftTestLabelForMLP(testLabel);
