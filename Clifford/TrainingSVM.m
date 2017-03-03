function TrainingSVM(DataFile,startRow,endRow,percent)
[IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,label] = importData(DataFile,startRow,endRow,percent);
%balance classes
[IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,label]=bootstrapingData(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,label);

%two classification approaches
for approach=1:4
    %a single classifier trained on all 12 leads combined
    if approach==1
        disp(strcat('approach: ',num2str(approach)));
        inputData=horzcat(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI);
        SVMModelAll = fitcsvm(inputData,label,'Standardize',true,'KernelFunction','RBF','KernelScale','auto');%kernel scale 0.1-8
        CVSVMModel = crossval(SVMModelAll);
        classLoss = kfoldLoss(CVSVMModel);
        disp(1-classLoss)
    %12 separate classifiers trained on the individual leads
    elseif approach==2
        disp(strcat('approach: ',num2str(approach)));
        SVMModels=cell(3,1);
        for lead=1:3
            if lead==1
                inputData=horzcat(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI);
            elseif lead==2
                inputData=horzcat(IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI);
            elseif lead==3
                inputData=horzcat(IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI);
            end
            SVMModel = fitcsvm(inputData,label,'Standardize',true,'KernelFunction','RBF','KernelScale','auto');%kernel scale 0.1-8
            CVSVMModel = crossval(SVMModel);
            classLoss = kfoldLoss(CVSVMModel);
            disp(1-classLoss)
            SVMModels{lead}=SVMModel;
        end
    elseif approach==3
        disp(strcat('approach: ',num2str(approach)));
        inputData=horzcat(IbSQI,IiSQI,IfSQI,IIbSQI,IIiSQI,IIfSQI,IIIbSQI,IIIiSQI,IIIfSQI,AVRbSQI,AVRiSQI,AVRfSQI,AVLbSQI,AVLiSQI,AVLfSQI,AVFbSQI,AVFiSQI,AVFfSQI,V1bSQI,V1iSQI,V1fSQI,V2bSQI,V2iSQI,V2fSQI,V3bSQI,V3iSQI,V3fSQI,V4bSQI,V4iSQI,V4fSQI,V5bSQI,V5iSQI,V5fSQI,V6bSQI,V6iSQI,V6fSQI);
%         inputData=horzcat(IbSQI,IpSQI,IiSQI,IfSQI,IIbSQI,IIpSQI,IIiSQI,IIfSQI,IIIbSQI,IIIpSQI,IIIiSQI,IIIfSQI,AVRbSQI,AVRpSQI,AVRiSQI,AVRfSQI,AVLbSQI,AVLpSQI,AVLiSQI,AVLfSQI,AVFbSQI,AVFpSQI,AVFiSQI,AVFfSQI,V1bSQI,V1pSQI,V1iSQI,V1fSQI,V2bSQI,V2pSQI,V2iSQI,V2fSQI,V3bSQI,V3pSQI,V3iSQI,V3fSQI,V4bSQI,V4pSQI,V4iSQI,V4fSQI,V5bSQI,V5pSQI,V5iSQI,V5fSQI,V6bSQI,V6pSQI,V6iSQI,V6fSQI);
        SVMModel3 = fitcsvm(inputData,label,'Standardize',true,'KernelFunction','RBF','KernelScale','auto');%kernel scale 0.1-8
        CVSVMModel = crossval(SVMModel3);
        classLoss = kfoldLoss(CVSVMModel);
        disp(1-classLoss)
    elseif approach==4
%         disp(strcat('approach: ',num2str(approach)));
%         for SQI=1:6
%             if SQI==1
%                 inputData=horzcat(IiSQI,IIiSQI,IIIiSQI,AVRiSQI,AVLiSQI,AVFiSQI,V1iSQI,V2iSQI,V3iSQI,V4iSQI,V5iSQI,V6iSQI);
%             elseif SQI==2
%                 inputData=horzcat(IbSQI,IIbSQI,IIIbSQI,AVRbSQI,AVLbSQI,AVFbSQI,V1bSQI,V2bSQI,V3bSQI,V4bSQI,V5bSQI,V6iSQI);
%             elseif SQI==3
%                 inputData=horzcat(IpSQI,IIpSQI,IIIpSQI,AVRpSQI,AVLpSQI,AVFpSQI,V1pSQI,V2pSQI,V3pSQI,V4pSQI,V5pSQI,V6pSQI);
%             elseif SQI==4
%                 inputData=horzcat(IsSQI,IIsSQI,IIIsSQI,AVRsSQI,AVLsSQI,AVFsSQI,V1sSQI,V2sSQI,V3sSQI,V4sSQI,V5sSQI,V6sSQI);
%             elseif SQI==5
%                 inputData=horzcat(IkSQI,IIkSQI,IIIkSQI,AVRkSQI,AVLkSQI,AVFkSQI,V1kSQI,V2kSQI,V3kSQI,V4kSQI,V5kSQI,V6kSQI);
%             elseif SQI==6
%                 inputData=horzcat(IfSQI,IIfSQI,IIIfSQI,AVRfSQI,AVLfSQI,AVFfSQI,V1fSQI,V2fSQI,V3fSQI,V4fSQI,V5fSQI,V6fSQI);
%             end
%             SVMModel = fitcsvm(inputData,label,'Standardize',true,'KernelFunction','RBF','KernelScale','auto');%kernel scale 0.1-8
%             CVSVMModel = crossval(SVMModel);
%             classLoss = kfoldLoss(CVSVMModel);
%             disp(1-classLoss)
%         end
    end
end

%% clear temp data
clearvars CVSVMModel SVMModel lead classLoss approach inputData label IiSQI IbSQI IpSQI IsSQI IkSQI IfSQI IIiSQI IIbSQI IIpSQI IIsSQI IIkSQI IIfSQI IIIiSQI IIIbSQI IIIpSQI IIIsSQI IIIkSQI IIIfSQI AVRiSQI AVRbSQI AVRpSQI AVRsSQI AVRkSQI AVRfSQI AVLiSQI AVLbSQI AVLpSQI AVLsSQI AVLkSQI AVLfSQI AVFiSQI AVFbSQI AVFpSQI AVFsSQI AVFkSQI AVFfSQI V1iSQI V1bSQI V1pSQI V1sSQI V1kSQI V1fSQI V2iSQI V2bSQI V2pSQI V2sSQI V2kSQI V2fSQI V3iSQI V3bSQI V3pSQI V3sSQI V3kSQI V3fSQI V4iSQI V4bSQI V4pSQI V4sSQI V4kSQI V4fSQI V5iSQI V5bSQI V5pSQI V5sSQI V5kSQI V5fSQI V6iSQI V6bSQI V6pSQI V6sSQI V6kSQI V6fSQI
save('tempData/SVMtrain');
