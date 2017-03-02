clear,close all,
userDir = getuserdir();
truePath=strcat(userDir,'\ECG_data\*.csv');
[FileName,PathName] = uigetfile(truePath,'Select a data file');
filename = fullfile(PathName,FileName); 
tic,
level=3;
[input_features,straightLine]=mainAlgorithm(filename,level);
p_label=predictLabel(input_features,straightLine);
disp('predicted label:')
disp(p_label);
toc;