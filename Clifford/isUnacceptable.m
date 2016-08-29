function [bool,name]=isUnacceptable(a,b)
    [pathstr,name,ext]=fileparts(a);
    bool=ismember(str2double(name),b);

