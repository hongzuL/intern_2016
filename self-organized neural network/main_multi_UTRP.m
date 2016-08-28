clear,close all,
Files=dir('data/*.csv');
straightLine_count=0;
temp_count=0;
tempRecords={};
straigtLine_name={};
for i=1:length(Files)
    filename = fullfile('data',Files(i).name); 
    s1=num2str((i/length(Files))*100);
    s2='%';
    disp(strcat(s1,s2));
    [UTRP,straightLine]=mainAlgorithm_UTRP(filename);
    [pathstr,name,ext]=fileparts(Files(i).name);
    if straightLine==1
        straightLine_count=straightLine_count+1;
        straigtLine_name{straightLine_count}=name;
    else
        temp_count=temp_count+1;
        tempRecords{temp_count}=Files(i).name;
        fullPath=fullfile('setA_UTRPs',name);
        save(fullPath,'UTRP');
    end
end