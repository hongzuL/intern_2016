function [acceptableRecords,unacceptableRecords]=loadLabels()
%     [FileName,PathName] = uigetfile('*.*','Select acceptable records file');
%     filename = fullfile(PathName,FileName);

    filename='C:\Users\HONGZU\Documents\ECG_data\data\RECORDS-acceptable';
    acceptableRecords=loadLabelFile(filename);
%     [FileName,PathName] = uigetfile('*.*','Select unacceptable reocrds file');
%     filename = fullfile(PathName,FileName); 
    filename='C:/Users/HONGZU/Documents/ECG_data\data/RECORDS-unacceptable';
    unacceptableRecords=loadLabelFile(filename);
