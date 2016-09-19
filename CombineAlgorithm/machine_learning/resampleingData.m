function newArray=resampleingData(array,acceptableCount,unacceptableCount,label)
    Aarray = array(label==1);
    Uarray = datasample(array(label==-1),acceptableCount,'Replace',true);
    newArray=vertcat(Aarray,Uarray);