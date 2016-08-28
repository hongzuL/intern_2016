clear,close all
load 'tempData_12-Aug-2016.mat'
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
%bootstrapping
unacceptable_array = datasample(unacceptable_array,acceptable_count,'Replace',true);
Alabel=ones(length(acceptable_array),1);
Ulabel=Alabel*(-1);
label=vertcat(Alabel,Ulabel);
inputData=vertcat(acceptable_array,unacceptable_array);
clearvars acceptableRecords aRecords_name bool featureNum i name saveName straigtLine_name temp temp_count tempRecords unacceptableRecords uRecords_name
save('TrainingData')