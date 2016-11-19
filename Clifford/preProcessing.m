function [I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME]=preProcessing(TIME_ABSOLUTE,MDC_ECG_LEAD_I,MDC_ECG_LEAD_II,MDC_ECG_LEAD_III,MDC_ECG_LEAD_AVR,MDC_ECG_LEAD_AVL,MDC_ECG_LEAD_AVF,MDC_ECG_LEAD_V1,MDC_ECG_LEAD_V2,MDC_ECG_LEAD_V3,MDC_ECG_LEAD_V4,MDC_ECG_LEAD_V5,MDC_ECG_LEAD_V6)
    TIME=TIME_ABSOLUTE;
    %% downsample the data if the sample rate is higher than 500 Hz
    if length(TIME)>500
        dsRate=round(length(TIME)/500);
        TIME = downsample(TIME,dsRate);
        MDC_ECG_LEAD_I = downsample(MDC_ECG_LEAD_I,dsRate);
        MDC_ECG_LEAD_II = downsample(MDC_ECG_LEAD_II,dsRate);
        MDC_ECG_LEAD_III = downsample(MDC_ECG_LEAD_III,dsRate);
        MDC_ECG_LEAD_AVR = downsample(MDC_ECG_LEAD_AVR,dsRate);
        MDC_ECG_LEAD_AVL = downsample(MDC_ECG_LEAD_AVL,dsRate);
        MDC_ECG_LEAD_AVF = downsample(MDC_ECG_LEAD_AVF,dsRate);
        MDC_ECG_LEAD_V1 = downsample(MDC_ECG_LEAD_V1,dsRate);
        MDC_ECG_LEAD_V2 = downsample(MDC_ECG_LEAD_V2,dsRate);
        MDC_ECG_LEAD_V3 = downsample(MDC_ECG_LEAD_V3,dsRate);
        MDC_ECG_LEAD_V4 = downsample(MDC_ECG_LEAD_V4,dsRate);
        MDC_ECG_LEAD_V5 = downsample(MDC_ECG_LEAD_V5,dsRate);
        MDC_ECG_LEAD_V6 = downsample(MDC_ECG_LEAD_V6,dsRate);
    end
    
    %% high-pass filter at 1 Hz
    I = doFilter(MDC_ECG_LEAD_I);
    II = doFilter(MDC_ECG_LEAD_II);
    III = doFilter(MDC_ECG_LEAD_III);
    AVR = doFilter(MDC_ECG_LEAD_AVR);
    AVL = doFilter(MDC_ECG_LEAD_AVL);
    AVF = doFilter(MDC_ECG_LEAD_AVF);
    V1 = doFilter(MDC_ECG_LEAD_V1);
    V2 = doFilter(MDC_ECG_LEAD_V2);
    V3 = doFilter(MDC_ECG_LEAD_V3);
    V4 = doFilter(MDC_ECG_LEAD_V4);
    V5 = doFilter(MDC_ECG_LEAD_V5);
    V6 = doFilter(MDC_ECG_LEAD_V6);