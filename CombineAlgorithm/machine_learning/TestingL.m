clear
filename = 'C:\Users\Hongzu\Documents\internship2016\CombineAlgorithm\tempData\setA.csv';
[RR1,DET1,LMAX1,ENT1,LAM1,TT1,RR2,DET2,LMAX2,ENT2,LAM2,TT2,RR3,DET3,LMAX3,ENT3,LAM3,TT3,RR4,DET4,LMAX4,ENT4,LAM4,TT4,IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,label] = importfile(filename);
fullData=horzcat(RR1,DET1,LMAX1,ENT1,LAM1,TT1,RR2,DET2,LMAX2,ENT2,LAM2,TT2,RR3,DET3,LMAX3,ENT3,LAM3,TT3,RR4,DET4,LMAX4,ENT4,LAM4,TT4,IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI);
test_acceptable_array=fullData(label==1,:);
test_unacceptable_array=fullData(label==-1,:);
alabel=ones(length(test_acceptable_array(:,1)),1);
ulabel=zeros(length(test_unacceptable_array(:,1)),1)-1;
for casenum=1:3
    % all recordings
    if casenum==1
        disp('All recordings(CR)')
        inputData=fullData;
    % good recordings
    elseif casenum==2
        disp('Good recordings(SEN)')
        inputData=test_acceptable_array;
        label=alabel;
    % bad recordings
    elseif casenum==3
        disp('Bad recordings(SPE)')
        inputData=test_unacceptable_array;
        label=ulabel;
    end
    disp('==============')
    %test with NB
    testLabel=TestingNB(inputData);
    CR = (sum(testLabel == label)/numel(label))*100;
    disp('Naive Bayes:')
    disp(CR)
    %test with SVM
    testLabel=TestingSVM(inputData);
    CR = (sum(testLabel == label)/numel(label))*100;
    disp('Support Vector Machine:')
    disp(CR)
    %test with LDA
    testLabel=TestingLDA(inputData);
    CR = (sum(testLabel == label)/numel(label))*100;
    disp('Linear Discriminant Analysis:')
    disp(CR)
    %test with MLP
    disp('Multi-Layer Perceptron neural network:')
    highestCR=0;
    highestCRnode=0;
    for Hnode=1:28
        testLabel=TestingMLP(Hnode,inputData);
        CR = (sum(testLabel == label)/numel(label))*100;
        if CR>highestCR
            highestCR=CR;
            highestCRnode=Hnode;
        end
    end
    highestCR=strcat(num2str(highestCR),' (',num2str(highestCRnode+2),' hidden nodes)');
    disp(highestCR)
    disp('==============')
end