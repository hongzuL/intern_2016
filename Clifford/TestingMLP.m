function testLabel=TestingMLP(Hnode,IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,approach)
    load 'tempData/MLPtrain.mat'
    if approach==1
        net=netC{Hnode};
        inputData=horzcat(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI);
        testLabel = net(inputData');
        testLabel=shiftTestLabelForMLP(testLabel);
    elseif approach==2
        for lead=1:12
            if lead==1
                netCell=MLPnets{lead};
                net=netCell{Hnode};
                inputData=horzcat(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI);
                testLabel1=net(inputData');
                testLabel1=shiftTestLabelForMLP(testLabel1);
            elseif lead==2
                netCell=MLPnets{lead};
                net=netCell{Hnode};
                inputData=horzcat(IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI);
                testLabel2=net(inputData');
                testLabel2=shiftTestLabelForMLP(testLabel2);
            elseif lead==3
                netCell=MLPnets{lead};
                net=netCell{Hnode};
                inputData=horzcat(IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI);
                testLabel3=net(inputData');
                testLabel3=shiftTestLabelForMLP(testLabel3);
            end
        end
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
    elseif approach==3
        net=netC3{Hnode};
        inputData=horzcat(IbSQI,IiSQI,IfSQI,IIbSQI,IIiSQI,IIfSQI,IIIbSQI,IIIiSQI,IIIfSQI,AVRbSQI,AVRiSQI,AVRfSQI,AVLbSQI,AVLiSQI,AVLfSQI,AVFbSQI,AVFiSQI,AVFfSQI,V1bSQI,V1iSQI,V1fSQI,V2bSQI,V2iSQI,V2fSQI,V3bSQI,V3iSQI,V3fSQI,V4bSQI,V4iSQI,V4fSQI,V5bSQI,V5iSQI,V5fSQI,V6bSQI,V6iSQI,V6fSQI);
%         inputData=horzcat(IbSQI,IpSQI,IkSQI,IfSQI,IIbSQI,IIpSQI,IIkSQI,IIfSQI,IIIbSQI,IIIpSQI,IIIkSQI,IIIfSQI,AVRbSQI,AVRpSQI,AVRkSQI,AVRfSQI,AVLbSQI,AVLpSQI,AVLkSQI,AVLfSQI,AVFbSQI,AVFpSQI,AVFkSQI,AVFfSQI,V1bSQI,V1pSQI,V1kSQI,V1fSQI,V2bSQI,V2pSQI,V2kSQI,V2fSQI,V3bSQI,V3pSQI,V3kSQI,V3fSQI,V4bSQI,V4pSQI,V4kSQI,V4fSQI,V5bSQI,V5pSQI,V5kSQI,V5fSQI,V6bSQI,V6pSQI,V6kSQI,V6fSQI);
        testLabel = net(inputData');
        testLabel=shiftTestLabelForMLP(testLabel);
    end