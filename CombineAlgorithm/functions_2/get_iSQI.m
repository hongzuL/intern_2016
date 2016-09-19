function iSQI=get_iSQI(epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6,whichLead)
    all_detection=vertcat(epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6);
    all_detection=unique(all_detection);
    Nmatched=0;
    if whichLead==1
        len=length(epltdqrs1_I);
        if len==0
        else
            x=vertcat(epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6);
            x=unique(x);
            Nmatched=arrayMatching(epltdqrs1_I,x);
        end
    elseif whichLead==2
        len=length(epltdqrs1_II);
        if len==0
        else
            x=vertcat(epltdqrs1_I,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6);
            x=unique(x);
            Nmatched=arrayMatching(epltdqrs1_II,x);
        end
    elseif whichLead==3
        len=length(epltdqrs1_III);
        if len==0
        else
            x=vertcat(epltdqrs1_I,epltdqrs1_II,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6);
            x=unique(x);
            Nmatched=arrayMatching(epltdqrs1_III,x);
        end
    elseif whichLead==4
        len=length(epltdqrs1_aVR);
        if len==0
        else
            x=vertcat(epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6);
            x=unique(x);
            Nmatched=arrayMatching(epltdqrs1_aVR,x);
        end
    elseif whichLead==5
        len=length(epltdqrs1_aVL);
        if len==0
        else
            x=vertcat(epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6);
            x=unique(x);
            Nmatched=arrayMatching(epltdqrs1_aVL,x);
        end
    elseif whichLead==6
        len=length(epltdqrs1_aVF);
        if len==0
        else
            x=vertcat(epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6);
            x=unique(x);
            Nmatched=arrayMatching(epltdqrs1_aVF,x);
        end
    elseif whichLead==7
        len=length(epltdqrs1_V1);
        if len==0
        else
            x=vertcat(epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6);
            x=unique(x);
            Nmatched=arrayMatching(epltdqrs1_V1,x);
        end
    elseif whichLead==8
        len=length(epltdqrs1_V2);
        if len==0
        else
            x=vertcat(epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6);
            x=unique(x);
            Nmatched=arrayMatching(epltdqrs1_V2,x);
        end
    elseif whichLead==9
        len=length(epltdqrs1_V3);
        if len==0
        else
            x=vertcat(epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V4,epltdqrs1_V5,epltdqrs1_V6);
            x=unique(x);
            Nmatched=arrayMatching(epltdqrs1_V3,x);
        end
    elseif whichLead==10
        len=length(epltdqrs1_V4);
        if len==0
        else
            x=vertcat(epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V5,epltdqrs1_V6);
            x=unique(x);
            Nmatched=arrayMatching(epltdqrs1_V4,x);
        end
    elseif whichLead==11
        len=length(epltdqrs1_V5);
        if len==0
        else
            x=vertcat(epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V6);
            x=unique(x);
            Nmatched=arrayMatching(epltdqrs1_V5,x);
        end
    elseif whichLead==12
        len=length(epltdqrs1_V6);
        if len==0
        else
            x=vertcat(epltdqrs1_I,epltdqrs1_II,epltdqrs1_III,epltdqrs1_aVF,epltdqrs1_aVL,epltdqrs1_aVR,epltdqrs1_V1,epltdqrs1_V2,epltdqrs1_V3,epltdqrs1_V4,epltdqrs1_V5);
            x=unique(x);
            Nmatched=arrayMatching(epltdqrs1_V6,x);
        end
    end
    Nall=length(all_detection)-Nmatched;
    if Nall==0
        iSQI=0;
    else
        iSQI=Nmatched/Nall;
    end