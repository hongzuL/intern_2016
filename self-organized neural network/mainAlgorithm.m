function [input_features,straghtLine]=mainAlgorithm(filename,level)
    input_features=0;
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
    %% clear temp data
    clearvars filename delimiter startRow formatSpec fileID dataArray ans;
    %% signal pre-processing
    [I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME]=preProcessing(TIME_ABSOLUTE,MDC_ECG_LEAD_I,MDC_ECG_LEAD_II,MDC_ECG_LEAD_III,MDC_ECG_LEAD_AVR,MDC_ECG_LEAD_AVL,MDC_ECG_LEAD_AVF,MDC_ECG_LEAD_V1,MDC_ECG_LEAD_V2,MDC_ECG_LEAD_V3,MDC_ECG_LEAD_V4,MDC_ECG_LEAD_V5,MDC_ECG_LEAD_V6);
%     figure(2),plot(I);
    len=length(I); %get the length
    % check if the recording contains one or more straight lines
    len_sum=isStraghtline(I,TIME)+isStraghtline(II,TIME)+isStraghtline(III,TIME)+isStraghtline(AVR,TIME)+isStraghtline(AVL,TIME)+isStraghtline(AVF,TIME)+isStraghtline(V1,TIME)+isStraghtline(V2,TIME)+isStraghtline(V3,TIME)+isStraghtline(V4,TIME)+isStraghtline(V5,TIME)+isStraghtline(V6,TIME);
    %% do not contain straight line, record is valid, continue to next step
    if len_sum==0
        disp('Not Straight Line');
        straghtLine=0;
        input_features=postProcessing(I,II,V1,V2,V3,V4,V5,V6,level);   
    else
        disp('Straight Line');
        straghtLine=1;
        input_features=zeros(1,6*(2^level));
    end