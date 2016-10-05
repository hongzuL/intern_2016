clear
[IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,label] = importData('tempData/seta_train_full.csv', 2, 1001,80);
%balance classes
[IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,label]=bootstrapingData(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,label);

labelA=zeros(length(label),1);%acceptable
labelU=zeros(length(label),1);%unacceptable
labelA(label==1)=1;
labelU(label==-1)=1;
label=horzcat(labelA,labelU);
%balance classes
%two classification approaches
for approach=1:4
    %a single classifier trained on all 12 leads combined
    if approach==1
        disp(strcat('approach: ',num2str(approach)));
        inputData=horzcat(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI);
        [netC,performance,percentError]=MLPNN(inputData,label);
        disp(1-min(percentError));
    %12 separate classifiers trained on the individual leads
    elseif approach==2
        disp(strcat('approach: ',num2str(approach)));
        MLPnets=cell(3,1);
        performances=cell(3,1);
        percentErrors=cell(3,1);
        for lead=1:3
            if lead==1
                inputData=horzcat(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI);
            elseif lead==2
                inputData=horzcat(IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI);
            elseif lead==3
                inputData=horzcat(IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI);
            end
            [newnetC,newperformance,newpercentError]=MLPNN(inputData,label);
            MLPnets{lead}=newnetC;
            performances{lead}=newperformance;
            percentErrors{lead}=newpercentError;
            disp(1-min(newpercentError));
        end
    elseif approach==3
        disp(strcat('approach: ',num2str(approach)));
        inputData=horzcat(IbSQI,IiSQI,IfSQI,IIbSQI,IIiSQI,IIfSQI,IIIbSQI,IIIiSQI,IIIfSQI,AVRbSQI,AVRiSQI,AVRfSQI,AVLbSQI,AVLiSQI,AVLfSQI,AVFbSQI,AVFiSQI,AVFfSQI,V1bSQI,V1iSQI,V1fSQI,V2bSQI,V2iSQI,V2fSQI,V3bSQI,V3iSQI,V3fSQI,V4bSQI,V4iSQI,V4fSQI,V5bSQI,V5iSQI,V5fSQI,V6bSQI,V6iSQI,V6fSQI);
%         inputData=horzcat(IbSQI,IpSQI,IiSQI,IfSQI,IIbSQI,IIpSQI,IIiSQI,IIfSQI,IIIbSQI,IIIpSQI,IIIiSQI,IIIfSQI,AVRbSQI,AVRpSQI,AVRiSQI,AVRfSQI,AVLbSQI,AVLpSQI,AVLiSQI,AVLfSQI,AVFbSQI,AVFpSQI,AVFiSQI,AVFfSQI,V1bSQI,V1pSQI,V1iSQI,V1fSQI,V2bSQI,V2pSQI,V2iSQI,V2fSQI,V3bSQI,V3pSQI,V3iSQI,V3fSQI,V4bSQI,V4pSQI,V4iSQI,V4fSQI,V5bSQI,V5pSQI,V5iSQI,V5fSQI,V6bSQI,V6pSQI,V6iSQI,V6fSQI);
%         inputData=horzcat(IbSQI,IpSQI,IkSQI,IfSQI,IIbSQI,IIpSQI,IIkSQI,IIfSQI,IIIbSQI,IIIpSQI,IIIkSQI,IIIfSQI,AVRbSQI,AVRpSQI,AVRkSQI,AVRfSQI,AVLbSQI,AVLpSQI,AVLkSQI,AVLfSQI,AVFbSQI,AVFpSQI,AVFkSQI,AVFfSQI,V1bSQI,V1pSQI,V1kSQI,V1fSQI,V2bSQI,V2pSQI,V2kSQI,V2fSQI,V3bSQI,V3pSQI,V3kSQI,V3fSQI,V4bSQI,V4pSQI,V4kSQI,V4fSQI,V5bSQI,V5pSQI,V5kSQI,V5fSQI,V6bSQI,V6pSQI,V6kSQI,V6fSQI);
        [netC3,performance3,percentError3]=MLPNN(inputData,label);
        disp(1-min(percentError3));
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
%             [newnetC,newperformance,newpercentError]=MLPNN(inputData,label);
%             disp(1-min(newpercentError));
%         end
    end
end

%% clear temp data
clearvars newpercentError newperformance newnetC approach lead inputData label labelA labelU IiSQI IbSQI IpSQI IsSQI IkSQI IfSQI IIiSQI IIbSQI IIpSQI IIsSQI IIkSQI IIfSQI IIIiSQI IIIbSQI IIIpSQI IIIsSQI IIIkSQI IIIfSQI AVRiSQI AVRbSQI AVRpSQI AVRsSQI AVRkSQI AVRfSQI AVLiSQI AVLbSQI AVLpSQI AVLsSQI AVLkSQI AVLfSQI AVFiSQI AVFbSQI AVFpSQI AVFsSQI AVFkSQI AVFfSQI V1iSQI V1bSQI V1pSQI V1sSQI V1kSQI V1fSQI V2iSQI V2bSQI V2pSQI V2sSQI V2kSQI V2fSQI V3iSQI V3bSQI V3pSQI V3sSQI V3kSQI V3fSQI V4iSQI V4bSQI V4pSQI V4sSQI V4kSQI V4fSQI V5iSQI V5bSQI V5pSQI V5sSQI V5kSQI V5fSQI V6iSQI V6bSQI V6pSQI V6sSQI V6kSQI V6fSQI
save('tempData/MLPtrain');