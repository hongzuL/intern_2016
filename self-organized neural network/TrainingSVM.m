function TrainingSVM(temp) 
inputData=temp(:,1:length(temp(1,:))-1);
label=temp(:,length(temp(1,:)));
SVMModelAll = fitcsvm(inputData,label,'Standardize',true,'KernelFunction','RBF','KernelScale','auto');%kernel scale 0.1-8
CVSVMModel = crossval(SVMModelAll);
classLoss = kfoldLoss(CVSVMModel);
disp(1-classLoss)
%% clear temp data
clearvars inputData label
save('SVMtrain');
