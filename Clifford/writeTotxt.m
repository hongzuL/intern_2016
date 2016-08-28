function filename=writeTotxt(filename,I,II,III,AVR,AVL,AVF,V1,V2,V3,V4,V5,V6,TIME)
    [pathstr,name,ext]=fileparts(filename);
    name=strcat(name,'.txt');
    filename = fullfile('data',name); 
    if exist(filename,'file')==2
        printstr=strcat(filename,' exists');
        disp(printstr)
    else
        fileID = fopen(filename,'w');
        for i=1:length(TIME)
            fprintf(fileID,'%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d \n',TIME(i),I(i),II(i),III(i),AVR(i),AVL(i),AVF(i),V1(i),V2(i),V3(i),V4(i),V5(i),V6(i));
        end
        fclose(fileID);
    end