clear,close all,
userDir = getuserdir();
[acceptableRecords,unacceptableRecords]=loadLabels(userDir);
truePath=strcat(userDir,'\ECG_data\data\*.csv');
pathName=strcat(userDir,'\ECG_data\data\');
Files=dir(truePath);
temp=[];
straightLine_count=0;
temp_count=0;
tempRecords={};
straigtLine_name={};
level=2;
featureNum=(2^level)*6;
for i=1:length(Files)
    filename = fullfile(pathName,Files(i).name); 
    s1=num2str((i/length(Files))*100);
    s2='%';
    disp(strcat(s1,s2));
    [abool,name]=isAcceptable(filename,acceptableRecords);
    [ubool,name]=isUnacceptable(filename,unacceptableRecords);
    if abool>=1
        skip=0;
    elseif ubool>=1
        skip=0;
    else
        skip=1;
    end
    if skip==0
        [input_features,straightLine]=mainAlgorithm(filename,level);
        if straightLine==1
            straightLine_count=straightLine_count+1;
            straigtLine_name{straightLine_count}=Files(i).name;
        end
        temp_count=temp_count+1;
        tempRecords{temp_count}=Files(i).name;
        if abool>=1
            input_features=[input_features 1];
        elseif ubool>=1
            input_features=[input_features -1];
        end
        temp=[temp;input_features];
    end
end
d = date;
saveName=strcat('tempData_',d,'level',num2str(level));
clearvars Files level s1 s2 filename input_features straightLine d i featureNum
save(saveName)