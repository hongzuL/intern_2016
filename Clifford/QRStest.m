clear
ECGw = ECGwrapper('recording_name','testdat/1005639');
plot_ecg_strip(ECGw);
ECGw.ECGtaskHandle='QRS_detection';
ECGw.ECGtaskHandle.only_ECG_leads=true;
ECGw.ECGtaskHandle.detectors={'wqrs','epltdqrs1'};
ECGw.cacheResults=false;
tic;ECGw.Run;toc