function y = doFilter(x)
    Hd = designfilt('bandpassiir',...
        'FilterOrder',10, ...
        'HalfPowerFrequency1',1,...
        'HalfPowerFrequency2',120, ...
        'DesignMethod','butter', ...
        'SampleRate',500);
    y = filter(Hd,x);
