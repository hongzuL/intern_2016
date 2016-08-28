function sSQI=get_sSQI(lead)
    sSQI=skewness(lead);
    if isnan(sSQI)
        sSQI=0;
    end