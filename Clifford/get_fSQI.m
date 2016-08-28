function fSQI=get_fSQI(lead,time)
    count=flatSegments(lead,time);
    fSQI=count/(length(lead)-1);