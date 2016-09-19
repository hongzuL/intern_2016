function testLabel=TestingMLP(Hnode,inputData)
    load 'MLPtrain.mat'
    net=netC{Hnode};
    testLabel = net(inputData');
    testLabel=shiftTestLabelForMLP(testLabel);
