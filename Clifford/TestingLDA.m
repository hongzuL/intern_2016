function testLabel=TestingLDA(inputData)
    load 'tempData/LDAtrain.mat'
    if length(inputData(1,:))==72
        testLabel=predict(LDAModelAll,inputData);
    else
        testLabel=predict(LDAModel3,inputData);
    end
end