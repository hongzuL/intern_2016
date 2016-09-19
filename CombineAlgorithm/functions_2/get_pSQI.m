function pSQI=get_pSQI(lead,fs)
    p1=pburg(lead,10,[5 20],fs);
    p2=pburg(lead,10,[0 62.5],fs);
    if p2==0
        pSQI=0;
    elseif isnan(p1)
        pSQI=0;
    elseif isnan(p2)
        pSQI=0;
    else
        pSQI=p1/p2;
    end