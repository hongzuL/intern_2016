clear
[IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,label] = importData('tempData/seta_train_full.csv', 2, 1001,20);
% different apporaches
for approach=1:3
    if approach==1
        disp('Aproach 1')
        fullData=horzcat(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI);
    elseif approach==2
        disp('Approach 2')
        fullData1=horzcat(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI);
        fullData2=horzcat(IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI);
        fullData3=horzcat(IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI);
        TestingLnest(fullData1,fullData2,fullData3,label);
    elseif approach==3
        disp('Approach 3')
        fullData=horzcat(IbSQI,IiSQI,IfSQI,IIbSQI,IIiSQI,IIfSQI,IIIbSQI,IIIiSQI,IIIfSQI,AVRbSQI,AVRiSQI,AVRfSQI,AVLbSQI,AVLiSQI,AVLfSQI,AVFbSQI,AVFiSQI,AVFfSQI,V1bSQI,V1iSQI,V1fSQI,V2bSQI,V2iSQI,V2fSQI,V3bSQI,V3iSQI,V3fSQI,V4bSQI,V4iSQI,V4fSQI,V5bSQI,V5iSQI,V5fSQI,V6bSQI,V6iSQI,V6fSQI);
    end
    if approach~=2
        test_acceptable_array=fullData(label==1,:);
        test_unacceptable_array=fullData(label==-1,:);
        alabel=ones(length(test_acceptable_array(:,1)),1);
        ulabel=zeros(length(test_unacceptable_array(:,1)),1)-1;
        for casenum=1:3
            % all recordings
            if casenum==1
                disp('All recordings(CR)')
                inputData=fullData;
                tempLabel=label;
            % good recordings
            elseif casenum==2
                disp('Good recordings(SEN)')
                inputData=test_acceptable_array;
                tempLabel=alabel;
            % bad recordings
            elseif casenum==3
                disp('Bad recordings(SPE)')
                inputData=test_unacceptable_array;
                tempLabel=ulabel;
            end
            disp('==============')
            %test with NB
            testLabel=TestingNB(inputData);
            CR = (sum(testLabel == tempLabel)/numel(tempLabel))*100;
            disp('Naive Bayes:')
            disp(CR)
            %test with SVM
            testLabel=TestingSVM(inputData);
            CR = (sum(testLabel == tempLabel)/numel(tempLabel))*100;
            disp('Support Vector Machine:')
            disp(CR)
            %test with LDA
            testLabel=TestingLDA(inputData);
            CR = (sum(testLabel == tempLabel)/numel(tempLabel))*100;
            disp('Linear Discriminant Analysis:')
            disp(CR)
            %test with MLP
            disp('Multi-Layer Perceptron neural network:')
            highestCR=0;
            highestCRnode=0;
            for Hnode=1:28
                testLabel=TestingMLP(Hnode,inputData);
                CR = (sum(testLabel == tempLabel)/numel(tempLabel))*100;
                if CR>highestCR
                    highestCR=CR;
                    highestCRnode=Hnode;
                end
            end
            highestCR=strcat(num2str(highestCR),' (',num2str(highestCRnode+2),' hidden nodes)');
            disp(highestCR)
            disp('==============')
        end
    end
end