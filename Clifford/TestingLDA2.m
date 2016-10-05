function testLabel=TestingLDA2(inputData1,inputData2,inputData3)
    load 'tempData/LDAtrain.mat'
    testLabel1=predict(LDAModels{1},inputData1);
    testLabel2=predict(LDAModels{2},inputData2);
    testLabel3=predict(LDAModels{3},inputData3);
    testLabel=ones(length(testLabel1),1);
    for i=1:length(testLabel1)
        temp=[testLabel1(i) testLabel2(i) testLabel3(i)];
        elements = unique(temp);
        if length(elements)<2
            if elements==-1
                testLabel(i)=-1;
            end
        else
            count = histc(temp,elements);
            if count(1)>=count(2)
                testLabel(i)=-1;
            end
        end
    end