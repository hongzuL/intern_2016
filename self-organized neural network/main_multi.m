clear,close all,
[acceptableRecords,unacceptableRecords]=loadLabels();
Files=dir('data/*.csv');
temp=[];
straightLine_count=0;
temp_count=0;
tempRecords={};
straigtLine_name={};
level=2;
featureNum=(2^level)*6;
for i=1:length(Files)
    filename = fullfile('data',Files(i).name); 
    s1=num2str((i/length(Files))*100);
    s2='%';
    disp(strcat(s1,s2));
    [input_features,straightLine]=mainAlgorithm(filename,level);
    if straightLine==1
        straightLine_count=straightLine_count+1;
        straigtLine_name{straightLine_count}=Files(i).name;
    else
        temp_count=temp_count+1;
        tempRecords{temp_count}=Files(i).name;
        temp=[temp;input_features];
    end
end
d = date;
saveName=strcat('tempData_',d,'level',level);
clearvars Files level s1 s2 filename input_features straightLine d i featureNum
save(saveName)