function [iSQI,bSQI,pSQI,sSQI,kSQI,fSQI]=calculateFeatures(fs,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,wqrs_I,wqrs_II,wqrs_III,wqrs_aVF,wqrs_aVL,wqrs_aVR,wqrs_V1,wqrs_V2,wqrs_V3,wqrs_V4,wqrs_V5,wqrs_V6,whichLead)
    TIME_interval=1000/fs;%exact milliseconds between rows
    iSQI=0;
    bSQI=0;
    pSQI=0;
    sSQI=0;
    kSQI=0;  
    fSQI=0;
    %iSQI
    if whichLead>=1 && whichLead<=12
        iSQI=get_iSQI(epltdqrs1_I.time,epltdqrs1_II.time,epltdqrs1_III.time,epltdqrs1_aVF.time,epltdqrs1_aVL.time,epltdqrs1_aVR.time,epltdqrs1_V1.time,epltdqrs1_V2.time,epltdqrs1_V3.time,epltdqrs1_V4.time,epltdqrs1_V5.time,epltdqrs1_V6.time,whichLead);
    end
    %bSQI
    if whichLead==1
        bSQI=get_bSQI(epltdqrs1_I.time,wqrs_I.time,TIME_interval);
    elseif whichLead==2
        bSQI=get_bSQI(epltdqrs1_II.time,wqrs_II.time,TIME_interval);
    elseif whichLead==3
        bSQI=get_bSQI(epltdqrs1_III.time,wqrs_III.time,TIME_interval);
    elseif whichLead==4
        bSQI=get_bSQI(epltdqrs1_aVR.time,wqrs_aVR.time,TIME_interval);
    elseif whichLead==5
        bSQI=get_bSQI(epltdqrs1_aVL.time,wqrs_aVL.time,TIME_interval);
    elseif whichLead==6
        bSQI=get_bSQI(epltdqrs1_aVF.time,wqrs_aVF.time,TIME_interval);
    elseif whichLead==7
        bSQI=get_bSQI(epltdqrs1_V1.time,wqrs_V1.time,TIME_interval);
    elseif whichLead==8
        bSQI=get_bSQI(epltdqrs1_V2.time,wqrs_V2.time,TIME_interval);
    elseif whichLead==9
        bSQI=get_bSQI(epltdqrs1_V3.time,wqrs_V3.time,TIME_interval);
    elseif whichLead==10
        bSQI=get_bSQI(epltdqrs1_V4.time,wqrs_V4.time,TIME_interval);
    elseif whichLead==11
        bSQI=get_bSQI(epltdqrs1_V5.time,wqrs_V5.time,TIME_interval);
    elseif whichLead==12
        bSQI=get_bSQI(epltdqrs1_V6.time,wqrs_V6.time,TIME_interval);
    end
    %pSQI
    if whichLead==1
        pSQI=get_pSQI(I,fs);
    elseif whichLead==2
        pSQI=get_pSQI(II,fs);
    elseif whichLead==3
        pSQI=get_pSQI(III,fs);
    elseif whichLead==4
        pSQI=get_pSQI(AVR,fs);
    elseif whichLead==5
        pSQI=get_pSQI(AVL,fs);
    elseif whichLead==6
        pSQI=get_pSQI(AVF,fs);
    elseif whichLead==7
        pSQI=get_pSQI(V1,fs);
    elseif whichLead==8
        pSQI=get_pSQI(V2,fs);
    elseif whichLead==9
        pSQI=get_pSQI(V3,fs);
    elseif whichLead==10
        pSQI=get_pSQI(V4,fs);
    elseif whichLead==11
        pSQI=get_pSQI(V5,fs);
    elseif whichLead==12
        pSQI=get_pSQI(V6,fs);
    end
    %sSQI
    if whichLead==1
        sSQI=get_sSQI(I);
    elseif whichLead==2
        sSQI=get_sSQI(II);
    elseif whichLead==3
        sSQI=get_sSQI(III);
    elseif whichLead==4
        sSQI=get_sSQI(AVR);
    elseif whichLead==5
        sSQI=get_sSQI(AVL);
    elseif whichLead==6
        sSQI=get_sSQI(AVF);
    elseif whichLead==7
        sSQI=get_sSQI(V1);
    elseif whichLead==8
        sSQI=get_sSQI(V2);
    elseif whichLead==9
        sSQI=get_sSQI(V3);
    elseif whichLead==10
        sSQI=get_sSQI(V4);
    elseif whichLead==11
        sSQI=get_sSQI(V5);
    elseif whichLead==12
        sSQI=get_sSQI(V6);
    end
    %kSQI
    if whichLead==1
        kSQI=get_kSQI(I);
    elseif whichLead==2
        kSQI=get_kSQI(II);
    elseif whichLead==3
        kSQI=get_kSQI(III);
    elseif whichLead==4
        kSQI=get_kSQI(AVR);
    elseif whichLead==5
        kSQI=get_kSQI(AVL);
    elseif whichLead==6
        kSQI=get_kSQI(AVF);
    elseif whichLead==7
        kSQI=get_kSQI(V1);
    elseif whichLead==8
        kSQI=get_kSQI(V2);
    elseif whichLead==9
        kSQI=get_kSQI(V3);
    elseif whichLead==10
        kSQI=get_kSQI(V4);
    elseif whichLead==11
        kSQI=get_kSQI(V5);
    elseif whichLead==12
        kSQI=get_kSQI(V5);
    end
    %fSQI
    if whichLead==1
        fSQI=get_fSQI(I,TIME);
    elseif whichLead==2
        fSQI=get_fSQI(II,TIME);
    elseif whichLead==3
        fSQI=get_fSQI(III,TIME);
    elseif whichLead==4
        fSQI=get_fSQI(AVR,TIME);
    elseif whichLead==5
        fSQI=get_fSQI(AVL,TIME);
    elseif whichLead==6
        fSQI=get_fSQI(AVF,TIME);
    elseif whichLead==7
        fSQI=get_fSQI(V1,TIME);
    elseif whichLead==8
        fSQI=get_fSQI(V2,TIME);
    elseif whichLead==9
        fSQI=get_fSQI(V3,TIME);
    elseif whichLead==10
        fSQI=get_fSQI(V4,TIME);
    elseif whichLead==11
        fSQI=get_fSQI(V5,TIME);
    elseif whichLead==12
        fSQI=get_fSQI(V6,TIME);
    end