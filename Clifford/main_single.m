clear,close all,
[acceptableRecords,unacceptableRecords]=loadLabels();
[FileName,PathName] = uigetfile('C:/Users/HONGZU/Documents/ECG_data/*.csv','Select a data file');
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
clearvars filename FileName PathName straightLine fs name acceptableRecords unacceptableRecords;