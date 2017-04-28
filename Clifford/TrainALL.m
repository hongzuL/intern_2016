%% this function read the temp training data and writes to file and train with the nerual network
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
label='label';
Files=dir('tmpInputfeatures\*.mat');
writeFile='tempData/20170428.csv';
if exist(writeFile, 'file') ~= 2
    disp('file does not exist');
    fileID = fopen(writeFile,'w');
    fprintf(fileID,'%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n',ISQI,IISQI,IIISQI,AVRSQI,AVLSQI,AVFSQI,V1SQI,V2SQI,V3SQI,V4SQI,V5SQI,V6SQI,label);
    for i=1:length(Files)
        load(strcat('tmpInputfeatures\',Files(i).name));
        for j=1:length(input_features)
            if j==length(input_features)
                fprintf(fileID,'%d\n',input_features(j));
            else
                fprintf(fileID,'%d,',input_features(j));
            end
        end
        delete(strcat('tmpInputfeatures\',Files(i).name));
        %clearvars input_features;
    end
    fclose(fileID);
else
end
load('NumOfFiles.mat');
startRow=2;
endRow=NumOfFiles+1;
percent=100;
TrainingLDA(writeFile,startRow,endRow,percent);
TrainingMLP(writeFile,startRow,endRow,percent);
% TrainingNB(writeFile,startRow,endRow,percent);
TrainingSVM(writeFile,startRow,endRow,percent);