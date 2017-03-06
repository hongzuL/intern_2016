function TrainingMLP(temp)
inputData=temp(:,1:length(temp(1,:))-1);
label=temp(:,length(temp(1,:)));
labelA=zeros(length(label),1);%acceptable
labelU=zeros(length(label),1);%unacceptable
labelA(label==1)=1;
labelU(label==-1)=1;
label=horzcat(labelA,labelU);
[netC,performance,percentError]=MLPNN(inputData,label);
disp(1-min(percentError));
%% clear temp data
clearvars inputData label
save('MLPtrain');