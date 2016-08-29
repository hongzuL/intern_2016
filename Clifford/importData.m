function [IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,label] = importData(filename, startRow, endRow,percent)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [IISQI,IBSQI,IPSQI,ISSQI,IKSQI,IFSQI,IIISQI,IIBSQI,IIPSQI,IISSQI,IIKSQI,IIFSQI,IIIISQI,IIIBSQI,IIIPSQI,IIISSQI,IIIKSQI,IIIFSQI,AVRISQI,AVRBSQI,AVRPSQI,AVRSSQI,AVRKSQI,AVRFSQI,AVLISQI,AVLBSQI,AVLPSQI,AVLSSQI,AVLKSQI,AVLFSQI,AVFISQI,AVFBSQI,AVFPSQI,AVFSSQI,AVFKSQI,AVFFSQI,V1ISQI,V1BSQI,V1PSQI,V1SSQI,V1KSQI,V1FSQI,V2ISQI,V2BSQI,V2PSQI,V2SSQI,V2KSQI,V2FSQI,V3ISQI,V3BSQI,V3PSQI,V3SSQI,V3KSQI,V3FSQI,V4ISQI,V4BSQI,V4PSQI,V4SSQI,V4KSQI,V4FSQI,V5ISQI,V5BSQI,V5PSQI,V5SSQI,V5KSQI,V5FSQI,V6ISQI,V6BSQI,V6PSQI,V6SSQI,V6KSQI,V6FSQI,LABEL]
%   = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [IISQI,IBSQI,IPSQI,ISSQI,IKSQI,IFSQI,IIISQI,IIBSQI,IIPSQI,IISSQI,IIKSQI,IIFSQI,IIIISQI,IIIBSQI,IIIPSQI,IIISSQI,IIIKSQI,IIIFSQI,AVRISQI,AVRBSQI,AVRPSQI,AVRSSQI,AVRKSQI,AVRFSQI,AVLISQI,AVLBSQI,AVLPSQI,AVLSSQI,AVLKSQI,AVLFSQI,AVFISQI,AVFBSQI,AVFPSQI,AVFSSQI,AVFKSQI,AVFFSQI,V1ISQI,V1BSQI,V1PSQI,V1SSQI,V1KSQI,V1FSQI,V2ISQI,V2BSQI,V2PSQI,V2SSQI,V2KSQI,V2FSQI,V3ISQI,V3BSQI,V3PSQI,V3SSQI,V3KSQI,V3FSQI,V4ISQI,V4BSQI,V4PSQI,V4SSQI,V4KSQI,V4FSQI,V5ISQI,V5BSQI,V5PSQI,V5SSQI,V5KSQI,V5FSQI,V6ISQI,V6BSQI,V6PSQI,V6SSQI,V6KSQI,V6FSQI,LABEL]
%   = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,label] = importfile('seta-train.csv',1, 293);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2016/07/26 15:18:12

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% Read columns of data as strings:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric strings to numbers.
% Replace non-numeric strings with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = dataArray{col};
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73]
    % Converts strings in the input cell array to numbers. Replaced non-numeric
    % strings with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1);
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData{row}, regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if any(numbers==',');
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'));
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric strings to numbers.
            if ~invalidThousandsSeparator;
                numbers = textscan(strrep(numbers, ',', ''), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch me
        end
    end
end


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Allocate imported array to column variable names
IiSQI = cell2mat(raw(:, 1));
IbSQI = cell2mat(raw(:, 2));
IpSQI = cell2mat(raw(:, 3));
IsSQI = cell2mat(raw(:, 4));
IkSQI = cell2mat(raw(:, 5));
IfSQI = cell2mat(raw(:, 6));
IIiSQI = cell2mat(raw(:, 7));
IIbSQI = cell2mat(raw(:, 8));
IIpSQI = cell2mat(raw(:, 9));
IIsSQI = cell2mat(raw(:, 10));
IIkSQI = cell2mat(raw(:, 11));
IIfSQI = cell2mat(raw(:, 12));
IIIiSQI = cell2mat(raw(:, 13));
IIIbSQI = cell2mat(raw(:, 14));
IIIpSQI = cell2mat(raw(:, 15));
IIIsSQI = cell2mat(raw(:, 16));
IIIkSQI = cell2mat(raw(:, 17));
IIIfSQI = cell2mat(raw(:, 18));
AVRiSQI = cell2mat(raw(:, 19));
AVRbSQI = cell2mat(raw(:, 20));
AVRpSQI = cell2mat(raw(:, 21));
AVRsSQI = cell2mat(raw(:, 22));
AVRkSQI = cell2mat(raw(:, 23));
AVRfSQI = cell2mat(raw(:, 24));
AVLiSQI = cell2mat(raw(:, 25));
AVLbSQI = cell2mat(raw(:, 26));
AVLpSQI = cell2mat(raw(:, 27));
AVLsSQI = cell2mat(raw(:, 28));
AVLkSQI = cell2mat(raw(:, 29));
AVLfSQI = cell2mat(raw(:, 30));
AVFiSQI = cell2mat(raw(:, 31));
AVFbSQI = cell2mat(raw(:, 32));
AVFpSQI = cell2mat(raw(:, 33));
AVFsSQI = cell2mat(raw(:, 34));
AVFkSQI = cell2mat(raw(:, 35));
AVFfSQI = cell2mat(raw(:, 36));
V1iSQI = cell2mat(raw(:, 37));
V1bSQI = cell2mat(raw(:, 38));
V1pSQI = cell2mat(raw(:, 39));
V1sSQI = cell2mat(raw(:, 40));
V1kSQI = cell2mat(raw(:, 41));
V1fSQI = cell2mat(raw(:, 42));
V2iSQI = cell2mat(raw(:, 43));
V2bSQI = cell2mat(raw(:, 44));
V2pSQI = cell2mat(raw(:, 45));
V2sSQI = cell2mat(raw(:, 46));
V2kSQI = cell2mat(raw(:, 47));
V2fSQI = cell2mat(raw(:, 48));
V3iSQI = cell2mat(raw(:, 49));
V3bSQI = cell2mat(raw(:, 50));
V3pSQI = cell2mat(raw(:, 51));
V3sSQI = cell2mat(raw(:, 52));
V3kSQI = cell2mat(raw(:, 53));
V3fSQI = cell2mat(raw(:, 54));
V4iSQI = cell2mat(raw(:, 55));
V4bSQI = cell2mat(raw(:, 56));
V4pSQI = cell2mat(raw(:, 57));
V4sSQI = cell2mat(raw(:, 58));
V4kSQI = cell2mat(raw(:, 59));
V4fSQI = cell2mat(raw(:, 60));
V5iSQI = cell2mat(raw(:, 61));
V5bSQI = cell2mat(raw(:, 62));
V5pSQI = cell2mat(raw(:, 63));
V5sSQI = cell2mat(raw(:, 64));
V5kSQI = cell2mat(raw(:, 65));
V5fSQI = cell2mat(raw(:, 66));
V6iSQI = cell2mat(raw(:, 67));
V6bSQI = cell2mat(raw(:, 68));
V6pSQI = cell2mat(raw(:, 69));
V6sSQI = cell2mat(raw(:, 70));
V6kSQI = cell2mat(raw(:, 71));
V6fSQI = cell2mat(raw(:, 72));
label = cell2mat(raw(:, 73));

%split training and testing data
totalNum=length(label);
disp(totalNum)
if percent==80
    percent=percent/100;
    IiSQI = IiSQI(1:round(percent*totalNum));
    IbSQI = IbSQI(1:round(percent*totalNum));
    IpSQI = IpSQI(1:round(percent*totalNum));
    IsSQI = IsSQI(1:round(percent*totalNum));
    IkSQI = IkSQI(1:round(percent*totalNum));
    IfSQI = IfSQI(1:round(percent*totalNum));
    IIiSQI = IIiSQI(1:round(percent*totalNum));
    IIbSQI = IIbSQI(1:round(percent*totalNum));
    IIpSQI = IIpSQI(1:round(percent*totalNum));
    IIsSQI = IIsSQI(1:round(percent*totalNum));
    IIkSQI = IIkSQI(1:round(percent*totalNum));
    IIfSQI = IIfSQI(1:round(percent*totalNum));
    IIIiSQI = IIIiSQI(1:round(percent*totalNum));
    IIIbSQI = IIIbSQI(1:round(percent*totalNum));
    IIIpSQI = IIIpSQI(1:round(percent*totalNum));
    IIIsSQI = IIIsSQI(1:round(percent*totalNum));
    IIIkSQI = IIIkSQI(1:round(percent*totalNum));
    IIIfSQI = IIIfSQI(1:round(percent*totalNum));
    AVRiSQI = AVRiSQI(1:round(percent*totalNum));
    AVRbSQI = AVRbSQI(1:round(percent*totalNum));
    AVRpSQI = AVRpSQI(1:round(percent*totalNum));
    AVRsSQI = AVRsSQI(1:round(percent*totalNum));
    AVRkSQI = AVRkSQI(1:round(percent*totalNum));
    AVRfSQI = AVRfSQI(1:round(percent*totalNum));
    AVLiSQI = AVLiSQI(1:round(percent*totalNum));
    AVLbSQI = AVLbSQI(1:round(percent*totalNum));
    AVLpSQI = AVLpSQI(1:round(percent*totalNum));
    AVLsSQI = AVLsSQI(1:round(percent*totalNum));
    AVLkSQI = AVLkSQI(1:round(percent*totalNum));
    AVLfSQI = AVLfSQI(1:round(percent*totalNum));
    AVFiSQI = AVFiSQI(1:round(percent*totalNum));
    AVFbSQI = AVFbSQI(1:round(percent*totalNum));
    AVFpSQI = AVFpSQI(1:round(percent*totalNum));
    AVFsSQI = AVFsSQI(1:round(percent*totalNum));
    AVFkSQI = AVFkSQI(1:round(percent*totalNum));
    AVFfSQI = AVFfSQI(1:round(percent*totalNum));
    V1iSQI = V1iSQI(1:round(percent*totalNum));
    V1bSQI = V1bSQI(1:round(percent*totalNum));
    V1pSQI = V1pSQI(1:round(percent*totalNum));
    V1sSQI = V1sSQI(1:round(percent*totalNum));
    V1kSQI = V1kSQI(1:round(percent*totalNum));
    V1fSQI = V1fSQI(1:round(percent*totalNum));
    V2iSQI = V2iSQI(1:round(percent*totalNum));
    V2bSQI = V2bSQI(1:round(percent*totalNum));
    V2pSQI = V2pSQI(1:round(percent*totalNum));
    V2sSQI = V2sSQI(1:round(percent*totalNum));
    V2kSQI = V2kSQI(1:round(percent*totalNum));
    V2fSQI = V2fSQI(1:round(percent*totalNum));
    V3iSQI = V3iSQI(1:round(percent*totalNum));
    V3bSQI = V3bSQI(1:round(percent*totalNum));
    V3pSQI = V3pSQI(1:round(percent*totalNum));
    V3sSQI = V3sSQI(1:round(percent*totalNum));
    V3kSQI = V3kSQI(1:round(percent*totalNum));
    V3fSQI = V3fSQI(1:round(percent*totalNum));
    V4iSQI = V4iSQI(1:round(percent*totalNum));
    V4bSQI = V4bSQI(1:round(percent*totalNum));
    V4pSQI = V4pSQI(1:round(percent*totalNum));
    V4sSQI = V4sSQI(1:round(percent*totalNum));
    V4kSQI = V4kSQI(1:round(percent*totalNum));
    V4fSQI = V4fSQI(1:round(percent*totalNum));
    V5iSQI = V5iSQI(1:round(percent*totalNum));
    V5bSQI = V5bSQI(1:round(percent*totalNum));
    V5pSQI = V5pSQI(1:round(percent*totalNum));
    V5sSQI = V5sSQI(1:round(percent*totalNum));
    V5kSQI = V5kSQI(1:round(percent*totalNum));
    V5fSQI = V5fSQI(1:round(percent*totalNum));
    V6iSQI = V6iSQI(1:round(percent*totalNum));
    V6bSQI = V6bSQI(1:round(percent*totalNum));
    V6pSQI = V6pSQI(1:round(percent*totalNum));
    V6sSQI = V6sSQI(1:round(percent*totalNum));
    V6kSQI = V6kSQI(1:round(percent*totalNum));
    V6fSQI = V6fSQI(1:round(percent*totalNum));
    label = label(1:round(percent*totalNum));
elseif percent==20
    percent=(100-percent)/100;
    IiSQI = IiSQI(round(percent*totalNum)+1:totalNum);
    IbSQI = IbSQI(round(percent*totalNum)+1:totalNum);
    IpSQI = IpSQI(round(percent*totalNum)+1:totalNum);
    IsSQI = IsSQI(round(percent*totalNum)+1:totalNum);
    IkSQI = IkSQI(round(percent*totalNum)+1:totalNum);
    IfSQI = IfSQI(round(percent*totalNum)+1:totalNum);
    IIiSQI = IIiSQI(round(percent*totalNum)+1:totalNum);
    IIbSQI = IIbSQI(round(percent*totalNum)+1:totalNum);
    IIpSQI = IIpSQI(round(percent*totalNum)+1:totalNum);
    IIsSQI = IIsSQI(round(percent*totalNum)+1:totalNum);
    IIkSQI = IIkSQI(round(percent*totalNum)+1:totalNum);
    IIfSQI = IIfSQI(round(percent*totalNum)+1:totalNum);
    IIIiSQI = IIIiSQI(round(percent*totalNum)+1:totalNum);
    IIIbSQI = IIIbSQI(round(percent*totalNum)+1:totalNum);
    IIIpSQI = IIIpSQI(round(percent*totalNum)+1:totalNum);
    IIIsSQI = IIIsSQI(round(percent*totalNum)+1:totalNum);
    IIIkSQI = IIIkSQI(round(percent*totalNum)+1:totalNum);
    IIIfSQI = IIIfSQI(round(percent*totalNum)+1:totalNum);
    AVRiSQI = AVRiSQI(round(percent*totalNum)+1:totalNum);
    AVRbSQI = AVRbSQI(round(percent*totalNum)+1:totalNum);
    AVRpSQI = AVRpSQI(round(percent*totalNum)+1:totalNum);
    AVRsSQI = AVRsSQI(round(percent*totalNum)+1:totalNum);
    AVRkSQI = AVRkSQI(round(percent*totalNum)+1:totalNum);
    AVRfSQI = AVRfSQI(round(percent*totalNum)+1:totalNum);
    AVLiSQI = AVLiSQI(round(percent*totalNum)+1:totalNum);
    AVLbSQI = AVLbSQI(round(percent*totalNum)+1:totalNum);
    AVLpSQI = AVLpSQI(round(percent*totalNum)+1:totalNum);
    AVLsSQI = AVLsSQI(round(percent*totalNum)+1:totalNum);
    AVLkSQI = AVLkSQI(round(percent*totalNum)+1:totalNum);
    AVLfSQI = AVLfSQI(round(percent*totalNum)+1:totalNum);
    AVFiSQI = AVFiSQI(round(percent*totalNum)+1:totalNum);
    AVFbSQI = AVFbSQI(round(percent*totalNum)+1:totalNum);
    AVFpSQI = AVFpSQI(round(percent*totalNum)+1:totalNum);
    AVFsSQI = AVFsSQI(round(percent*totalNum)+1:totalNum);
    AVFkSQI = AVFkSQI(round(percent*totalNum)+1:totalNum);
    AVFfSQI = AVFfSQI(round(percent*totalNum)+1:totalNum);
    V1iSQI = V1iSQI(round(percent*totalNum)+1:totalNum);
    V1bSQI = V1bSQI(round(percent*totalNum)+1:totalNum);
    V1pSQI = V1pSQI(round(percent*totalNum)+1:totalNum);
    V1sSQI = V1sSQI(round(percent*totalNum)+1:totalNum);
    V1kSQI = V1kSQI(round(percent*totalNum)+1:totalNum);
    V1fSQI = V1fSQI(round(percent*totalNum)+1:totalNum);
    V2iSQI = V2iSQI(round(percent*totalNum)+1:totalNum);
    V2bSQI = V2bSQI(round(percent*totalNum)+1:totalNum);
    V2pSQI = V2pSQI(round(percent*totalNum)+1:totalNum);
    V2sSQI = V2sSQI(round(percent*totalNum)+1:totalNum);
    V2kSQI = V2kSQI(round(percent*totalNum)+1:totalNum);
    V2fSQI = V2fSQI(round(percent*totalNum)+1:totalNum);
    V3iSQI = V3iSQI(round(percent*totalNum)+1:totalNum);
    V3bSQI = V3bSQI(round(percent*totalNum)+1:totalNum);
    V3pSQI = V3pSQI(round(percent*totalNum)+1:totalNum);
    V3sSQI = V3sSQI(round(percent*totalNum)+1:totalNum);
    V3kSQI = V3kSQI(round(percent*totalNum)+1:totalNum);
    V3fSQI = V3fSQI(round(percent*totalNum)+1:totalNum);
    V4iSQI = V4iSQI(round(percent*totalNum)+1:totalNum);
    V4bSQI = V4bSQI(round(percent*totalNum)+1:totalNum);
    V4pSQI = V4pSQI(round(percent*totalNum)+1:totalNum);
    V4sSQI = V4sSQI(round(percent*totalNum)+1:totalNum);
    V4kSQI = V4kSQI(round(percent*totalNum)+1:totalNum);
    V4fSQI = V4fSQI(round(percent*totalNum)+1:totalNum);
    V5iSQI = V5iSQI(round(percent*totalNum)+1:totalNum);
    V5bSQI = V5bSQI(round(percent*totalNum)+1:totalNum);
    V5pSQI = V5pSQI(round(percent*totalNum)+1:totalNum);
    V5sSQI = V5sSQI(round(percent*totalNum)+1:totalNum);
    V5kSQI = V5kSQI(round(percent*totalNum)+1:totalNum);
    V5fSQI = V5fSQI(round(percent*totalNum)+1:totalNum);
    V6iSQI = V6iSQI(round(percent*totalNum)+1:totalNum);
    V6bSQI = V6bSQI(round(percent*totalNum)+1:totalNum);
    V6pSQI = V6pSQI(round(percent*totalNum)+1:totalNum);
    V6sSQI = V6sSQI(round(percent*totalNum)+1:totalNum);
    V6kSQI = V6kSQI(round(percent*totalNum)+1:totalNum);
    V6fSQI = V6fSQI(round(percent*totalNum)+1:totalNum);
    label = label(round(percent*totalNum)+1:totalNum);
end