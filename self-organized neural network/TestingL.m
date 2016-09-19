clear
load('TrainingData.mat')
alabel=ones(length(test_acceptable_array(:,1)),1);
ulabel=zeros(length(test_unacceptable_array(:,1)),1)-1;
for casenum=1:3
    % all recordings
    if casenum==1
        disp('All recordings(CR)')
        inputData=vertcat(test_acceptable_array,test_unacceptable_array);
        label=vertcat(alabel,ulabel);
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