function newArray=resampleingData(array,acceptableCount,unacceptableCount,label)
    if(acceptableCount<unacceptableCount)
        %acceptable record less than unacceptable record
        Aarray = array(label==1);
        Uarray = datasample(array(label==-1),acceptableCount,'Replace',true);
    elseif(acceptableCount>unacceptableCount)
        %accpetable record more than unacceptable record
        Aarray = datasample(array(label==1),unacceptableCount,'Replace',true);
        Uarray = array(label==-1); 
    else
        %do nothing
    end
    newArray=vertcat(Aarray,Uarray);