function RQS_filename=QRSdetection(filename)

    ECGw = ECGwrapper('recording_name',filename);
    plot_ecg_strip(ECGw);
    ECGw.ECGtaskHandle='QRS_detection';
    ECGw.ECGtaskHandle.only_ECG_leads=true;
    ECGw.ECGtaskHandle.detectors={'wqrs','epltdqrs1'};
    
%     ECGw.ECGtaskHandle.detectors={'wqrs'};
    ECGw.cacheResults=false;
    tic;ECGw.Run;toc
    delete(filename);
    [pathstr,name,ext]=fileparts(filename);
	RQS_filename=strcat(name,'_QRS_detection.mat');
    