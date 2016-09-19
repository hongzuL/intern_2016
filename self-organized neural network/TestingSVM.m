function testLabel=TestingSVM(inputData)
    load 'SVMtrain.mat'
    testLabel=predict(SVMModelAll,inputData);
