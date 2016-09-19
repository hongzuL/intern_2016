function testLabel=TestingLDA(inputData)
    load '../tempData/LDAtrain.mat'
    testLabel=predict(LDAModelAll,inputData);
   