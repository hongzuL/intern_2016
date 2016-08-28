function RQS_filename=QRSdetection(filename)
    userDir = getuserdir();
    filename=strcat(userDir,'\internship2016\Clifford\',filename);
    ECGw = ECGwrapper('recording_name',filename);
    % plot_ecg_strip(ECGw);
    ECGw.ECGtaskHandle='QRS_detection';
    ECGw.ECGtaskHandle.only_ECG_leads=true;
    ECGw.ECGtaskHandle.detectors={'wqrs','epltdqrs1'};
%     ECGw.ECGtaskHandle.detectors={'epltdqrs1'};
    ECGw.cacheResults=false;
    tic;ECGw.Run;toc
    delete(filename);
    [pathstr,name,ext]=fileparts(filename);
	RQS_filename=strcat(name,'_QRS_detection.mat');
    