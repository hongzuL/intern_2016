function testLabel=TestingNB(inputData)
    load 'NBtrain.mat'
    testLabel=predict(NBModelAll,inputData);
    