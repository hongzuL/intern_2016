function [bool,name]=isAcceptable(a,b)
    [pathstr,name,ext]=fileparts(a);
    bool=ismember(name,b);
