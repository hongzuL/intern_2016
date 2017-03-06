function TrainingLDA(temp)
inputData=temp(:,1:length(temp(1,:))-1);
label=temp(:,length(temp(1,:)));
LDAModelAll = fitcdiscr(inputData,label);
CVLDAModel = crossval(LDAModelAll);
classLoss = kfoldLoss(CVLDAModel);
disp(1-classLoss)
%% clear temp data
save('LDAtrain');