clear,close all,
[FileName,PathName] = uigetfile('*.csv','Select a data file');
filename = fullfile(PathName,FileName); 
tic,
[input_features,straightLine]=mainAlgorithm(filename,2);
p_label=predictLabel(input_features,straightLine);
toc;