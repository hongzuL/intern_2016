function Nmatched=arrayMatchingInterval(array1,array2,TIME_interval,garma)
    interval=garma/TIME_interval;
    Nmatched=0;
    len1=length(array1);
    len2=length(array2);
    if len1~=0 && len2~=0
        if len1>len2
            j=1;
            for i=1:len1
                if array1(i)>=array2(j)-interval && array1(i)<=array2(j)-interval
                    Nmatched=Nmatched+1;
                    j=j+1;
                elseif array1(i)+interval>array2(j)
                    j=j+1;
                end
                if j>len2
                    break;
                end
            end
        else
            j=1;
            for i=1:len2
                if array2(i)>=array1(j)-interval && array2(i)<=array1(j)+interval
                    Nmatched=Nmatched+1;
                    j=j+1;
                elseif array2(i)+interval>array1(j)
                    j=j+1;
                end
                if j>len1
                    break;
                end
            end
        end
    end