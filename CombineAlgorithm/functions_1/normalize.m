function y=normalize(x,min,max)
    y=(x-min)/(max-min);
    if max-min==0
        y=0;
    end