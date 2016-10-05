function TestingLnest(fullData1,fullData2,fullData3,label)
%1
test_acceptable_array1=fullData1(label==1,:);
test_unacceptable_array1=fullData1(label==-1,:);
%2
test_acceptable_array2=fullData2(label==1,:);
test_unacceptable_array2=fullData2(label==-1,:);
%3
test_acceptable_array3=fullData3(label==1,:);
test_unacceptable_array3=fullData3(label==-1,:);
%
goodlen=length(test_acceptable_array1);
badlen=length(test_unacceptable_array1);
alabel=ones(goodlen,1);
ulabel=zeros(badlen,1)-1;
disp(length(label))
for casenum=1:3
    % all recordings
    if casenum==1
        disp('All recordings(CR)')
        inputData1=fullData1;
        inputData2=fullData2;
        inputData3=fullData3;
    % good recordings
    elseif casenum==2
        disp('Good recordings(SEN)')
        inputData1=test_acceptable_array1;
        inputData2=test_acceptable_array2;
        inputData3=test_acceptable_array3;
        label=alabel;
    % bad recordings
    elseif casenum==3
        disp('Bad recordings(SPE)')
        inputData1=test_unacceptable_array1;
        inputData2=test_unacceptable_array2;
        inputData3=test_unacceptable_array3;
        label=ulabel;
    end
    disp('==============')
    %test with NB
    testLabel=TestingNB2(inputData1,inputData2,inputData3);
    CR = (sum(testLabel == label)/numel(label))*100;
    disp('Naive Bayes:')
    disp(CR)
    %test with SVM
    testLabel=TestingSVM2(inputData1,inputData2,inputData3);
    CR = (sum(testLabel == label)/numel(label))*100;
    disp('Support Vector Machine:')
    disp(CR)
    %test with LDA
    testLabel=TestingLDA2(inputData1,inputData2,inputData3);
    CR = (sum(testLabel == label)/numel(label))*100;
    disp('Linear Discriminant Analysis:')
    disp(CR)
    %test with MLP
    disp('Multi-Layer Perceptron neural network:')
    highestCR=0;
    highestCRnode=0;
    for Hnode=1:28
        testLabel=TestingMLP2(Hnode,inputData1,inputData2,inputData3);
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
