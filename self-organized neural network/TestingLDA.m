function testLabel=TestingLDA(inputData)
    load 'LDAtrain.mat'
    testLabel=predict(LDAModelAll,inputData);
   