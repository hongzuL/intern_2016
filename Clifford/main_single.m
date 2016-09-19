clear,close all,
userDir = getuserdir();
truePath=strcat(userDir,'\ECG_data\Ourdata\*.csv');
[acceptableRecords,unacceptableRecords]=loadLabels(userDir);
[FileName,PathName] = uigetfile(truePath,'Select a data file');
filename = fullfile(PathName,FileName); 
fs=500;%sampling frequency is 500
[input_features,straightLine]=mainAlgorithm(filename,fs);
[abool,name]=isAcceptable(filename,acceptableRecords);
[ubool,name]=isUnacceptable(filename,unacceptableRecords);
input_features=input_features';
if abool>=1
    input_features=[input_features 1];
elseif ubool>=1
    input_features=[input_features -1];
else
    input_features=[input_features 0];
end
% singleTest(input_features);
%% clear temp data
clearvars filename FileName PathName straightLine fs name acceptableRecords unacceptableRecords userDir truePath;