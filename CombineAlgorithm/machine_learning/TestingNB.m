function testLabel=TestingNB(inputData)
    load '../tempData/NBtrain.mat'
    testLabel=predict(NBModelAll,inputData);
    