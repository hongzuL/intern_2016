clear,close all
load 'tempData/tempData_12-Aug-2016.mat'
%% training model
[trueUnacceptable_count,falseUnacceptable_count]=straightLineErr(straigtLine_name,acceptableRecords);
acceptable_count=0;
unacceptable_count=0;
uRecords_name={};
aRecords_name={};
acceptable_array=[];
unacceptable_array=[];
for i=1:temp_count
    [bool,name]=isAcceptable(tempRecords{i},acceptableRecords);
    if bool>=1
        acceptable_count=acceptable_count+1;
        aRecords_name{acceptable_count}=name;
        acceptable_array=[acceptable_array;temp(i,:)];       
    else
        unacceptable_count=unacceptable_count+1;
        uRecords_name{unacceptable_count}=name;
        unacceptable_array=[unacceptable_array;temp(i,:)];  
    end
end
unacceptable_array = datasample(unacceptable_array,acceptable_count,'Replace',true);
clearvars acceptable_count unacceptable_count acceptableRecords aRecords_name bool featureNum i name saveName straigtLine_name temp temp_count tempRecords unacceptableRecords uRecords_name
temp_alabel_train=[];
temp_ulabel_train=[];
R=10;
for l=1:R
    [temp_acceptableLabels,temp_unacceptableLabels,net]=SOMTrain(acceptable_array,unacceptable_array);
    temp_alabel_train=[temp_alabel_train;temp_acceptableLabels'];
    temp_ulabel_train=[temp_ulabel_train;temp_unacceptableLabels'];
end
acceptableLabels=zeros(length(temp_acceptableLabels),1);
unacceptableLabels=zeros(length(temp_unacceptableLabels),1);
for e=1:length(acceptableLabels)
    acceptableLabels(e)=mode(temp_alabel_train(:,e));     
end
for f=1:length(unacceptableLabels)
    unacceptableLabels(f)=mode(temp_ulabel_train(:,f));
end

save('TrainingData')
% cross-validation
% for Kfold=2:10
%     SEN=zeros(Kfold,1);
%     SPE=zeros(Kfold,1);
%     CR=zeros(Kfold,1);
%     a_indices = crossvalind('Kfold',acceptable_array(:,1),Kfold);
%     u_indices = crossvalind('Kfold',unacceptable_array(:,1),Kfold);
%     for i=1:Kfold
%         tp=0;
%         tn=0;
%         fp=0;
%         fn=0;
%         a_test = (a_indices == i); 
%         a_train = ~a_test;
%         u_test = (u_indices == i); 
%         u_train = ~u_test;
%         atraining_data=acceptable_array(a_train,:);
%         atesting_data=acceptable_array(a_test,:);
%         utraining_data=unacceptable_array(u_train,:);
%         utesting_data=unacceptable_array(u_test,:);
% 
%         R=10;
%         temp_alabel_train=[];
%         temp_ulabel_train=[];
%         temp_alabel_test=[];
%         temp_ulabel_test=[];
%         for j=1:R
%             [temp_acceptableLabels_train,temp_unacceptableLabels_train,temp_acceptableLabels_test,temp_unacceptableLabels_test]=SOMcluster(atraining_data,utraining_data,atesting_data,utesting_data);
%             temp_alabel_train=[temp_alabel_train;temp_acceptableLabels_train'];
%             temp_ulabel_train=[temp_ulabel_train;temp_unacceptableLabels_train'];
%             temp_alabel_test=[temp_alabel_test;temp_acceptableLabels_test'];
%             temp_ulabel_test=[temp_ulabel_test;temp_unacceptableLabels_test'];
%         end
%         acceptableLabels_train=zeros(length(temp_acceptableLabels_train),1);
%         unacceptableLabels_train=zeros(length(temp_unacceptableLabels_train),1);
%         acceptableLabels_test=zeros(length(temp_acceptableLabels_test),1);
%         unacceptableLabels_test=zeros(length(temp_unacceptableLabels_test),1);
%         for k=1:length(temp_acceptableLabels_train)
%             acceptableLabels_train(k)=mode(temp_alabel_train(:,k));
%         end
%         for k=1:length(temp_unacceptableLabels_train)
%             unacceptableLabels_train(k)=mode(temp_ulabel_train(:,k));
%         end
%         for h=1:length(acceptableLabels_test)
%             acceptableLabels_test(h)=mode(temp_alabel_test(:,h));     
%         end
%         for g=1:length(unacceptableLabels_test)
%             unacceptableLabels_test(g)=mode(temp_ulabel_test(:,g));
%         end
%         
%         for m=1:length(acceptableLabels_test)
%             acceptableRecord=assignLabels(acceptableLabels_train,unacceptableLabels_train,acceptableLabels_test(m));
%             if acceptableRecord==1
%                 tp=tp+1;
%             else
%                 fn=fn+1;
%             end
%         end
%         for n=1:length(unacceptableLabels_test)
%             acceptableRecord=assignLabels(acceptableLabels_train,unacceptableLabels_train,unacceptableLabels_test(n));
%             if acceptableRecord==1
%                 fp=fp+1;
%             else
%                 tn=tn+1;
%             end
%         end
% 
%         SEN(i)=tp/(tp+fn);
%         SPE(i)=tn/(tn+fp);
%         CR(i)=(tp+tn)/(tp+tn+fp+fn);
%     end
%     y1(Kfold)={SEN'};
%     y2(Kfold)={SPE'};
%     y3(Kfold)={CR'};
% end
% grp=[2*ones(1,2),3*ones(1,3),4*ones(1,4),5*ones(1,5),6*ones(1,6),7*ones(1,7),8*ones(1,8),9*ones(1,9),10*ones(1,10)];
% figure(1),boxplot( [y1{2}, y1{3},y1{4},y1{5},y1{6},y1{7},y1{8},y1{9},y1{10}], grp);
% figure(2),boxplot( [y2{2}, y2{3},y2{4},y2{5},y2{6},y2{7},y2{8},y2{9},y2{10}], grp);
% figure(3),boxplot( [y3{2}, y3{3},y3{4},y3{5},y3{6},y3{7},y3{8},y3{9},y3{10}], grp);