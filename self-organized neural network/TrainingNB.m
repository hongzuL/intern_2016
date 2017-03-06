function TrainingNB(temp)
inputData=temp(:,1:length(temp(1,:))-1);
label=temp(:,length(temp(1,:)));
NBModelAll = fitcnb(inputData,label);
CVNBModel = crossval(NBModelAll);
classLoss = kfoldLoss(CVNBModel);
disp(1-classLoss)
   
%% clear temp data
save('NBtrain');