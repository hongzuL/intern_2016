function [I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME]=preProcessing(TIME_ABSOLUTE,MDC_ECG_LEAD_I,MDC_ECG_LEAD_II,MDC_ECG_LEAD_III,MDC_ECG_LEAD_AVR,MDC_ECG_LEAD_AVL,MDC_ECG_LEAD_AVF,MDC_ECG_LEAD_V1,MDC_ECG_LEAD_V2,MDC_ECG_LEAD_V3,MDC_ECG_LEAD_V4,MDC_ECG_LEAD_V5,MDC_ECG_LEAD_V6)
    %% downsample the data if the sample rate is higher than 500 Hz
    if length(TIME_ABSOLUTE)>500
        dsRate=round(length(TIME_ABSOLUTE)/500);
        TIME_ABSOLUTE = downsample(TIME_ABSOLUTE,dsRate);
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
    len=length(TIME_ABSOLUTE);
    %% normalize the data to [0,1]
    for i=1:len
        MDC_ECG_LEAD_I(i)=normalize(MDC_ECG_LEAD_I(i),min(MDC_ECG_LEAD_I),max(MDC_ECG_LEAD_I));
        MDC_ECG_LEAD_II(i)=normalize(MDC_ECG_LEAD_II(i),min(MDC_ECG_LEAD_II),max(MDC_ECG_LEAD_II));
        MDC_ECG_LEAD_III(i)=normalize(MDC_ECG_LEAD_III(i),min(MDC_ECG_LEAD_III),max(MDC_ECG_LEAD_III));
        MDC_ECG_LEAD_AVR(i)=normalize(MDC_ECG_LEAD_AVR(i),min(MDC_ECG_LEAD_AVR),max(MDC_ECG_LEAD_AVR));
        MDC_ECG_LEAD_AVL(i)=normalize(MDC_ECG_LEAD_AVL(i),min(MDC_ECG_LEAD_AVL),max(MDC_ECG_LEAD_AVL));
        MDC_ECG_LEAD_AVF(i)=normalize(MDC_ECG_LEAD_AVF(i),min(MDC_ECG_LEAD_AVF),max(MDC_ECG_LEAD_AVF));
        MDC_ECG_LEAD_V1(i)=normalize(MDC_ECG_LEAD_V1(i),min(MDC_ECG_LEAD_V1),max(MDC_ECG_LEAD_V1));
        MDC_ECG_LEAD_V2(i)=normalize(MDC_ECG_LEAD_V2(i),min(MDC_ECG_LEAD_V2),max(MDC_ECG_LEAD_V2));
        MDC_ECG_LEAD_V3(i)=normalize(MDC_ECG_LEAD_V3(i),min(MDC_ECG_LEAD_V3),max(MDC_ECG_LEAD_V3));
        MDC_ECG_LEAD_V4(i)=normalize(MDC_ECG_LEAD_V4(i),min(MDC_ECG_LEAD_V4),max(MDC_ECG_LEAD_V4));
        MDC_ECG_LEAD_V5(i)=normalize(MDC_ECG_LEAD_V5(i),min(MDC_ECG_LEAD_V5),max(MDC_ECG_LEAD_V5));
        MDC_ECG_LEAD_V6(i)=normalize(MDC_ECG_LEAD_V6(i),min(MDC_ECG_LEAD_V6),max(MDC_ECG_LEAD_V6));
    end
    %% band-pass filter between 1 and 120 Hz
    MDC_ECG_LEAD_I = doFilter(MDC_ECG_LEAD_I);
    MDC_ECG_LEAD_II = doFilter(MDC_ECG_LEAD_II);
    MDC_ECG_LEAD_III = doFilter(MDC_ECG_LEAD_III);
    MDC_ECG_LEAD_AVR = doFilter(MDC_ECG_LEAD_AVR);
    MDC_ECG_LEAD_AVL = doFilter(MDC_ECG_LEAD_AVL);
    MDC_ECG_LEAD_AVF = doFilter(MDC_ECG_LEAD_AVF);
    MDC_ECG_LEAD_V1 = doFilter(MDC_ECG_LEAD_V1);
    MDC_ECG_LEAD_V2 = doFilter(MDC_ECG_LEAD_V2);
    MDC_ECG_LEAD_V3 = doFilter(MDC_ECG_LEAD_V3);
    MDC_ECG_LEAD_V4 = doFilter(MDC_ECG_LEAD_V4);
    MDC_ECG_LEAD_V5 = doFilter(MDC_ECG_LEAD_V5);
    MDC_ECG_LEAD_V6 = doFilter(MDC_ECG_LEAD_V6);
    % discard first 1 sec and last 1 sec
    firstseg=0;
    lastseg=0;
    for i=2:len-1
        if TIME_ABSOLUTE(i-1)-TIME_ABSOLUTE(1)<500
            if TIME_ABSOLUTE(i)-TIME_ABSOLUTE(1)>=500
                firstseg=i;
            end
        end
        if TIME_ABSOLUTE(len)-TIME_ABSOLUTE(i-1)>500
            if TIME_ABSOLUTE(len)-TIME_ABSOLUTE(i)<=500
                lastseg=i;
            end
        end
    end
    I = MDC_ECG_LEAD_I(firstseg:lastseg);
    II = MDC_ECG_LEAD_II(firstseg:lastseg);
    III = MDC_ECG_LEAD_III(firstseg:lastseg);
    AVR = MDC_ECG_LEAD_AVR(firstseg:lastseg);
    AVL = MDC_ECG_LEAD_AVL(firstseg:lastseg);
    AVF = MDC_ECG_LEAD_AVF(firstseg:lastseg);
    V1 = MDC_ECG_LEAD_V1(firstseg:lastseg);
    V2 = MDC_ECG_LEAD_V2(firstseg:lastseg);
    V3 = MDC_ECG_LEAD_V3(firstseg:lastseg);
    V4 = MDC_ECG_LEAD_V4(firstseg:lastseg);
    V5 = MDC_ECG_LEAD_V5(firstseg:lastseg);
    V6 = MDC_ECG_LEAD_V6(firstseg:lastseg);
    TIME = TIME_ABSOLUTE(firstseg:lastseg);