clear,close all,
userDir = getuserdir();
% truePath=strcat(userDir,'\ECG_data\data\*.csv');
% pathName=strcat(userDir,'\ECG_data\data\');
truePath=strcat(userDir,'\internship2016\Tools\OurECGdata\*.csv');
pathName=strcat(userDir,'\internship2016\Tools\OurECGdata\');
[acceptableRecords,unacceptableRecords]=loadLabels(userDir);
Files=dir(truePath);
fs=500;%sampling frequency is 500
skip=0;
rerun_array=loadRerun();
for i=1:length(Files)
    filename = fullfile(pathName,Files(i).name); 
    s1=num2str((i/length(Files))*100);
    s2='%';
    disp(strcat(s1,s2));
    [abool,name]=isAcceptable(filename,acceptableRecords);
    [ubool,name]=isUnacceptable(filename,unacceptableRecords);
%     disp(name);
    % there are two files missing
    if abool>=1
        skip=0;
%         dst=strcat(userDir,'\ECG_data\goodECG\');
%         copyfile(filename,dst);
%         copyfile(strcat(pathName,name,'_QRS_detection.mat'),dst);
%         copyfile(strcat(pathName,name,'.dat'),dst);
%         copyfile(strcat(pathName,name,'.hea'),dst);
    elseif ubool>=1
        skip=0;
    else
        skip=1;
    end
%     
%     if(ismember(name,rerun_array)>=1)
%         skip=0;
%     else
%         skip=1;
%     end
    if skip==0
        [input_features,straightLine]=mainAlgorithm(filename,fs);
        input_features=input_features';
        if abool>=1
            input_features=[input_features 1];
        elseif ubool>=1
            input_features=[input_features -1];
        end
        save(strcat('tmpInputfeatures/',name,'_InputFeatures'),'input_features');
    end
end
NumOfFiles = length(Files);
save('NumOfFiles.mat','NumOfFiles')
% multiTest(writeFile);
%% clear temp data
clearvars truePath userDir filename FileName pathName straightLine fs name  unacceptableRecords fileID ISQI IISQI IIISQI AVRSQI AVLSQI AVFSQI V1SQI V2SQI V3SQI V4SQI V5SQI V6SQI label bool Files i j s1 s2 ans;