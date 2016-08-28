function bSQI=get_bSQI(eplimited,wqrs,TIME_interval)
    garma=150;%150ms 
    len_ep=length(eplimited);
    len_w=length(wqrs);
    Nmatched=arrayMatchingInterval(eplimited,wqrs,TIME_interval,garma);
    Nall=len_ep+len_w-Nmatched;
    if Nall==0
        bSQI=0;
    else
        bSQI=Nmatched/Nall;
    end