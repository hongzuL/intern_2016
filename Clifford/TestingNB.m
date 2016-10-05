function testLabel=TestingNB(inputData)
    load 'tempData/NBtrain.mat'
    if length(inputData(1,:))==72
        testLabel=predict(NBModelAll,inputData);
    else
        testLabel=predict(NBModel3,inputData);
    end
    