function WFDBfile=writeToWFDB(filename,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME,fs)
    [pathstr,name,ext]=fileparts(filename);
    X=double(horzcat(I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6));

    fname=name;
    mat2wfdb(X,fname)
    WFDBfile=strcat(name,'.dat');