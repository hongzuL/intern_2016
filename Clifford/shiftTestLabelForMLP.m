function testLabel=shiftTestLabelForMLP(testLabel)
    tempLabel=testLabel(1,:)';
    testLabel=ones(length(tempLabel),1);
    for i=1:length(tempLabel)
        if tempLabel(i)<=0.5
            testLabel(i)=-1;
        end
    end