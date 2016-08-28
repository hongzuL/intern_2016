function [bool,name]=isAcceptable(a,b)
    [pathstr,name,ext]=fileparts(a);
    bool=strmatch(name,b);
