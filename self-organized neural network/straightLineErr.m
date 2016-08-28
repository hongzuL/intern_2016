function [trueUnacceptable_count,falseUnacceptable_count]=straightLineErr(straigtLine_name,acceptableRecords)
    trueUnacceptable_name={};
    falseUnacceptable_name={};
    trueUnacceptable_count=0;
    falseUnacceptable_count=0;
    for i=1:length(straigtLine_name)
        [bool,name]=isAcceptable(straigtLine_name{i},acceptableRecords);
        if bool>=1
            falseUnacceptable_count=falseUnacceptable_count+1;
            falseUnacceptable_name{falseUnacceptable_count}=name;
        else
            trueUnacceptable_count=trueUnacceptable_count+1;
            trueUnacceptable_name{trueUnacceptable_count}=name;
        end
    end