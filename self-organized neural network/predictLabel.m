function p_label=predictLabel(input_features,straightLine)
    inputData=input_features;
    p_label=0;
    if straightLine==1
        p_label=-1;
    else
        disp('==============')
        %test with NB
        testLabel=TestingNB(inputData);
        p_label=p_label+testLabel;
        disp('Naive Bayes:')
        disp(testLabel)
        %test with SVM
        testLabel=TestingSVM(inputData);
        p_label=p_label+testLabel;
        disp('Support Vector Machine:')
        disp(testLabel)
        %test with LDA
        testLabel=TestingLDA(inputData);
        p_label=p_label+testLabel;
        disp('Linear Discriminant Analysis:')
        disp(testLabel)
        %test with MLP
        disp('Multi-Layer Perceptron neural network:')
        MPlabelcount=0;
        for Hnode=1:28
            testLabel=TestingMLP(Hnode,inputData);
            MPlabelcount=MPlabelcount+testLabel;
        end
        if MPlabelcount>0
            testLabel=1;
        elseif MPlabelcount<0
            testLabel=-1;
        else
            testLabel=0;
        end
        p_label=p_label+testLabel;
        disp(testLabel)
        disp('==============')
        if p_label>0
            p_label=1;
        else
            p_label=-1;
        end
    end