function QRSdetection(filename)
    ECGw=ECGwrapper('recording_name',filename,'ECGtaskHandle','QRS_detection');
    ECGw.ECGtaskHandle.only_ECG_leads=true;
    ECGw.ECGtaskHandle.detectors={'wqrs','epltdqrs1'};
    ECGw.cacheResults = false;
    ECGw.Run;
    