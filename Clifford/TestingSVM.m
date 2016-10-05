function testLabel=TestingSVM(inputData)
    load 'tempData/SVMtrain.mat'
    if length(inputData(1,:))==72
        testLabel=predict(SVMModelAll,inputData);
    else
        testLabel=predict(SVMModel3,inputData);
    end
