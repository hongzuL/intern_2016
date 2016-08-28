clear
userDir = getuserdir();
truePath=strcat(userDir,'\ECG_data\testdat\*.dat');
[FileName,PathName] = uigetfile(truePath,'Select a data file');
filename = fullfile(PathName,FileName); 
wfdb2mat(filename);
[tm,signal,Fs,labels]=rdmat('1005639');