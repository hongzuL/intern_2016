clear,close all,
userDir = getuserdir();
truePath=strcat(userDir,'\ECG_data\*.csv');
[acceptableRecords,unacceptableRecords]=loadLabels(userDir);
[FileName,PathName] = uigetfile(truePath,'Select a data file');
filename = fullfile(PathName,FileName); 
fs=500;%sampling frequency is 500
[input_features,straightLine]=mainAlgorithm(filename,fs);
[bool,name]=isAcceptable(filename,acceptableRecords);
if bool>=1
    input_features=[input_features' 1];
else
    input_features=[input_features' 0];
end
%% clear temp data
clearvars filename FileName PathName straightLine fs name acceptableRecords unacceptableRecords userDir truePath;