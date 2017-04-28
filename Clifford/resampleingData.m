function newArray=resampleingData(array,acceptableCount,unacceptableCount,label)
    if(acceptableCount>unacceptableCount)
        %acceptable record more than unacceptable record, duplicate
        %unacceptable array
        Aarray = array(label==1);
        Uarray = datasample(array(label==-1),acceptableCount,'Replace',true);
    elseif(acceptableCount<unacceptableCount)
        %accpetable record less than unacceptable record, duplicate
        %acceptable array
        Aarray = datasample(array(label==1),unacceptableCount,'Replace',true);
        Uarray = array(label==-1); 
    else
        Aarray = array(label==1);
        Uarray = array(label==-1); 
        %do nothing
    end
    newArray=vertcat(Aarray,Uarray);