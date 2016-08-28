clear
userDir = getuserdir();
truePath=strcat(userDir,'\internship2016\Clifford\*.mat');
[FileName,PathName] = uigetfile(truePath,'Select a data file');
filename = fullfile(PathName,FileName); 
ECGw = ECGwrapper('recording_name',filename);
% plot_ecg_strip(ECGw);
ECGw.ECGtaskHandle='QRS_detection';
ECGw.ECGtaskHandle.only_ECG_leads=true;
% ECGw.ECGtaskHandle.detectors={'wqrs','epltdqrs1'};
ECGw.ECGtaskHandle.detectors={'epltdqrs1'};
ECGw.cacheResults=false;
tic;ECGw.Run;toc
delete(filename);
[pathstr,name,ext]=fileparts(filename);
delete(strcat(name,'_QRS_detection.mat'));