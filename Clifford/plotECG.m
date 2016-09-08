clear,close all,
userDir = getuserdir();
truePath=strcat(userDir,'\ECG_data\goodECG\*.dat');
pathName=strcat(userDir,'\ECG_data\goodECG\');
[acceptableRecords,unacceptableRecords]=loadLabels(userDir);
Files=dir(truePath);
for i=1:length(Files)
    filename = fullfile(pathName,Files(i).name); 
    [pathstr,name,ext]=fileparts(filename);
    ECGw = ECGwrapper('recording_name',filename);
    plot_ecg_strip(ECGw);
    saveas(gcf,strcat(userDir,'\ECG_data\goodECGfig\',name,'.png'));
end

