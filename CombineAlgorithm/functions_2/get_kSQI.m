function kSQI=get_kSQI(lead)
    k=kurtosis(lead);
    if k>5
        kSQI=1;
    else
        kSQI=0;
    end