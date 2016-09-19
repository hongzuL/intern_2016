function testLabel=TestingSVM(inputData)
    load '../tempData/SVMtrain.mat'
    testLabel=predict(SVMModelAll,inputData);
