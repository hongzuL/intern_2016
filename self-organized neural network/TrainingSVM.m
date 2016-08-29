clear 
load('tempData/TrainingData.mat')
SVMModelAll = fitcsvm(inputData,label,'Standardize',true,'KernelFunction','RBF','KernelScale','auto');%kernel scale 0.1-8
CVSVMModel = crossval(SVMModelAll);
classLoss = kfoldLoss(CVSVMModel);
disp(1-classLoss)
%% clear temp data
clearvars CVSVMModel SVMModel lead classLoss approach inputData label IiSQI IbSQI IpSQI IsSQI IkSQI IfSQI IIiSQI IIbSQI IIpSQI IIsSQI IIkSQI IIfSQI IIIiSQI IIIbSQI IIIpSQI IIIsSQI IIIkSQI IIIfSQI AVRiSQI AVRbSQI AVRpSQI AVRsSQI AVRkSQI AVRfSQI AVLiSQI AVLbSQI AVLpSQI AVLsSQI AVLkSQI AVLfSQI AVFiSQI AVFbSQI AVFpSQI AVFsSQI AVFkSQI AVFfSQI V1iSQI V1bSQI V1pSQI V1sSQI V1kSQI V1fSQI V2iSQI V2bSQI V2pSQI V2sSQI V2kSQI V2fSQI V3iSQI V3bSQI V3pSQI V3sSQI V3kSQI V3fSQI V4iSQI V4bSQI V4pSQI V4sSQI V4kSQI V4fSQI V5iSQI V5bSQI V5pSQI V5sSQI V5kSQI V5fSQI V6iSQI V6bSQI V6pSQI V6sSQI V6kSQI V6fSQI
save('SVMtrain');
