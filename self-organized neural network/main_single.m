clear,close all,
[FileName,PathName] = uigetfile('*.csv','Select a data file');
filename = fullfile(PathName,FileName); 
[input_features,straightLine]=mainAlgorithm(filename,2);