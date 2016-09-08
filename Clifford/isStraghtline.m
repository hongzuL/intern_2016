function bool=isStraghtline(array,time) %if bool=1, it is a straight line
    bool=1;
    len=length(array);
    slope=(array(len)-array(len-1))/(time(len)-time(len-1));
    for i=1:len-2
        k=(array(len-i)-array(len-i-1))/(time(len-i)-time(len-i-1));
        if slope~=k
            bool=0;
            break;
        end
    end