function testLabel=TestingMLP2(Hnode,inputData1,inputData2,inputData3)
    load 'tempData/MLPtrain.mat'
    netCell=MLPnets{1};
    net=netCell{Hnode};
    testLabel1=net(inputData1');
    testLabel1=shiftTestLabelForMLP(testLabel1);
    netCell=MLPnets{2};
    net=netCell{Hnode};
    testLabel2=net(inputData2');
    testLabel2=shiftTestLabelForMLP(testLabel2);
    netCell=MLPnets{3};
    net=netCell{Hnode};
    testLabel3=net(inputData3');
    testLabel3=shiftTestLabelForMLP(testLabel3);
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