function [input_features,straightLine]=mainAlgorithm(filename,fs)
    input_features=zeros(72,1);
    straightLine=0;
    delimiter = ',';
    startRow = 2;
    %% get the format for every column
    %   row1-row13: double (%f)
    formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

    %% open file
    fileID = fopen(filename,'r');

    %% read data according to file extension
    dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);

    %% close file
    fclose(fileID);

    %% put data into arrays
    TIME_ABSOLUTE = dataArray{:, 1};
    MDC_ECG_LEAD_I = dataArray{:, 2};
    MDC_ECG_LEAD_II = dataArray{:, 3};
    MDC_ECG_LEAD_III = dataArray{:, 4};
    MDC_ECG_LEAD_AVR = dataArray{:, 5};
    MDC_ECG_LEAD_AVL = dataArray{:, 6};
    MDC_ECG_LEAD_AVF = dataArray{:, 7};
    MDC_ECG_LEAD_V1 = dataArray{:, 8};
    MDC_ECG_LEAD_V2 = dataArray{:, 9};
    MDC_ECG_LEAD_V3 = dataArray{:, 10};
    MDC_ECG_LEAD_V4 = dataArray{:, 11};
    MDC_ECG_LEAD_V5 = dataArray{:, 12};
    MDC_ECG_LEAD_V6 = dataArray{:, 13};
    
%     figure(1),plot(MDC_ECG_LEAD_I);
    %% signal pre-processing
    userDir = getuserdir();
    [I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME]=preProcessing(TIME_ABSOLUTE,MDC_ECG_LEAD_I,MDC_ECG_LEAD_II,MDC_ECG_LEAD_III,MDC_ECG_LEAD_AVR,MDC_ECG_LEAD_AVL,MDC_ECG_LEAD_AVF,MDC_ECG_LEAD_V1,MDC_ECG_LEAD_V2,MDC_ECG_LEAD_V3,MDC_ECG_LEAD_V4,MDC_ECG_LEAD_V5,MDC_ECG_LEAD_V6);
    len_sum=isStraghtline(I,TIME)+isStraghtline(II,TIME)+isStraghtline(III,TIME)+isStraghtline(AVR,TIME)+isStraghtline(AVL,TIME)+isStraghtline(AVF,TIME)+isStraghtline(V1,TIME)+isStraghtline(V2,TIME)+isStraghtline(V3,TIME)+isStraghtline(V4,TIME)+isStraghtline(V5,TIME)+isStraghtline(V6,TIME);
    straightLine=len_sum;
    [pathstr,name,ext]=fileparts(filename);
    saveFolder='\internship2016\CombineAlgorithm\tmpQRS\';
%     % save .mat file
%     ECG=horzcat(I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6);
%     nsamp=length(TIME);
%     nsig=12;
%     desc=char({'I';'II';'III';'aVR';'aVF';'aVL';'V1';'V2';'V3';'V4';'V5';'V6'});
%     heasig=struct('recname',name,'nsig',nsig,'freq',fs,'nsamp',nsamp,'desc',desc);     
%     save(strcat(userDir,saveFolder,name),'ECG','heasig');
%     fullname=strcat(name,'.mat');
%     % QRS detection
%     truePath=strcat(userDir,saveFolder,fullname);
%     RQS_filename=QRSdetection(truePath);
    % load QRS data
    RQS_filename=strcat(userDir,saveFolder,name,'_QRS_detection.mat');
    load(RQS_filename);
    disp(RQS_filename)
    % calculate the features for each lead
    fi=0;
    [iSQI,bSQI,pSQI,sSQI,kSQI,fSQI]=calculateFeatures(fs,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,wqrs_I,wqrs_II,wqrs_III,wqrs_aVF,wqrs_aVL,wqrs_aVR,wqrs_V1,wqrs_V2,wqrs_V3,wqrs_V4,wqrs_V5,wqrs_V6,1);
    features=[iSQI,bSQI,pSQI,sSQI,kSQI,fSQI];
    for i=1:6
        input_features(fi+i)=features(i);
    end
    fi=fi+6;
    [iSQI,bSQI,pSQI,sSQI,kSQI,fSQI]=calculateFeatures(fs,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,wqrs_I,wqrs_II,wqrs_III,wqrs_aVF,wqrs_aVL,wqrs_aVR,wqrs_V1,wqrs_V2,wqrs_V3,wqrs_V4,wqrs_V5,wqrs_V6,2);
        features=[iSQI,bSQI,pSQI,sSQI,kSQI,fSQI];
    for i=1:6
        input_features(fi+i)=features(i);
    end
    fi=fi+6;
    [iSQI,bSQI,pSQI,sSQI,kSQI,fSQI]=calculateFeatures(fs,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,wqrs_I,wqrs_II,wqrs_III,wqrs_aVF,wqrs_aVL,wqrs_aVR,wqrs_V1,wqrs_V2,wqrs_V3,wqrs_V4,wqrs_V5,wqrs_V6,3);
        features=[iSQI,bSQI,pSQI,sSQI,kSQI,fSQI];
    for i=1:6
        input_features(fi+i)=features(i);
    end
    fi=fi+6;
    [iSQI,bSQI,pSQI,sSQI,kSQI,fSQI]=calculateFeatures(fs,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,wqrs_I,wqrs_II,wqrs_III,wqrs_aVF,wqrs_aVL,wqrs_aVR,wqrs_V1,wqrs_V2,wqrs_V3,wqrs_V4,wqrs_V5,wqrs_V6,4);
        features=[iSQI,bSQI,pSQI,sSQI,kSQI,fSQI];
    for i=1:6
        input_features(fi+i)=features(i);
    end
    fi=fi+6;
    [iSQI,bSQI,pSQI,sSQI,kSQI,fSQI]=calculateFeatures(fs,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,wqrs_I,wqrs_II,wqrs_III,wqrs_aVF,wqrs_aVL,wqrs_aVR,wqrs_V1,wqrs_V2,wqrs_V3,wqrs_V4,wqrs_V5,wqrs_V6,5);
        features=[iSQI,bSQI,pSQI,sSQI,kSQI,fSQI];
    for i=1:6
        input_features(fi+i)=features(i);
    end
    fi=fi+6;
    [iSQI,bSQI,pSQI,sSQI,kSQI,fSQI]=calculateFeatures(fs,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,wqrs_I,wqrs_II,wqrs_III,wqrs_aVF,wqrs_aVL,wqrs_aVR,wqrs_V1,wqrs_V2,wqrs_V3,wqrs_V4,wqrs_V5,wqrs_V6,6);
        features=[iSQI,bSQI,pSQI,sSQI,kSQI,fSQI];
    for i=1:6
        input_features(fi+i)=features(i);
    end
    fi=fi+6;
    [iSQI,bSQI,pSQI,sSQI,kSQI,fSQI]=calculateFeatures(fs,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,wqrs_I,wqrs_II,wqrs_III,wqrs_aVF,wqrs_aVL,wqrs_aVR,wqrs_V1,wqrs_V2,wqrs_V3,wqrs_V4,wqrs_V5,wqrs_V6,7);
        features=[iSQI,bSQI,pSQI,sSQI,kSQI,fSQI];
    for i=1:6
        input_features(fi+i)=features(i);
    end
    fi=fi+6;
    [iSQI,bSQI,pSQI,sSQI,kSQI,fSQI]=calculateFeatures(fs,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,wqrs_I,wqrs_II,wqrs_III,wqrs_aVF,wqrs_aVL,wqrs_aVR,wqrs_V1,wqrs_V2,wqrs_V3,wqrs_V4,wqrs_V5,wqrs_V6,8);
        features=[iSQI,bSQI,pSQI,sSQI,kSQI,fSQI];
    for i=1:6
        input_features(fi+i)=features(i);
    end
    fi=fi+6;
    [iSQI,bSQI,pSQI,sSQI,kSQI,fSQI]=calculateFeatures(fs,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,wqrs_I,wqrs_II,wqrs_III,wqrs_aVF,wqrs_aVL,wqrs_aVR,wqrs_V1,wqrs_V2,wqrs_V3,wqrs_V4,wqrs_V5,wqrs_V6,9);
        features=[iSQI,bSQI,pSQI,sSQI,kSQI,fSQI];
    for i=1:6
        input_features(fi+i)=features(i);
    end
    fi=fi+6;
    [iSQI,bSQI,pSQI,sSQI,kSQI,fSQI]=calculateFeatures(fs,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,wqrs_I,wqrs_II,wqrs_III,wqrs_aVF,wqrs_aVL,wqrs_aVR,wqrs_V1,wqrs_V2,wqrs_V3,wqrs_V4,wqrs_V5,wqrs_V6,10);
        features=[iSQI,bSQI,pSQI,sSQI,kSQI,fSQI];
    for i=1:6
        input_features(fi+i)=features(i);
    end
    fi=fi+6;
    [iSQI,bSQI,pSQI,sSQI,kSQI,fSQI]=calculateFeatures(fs,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,wqrs_I,wqrs_II,wqrs_III,wqrs_aVF,wqrs_aVL,wqrs_aVR,wqrs_V1,wqrs_V2,wqrs_V3,wqrs_V4,wqrs_V5,wqrs_V6,11);
        features=[iSQI,bSQI,pSQI,sSQI,kSQI,fSQI];
    for i=1:6
        input_features(fi+i)=features(i);
    end
    fi=fi+6;
    [iSQI,bSQI,pSQI,sSQI,kSQI,fSQI]=calculateFeatures(fs,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,wqrs_I,wqrs_II,wqrs_III,wqrs_aVF,wqrs_aVL,wqrs_aVR,wqrs_V1,wqrs_V2,wqrs_V3,wqrs_V4,wqrs_V5,wqrs_V6,12);
        features=[iSQI,bSQI,pSQI,sSQI,kSQI,fSQI];
    for i=1:6
        input_features(fi+i)=features(i);
    end
%     delete(RQS_filename);
    %% clear temp data
    clearvars filename delimiter startRow formatSpec fileID dataArray ans;
