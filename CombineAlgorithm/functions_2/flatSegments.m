function count=flatSegments(array,time)
    count=0;
    len=length(array);
    for i=2:len
        k=abs(array(i)-array(i-1));
        if k<(25/1000)
            count=count+1;
        end
    end