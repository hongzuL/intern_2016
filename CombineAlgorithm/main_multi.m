clear,close all,
userDir = getuserdir();
truePath=strcat(userDir,'\ECG_data\MIT\*.csv');
pathName=strcat(userDir,'\ECG_data\MIT\');
[acceptableRecords,unacceptableRecords]=loadLabels(userDir);
Files=dir(truePath);
fs=500;%sampling frequency is 500
ISQI='I-iSQI,I-bSQI,I-pSQI,I-sSQI,I-kSQI,I-fSQI';
IISQI='II-iSQI,II-bSQI,II-pSQI,II-sSQI,II-kSQI,II-fSQI';
IIISQI='III-iSQI,III-bSQI,III-pSQI,III-sSQI,III-kSQI,III-fSQI';
AVRSQI='AVR-iSQI,AVR-bSQI,AVR-pSQI,AVR-sSQI,AVR-kSQI,AVR-fSQI';
AVLSQI='AVL-iSQI,AVL-bSQI,AVL-pSQI,AVL-sSQI,AVL-kSQI,AVL-fSQI';
AVFSQI='AVF-iSQI,AVF-bSQI,AVF-pSQI,AVF-sSQI,AVF-kSQI,AVF-fSQI';
V1SQI='V1-iSQI,V1-bSQI,V1-pSQI,V1-sSQI,V1-kSQI,V1-fSQI';
V2SQI='V2-iSQI,V2-bSQI,V2-pSQI,V2-sSQI,V2-kSQI,V2-fSQI';
V3SQI='V3-iSQI,V3-bSQI,V3-pSQI,V3-sSQI,V3-kSQI,V3-fSQI';
V4SQI='V4-iSQI,V4-bSQI,V4-pSQI,V4-sSQI,V4-kSQI,V4-fSQI';
V5SQI='V5-iSQI,V5-bSQI,V5-pSQI,V5-sSQI,V5-kSQI,V5-fSQI';
V6SQI='V6-iSQI,V6-bSQI,V6-pSQI,V6-sSQI,V6-kSQI,V6-fSQI';
RQA1='RR-1,DET-1,LMAX-1,ENT-1,LAM-1,TT-1';
RQA2='RR-2,DET-2,LMAX-2,ENT-2,LAM-2,TT-2';
RQA3='RR-3,DET-3,LMAX-3,ENT-3,LAM-3,TT-3';
RQA4='RR-4,DET-4,LMAX-4,ENT-4,LAM-4,TT-4';
label='label';
writeFile='tempData/setA.csv';
fileID = fopen(writeFile,'w');
fprintf(fileID,'%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n',RQA1,RQA2,RQA3,RQA4,ISQI,IISQI,IIISQI,AVRSQI,AVLSQI,AVFSQI,V1SQI,V2SQI,V3SQI,V4SQI,V5SQI,V6SQI,label);
skip=0;
rerun_array=loadRerun();
for i=1:length(Files)
    filename = fullfile(pathName,Files(i).name); 
    s1=num2str((i/length(Files))*100);
    s2='%';
    disp(strcat(s1,s2));
    [abool,name]=isAcceptable(filename,acceptableRecords);
    [ubool,name]=isUnacceptable(filename,unacceptableRecords);
    if abool>=1
        skip=0;
    elseif ubool>=1
        skip=0;
    else
        skip=1;
    end
%     if(ismember(str2double(name),rerun_array)>=1)
%         skip=0;
%     else
%         skip=1;
%     end
    if skip==0
        [input_feature1,straghtLine]=mainAlgorithm1(filename,2);
        [input_feature2,straightLine]=mainAlgorithm2(filename,fs);
        input_feature2=input_feature2';
        input_features=horzcat(input_feature1,input_feature2);
        if abool>=1
            input_features=[input_features 1];
        elseif ubool>=1
            input_features=[input_features -1];
        end
        for j=1:length(input_features)
            if j==length(input_features)
                fprintf(fileID,'%d\n',input_features(j));
            else
                fprintf(fileID,'%d,',input_features(j));
            end
        end
    end
end
fclose(fileID);
% multiTest(writeFile);
%% clear temp data
clearvars truePath userDir filename FileName pathName straightLine fs name  unacceptableRecords fileID ISQI IISQI IIISQI AVRSQI AVLSQI AVFSQI V1SQI V2SQI V3SQI V4SQI V5SQI V6SQI label bool Files i j s1 s2 ans;