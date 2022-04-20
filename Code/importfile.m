function [VarName1,mycell,mydata,VarName2,VarName3,VarName4,VarName5,VarName6,VarName7,VarName8,VarName9,VarName10,VarName11,VarName12,VarName13,VarName14,VarName15,VarName16,VarName17,VarName18,VarName19,VarName20,VarName21,VarName22,VarName23,VarName24,VarName25,VarName26,VarName27,VarName28,VarName29,VarName30,VarName31,VarName32,VarName33,VarName34,VarName35,VarName36,VarName37,VarName38,VarName39,VarName40,VarName41,VarName42,VarName43,VarName44,VarName45,VarName46,VarName47,VarName48,VarName49,VarName50,VarName51,VarName52,VarName53,VarName54,VarName55,VarName56,VarName57,VarName58,VarName59,VarName60,VarName61,VarName62,VarName63,VarName64,VarName65,VarName66,VarName67,VarName68,VarName69,VarName70,VarName71,VarName72,VarName73,VarName74,VarName75,VarName76,VarName77,VarName78,VarName79,VarName80,VarName81,VarName82,VarName83,VarName84,VarName85,VarName86,VarName87,VarName88,VarName89,VarName90,VarName91,VarName92,VarName93,VarName94,VarName95,VarName96,VarName97,VarName98,VarName99,VarName100,VarName101,VarName102,VarName103,VarName104,VarName105,VarName106,VarName107,VarName108,VarName109,VarName110,VarName111,VarName112,VarName113,VarName114,VarName115,VarName116,VarName117,VarName118,VarName119,VarName120,VarName121,VarName122,VarName123,VarName124,VarName125,VarName126,VarName127,VarName128,VarName129,VarName130,VarName131,VarName132,VarName133,VarName134,VarName135,VarName136,VarName137,VarName138,VarName139,VarName140,VarName141,VarName142,VarName143,VarName144,VarName145,VarName146,VarName147,VarName148,VarName149] = importfile(workbookFile,sheetName,startRow,endRow)
%IMPORTFILE Import data from a spreadsheet
%   [VarName1,VarName2,VarName3,VarName4,VarName5,VarName6,VarName7,VarName8,VarName9,VarName10,VarName11,VarName12,VarName13,VarName14,VarName15,VarName16,VarName17,VarName18,VarName19,VarName20,VarName21,VarName22,VarName23,VarName24,VarName25,VarName26,VarName27,VarName28,VarName29,VarName30,VarName31,VarName32,VarName33,VarName34,VarName35,VarName36,VarName37,VarName38,VarName39,VarName40,VarName41,VarName42,VarName43,VarName44,VarName45,VarName46,VarName47,VarName48,VarName49,VarName50,VarName51,VarName52,VarName53,VarName54,VarName55,VarName56,VarName57,VarName58,VarName59,VarName60,VarName61,VarName62,VarName63,VarName64,VarName65,VarName66,VarName67,VarName68,VarName69,VarName70,VarName71,VarName72,VarName73,VarName74,VarName75,VarName76,VarName77,VarName78,VarName79,VarName80,VarName81,VarName82,VarName83,VarName84,VarName85,VarName86,VarName87,VarName88,VarName89,VarName90,VarName91,VarName92,VarName93,VarName94,VarName95,VarName96,VarName97,VarName98,VarName99,VarName100,VarName101,VarName102,VarName103,VarName104,VarName105,VarName106,VarName107,VarName108,VarName109,VarName110,VarName111,VarName112,VarName113,VarName114,VarName115,VarName116,VarName117,VarName118,VarName119,VarName120,VarName121,VarName122,VarName123,VarName124,VarName125,VarName126,VarName127,VarName128,VarName129,VarName130,VarName131,VarName132,VarName133,VarName134,VarName135,VarName136,VarName137,VarName138,VarName139,VarName140,VarName141,VarName142,VarName143,VarName144,VarName145,VarName146,VarName147,VarName148,VarName149]
%   = IMPORTFILE(FILE) reads data from the first worksheet in the Microsoft
%   Excel spreadsheet file named FILE and returns the data as column
%   vectors.
%
%   [VarName1,VarName2,VarName3,VarName4,VarName5,VarName6,VarName7,VarName8,VarName9,VarName10,VarName11,VarName12,VarName13,VarName14,VarName15,VarName16,VarName17,VarName18,VarName19,VarName20,VarName21,VarName22,VarName23,VarName24,VarName25,VarName26,VarName27,VarName28,VarName29,VarName30,VarName31,VarName32,VarName33,VarName34,VarName35,VarName36,VarName37,VarName38,VarName39,VarName40,VarName41,VarName42,VarName43,VarName44,VarName45,VarName46,VarName47,VarName48,VarName49,VarName50,VarName51,VarName52,VarName53,VarName54,VarName55,VarName56,VarName57,VarName58,VarName59,VarName60,VarName61,VarName62,VarName63,VarName64,VarName65,VarName66,VarName67,VarName68,VarName69,VarName70,VarName71,VarName72,VarName73,VarName74,VarName75,VarName76,VarName77,VarName78,VarName79,VarName80,VarName81,VarName82,VarName83,VarName84,VarName85,VarName86,VarName87,VarName88,VarName89,VarName90,VarName91,VarName92,VarName93,VarName94,VarName95,VarName96,VarName97,VarName98,VarName99,VarName100,VarName101,VarName102,VarName103,VarName104,VarName105,VarName106,VarName107,VarName108,VarName109,VarName110,VarName111,VarName112,VarName113,VarName114,VarName115,VarName116,VarName117,VarName118,VarName119,VarName120,VarName121,VarName122,VarName123,VarName124,VarName125,VarName126,VarName127,VarName128,VarName129,VarName130,VarName131,VarName132,VarName133,VarName134,VarName135,VarName136,VarName137,VarName138,VarName139,VarName140,VarName141,VarName142,VarName143,VarName144,VarName145,VarName146,VarName147,VarName148,VarName149]
%   = IMPORTFILE(FILE,SHEET) reads from the specified worksheet.
%
%   [VarName1,VarName2,VarName3,VarName4,VarName5,VarName6,VarName7,VarName8,VarName9,VarName10,VarName11,VarName12,VarName13,VarName14,VarName15,VarName16,VarName17,VarName18,VarName19,VarName20,VarName21,VarName22,VarName23,VarName24,VarName25,VarName26,VarName27,VarName28,VarName29,VarName30,VarName31,VarName32,VarName33,VarName34,VarName35,VarName36,VarName37,VarName38,VarName39,VarName40,VarName41,VarName42,VarName43,VarName44,VarName45,VarName46,VarName47,VarName48,VarName49,VarName50,VarName51,VarName52,VarName53,VarName54,VarName55,VarName56,VarName57,VarName58,VarName59,VarName60,VarName61,VarName62,VarName63,VarName64,VarName65,VarName66,VarName67,VarName68,VarName69,VarName70,VarName71,VarName72,VarName73,VarName74,VarName75,VarName76,VarName77,VarName78,VarName79,VarName80,VarName81,VarName82,VarName83,VarName84,VarName85,VarName86,VarName87,VarName88,VarName89,VarName90,VarName91,VarName92,VarName93,VarName94,VarName95,VarName96,VarName97,VarName98,VarName99,VarName100,VarName101,VarName102,VarName103,VarName104,VarName105,VarName106,VarName107,VarName108,VarName109,VarName110,VarName111,VarName112,VarName113,VarName114,VarName115,VarName116,VarName117,VarName118,VarName119,VarName120,VarName121,VarName122,VarName123,VarName124,VarName125,VarName126,VarName127,VarName128,VarName129,VarName130,VarName131,VarName132,VarName133,VarName134,VarName135,VarName136,VarName137,VarName138,VarName139,VarName140,VarName141,VarName142,VarName143,VarName144,VarName145,VarName146,VarName147,VarName148,VarName149]
%   = IMPORTFILE(FILE,SHEET,STARTROW,ENDROW) reads from the specified
%   worksheet for the specified row interval(s). Specify STARTROW and
%   ENDROW as a pair of scalars or vectors of matching size for
%   dis-contiguous row intervals. To read to the end of the file specify an
%   ENDROW of inf.
%
%	Non-numeric cells are replaced with: NaN
%
% Example:
%   [VarName1,VarName2,VarName3,VarName4,VarName5,VarName6,VarName7,VarName8,VarName9,VarName10,VarName11,VarName12,VarName13,VarName14,VarName15,VarName16,VarName17,VarName18,VarName19,VarName20,VarName21,VarName22,VarName23,VarName24,VarName25,VarName26,VarName27,VarName28,VarName29,VarName30,VarName31,VarName32,VarName33,VarName34,VarName35,VarName36,VarName37,VarName38,VarName39,VarName40,VarName41,VarName42,VarName43,VarName44,VarName45,VarName46,VarName47,VarName48,VarName49,VarName50,VarName51,VarName52,VarName53,VarName54,VarName55,VarName56,VarName57,VarName58,VarName59,VarName60,VarName61,VarName62,VarName63,VarName64,VarName65,VarName66,VarName67,VarName68,VarName69,VarName70,VarName71,VarName72,VarName73,VarName74,VarName75,VarName76,VarName77,VarName78,VarName79,VarName80,VarName81,VarName82,VarName83,VarName84,VarName85,VarName86,VarName87,VarName88,VarName89,VarName90,VarName91,VarName92,VarName93,VarName94,VarName95,VarName96,VarName97,VarName98,VarName99,VarName100,VarName101,VarName102,VarName103,VarName104,VarName105,VarName106,VarName107,VarName108,VarName109,VarName110,VarName111,VarName112,VarName113,VarName114,VarName115,VarName116,VarName117,VarName118,VarName119,VarName120,VarName121,VarName122,VarName123,VarName124,VarName125,VarName126,VarName127,VarName128,VarName129,VarName130,VarName131,VarName132,VarName133,VarName134,VarName135,VarName136,VarName137,VarName138,VarName139,VarName140,VarName141,VarName142,VarName143,VarName144,VarName145,VarName146,VarName147,VarName148,VarName149] = importfile('to Moham.xlsx','Day by Day Data',3,3602);
%
%   See also XLSREAD.

% Auto-generated by MATLAB on 2018/06/28 11:39:55

%% Input handling

% If no sheet is specified, read first sheet
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% If row start and end points are not specified, define defaults
if nargin <= 3
    startRow = 3;
    endRow = 3602;
end

%% Import the data, extracting spreadsheet dates in Excel serial date format
[~, ~, raw, dates] = xlsread(workbookFile, sheetName, sprintf('A%d:ES%d',startRow(1),endRow(1)),'' , @convertSpreadsheetExcelDates);
for block=2:length(startRow)
    [~, ~, tmpRawBlock,tmpDateNumBlock] = xlsread(workbookFile, sheetName, sprintf('A%d:ES%d',startRow(block),endRow(block)),'' , @convertSpreadsheetExcelDates);
    raw = [raw;tmpRawBlock]; %#ok<AGROW>
    dates = [dates;tmpDateNumBlock]; %#ok<AGROW>
end
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
notnumeric = [3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,55,56,57,58,89];
numeric = [2,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149];
cellVectors = raw(:,notnumeric);
raw = raw(:,numeric);
dates = dates(:,1);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),dates); % Find non-numeric cells
dates(R) = {NaN}; % Replace non-numeric Excel dates with NaN

%% Create output variable
I = cellfun(@(x) ischar(x), raw);
raw(I) = {NaN};
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
dates(~cellfun(@(x) isnumeric(x) || islogical(x), dates)) = {NaN};
VarName1 = datetime([dates{:,1}].', 'ConvertFrom', 'Excel');
VarName2 = data(:,1);
VarName3 = cellVectors(:,1);
VarName4 = cellVectors(:,2);
VarName5 = cellVectors(:,3);
VarName6 = cellVectors(:,4);
VarName7 = cellVectors(:,5);
VarName8 = cellVectors(:,6);
VarName9 = cellVectors(:,7);
VarName10 = cellVectors(:,8);
VarName11 = cellVectors(:,9);
VarName12 = cellVectors(:,10);
VarName13 = cellVectors(:,11);
VarName14 = cellVectors(:,12);
VarName15 = cellVectors(:,13);
VarName16 = cellVectors(:,14);
VarName17 = cellVectors(:,15);
VarName18 = cellVectors(:,16);
VarName19 = cellVectors(:,17);
VarName20 = cellVectors(:,18);
VarName21 = data(:,2);
VarName22 = data(:,3);
VarName23 = data(:,4);
VarName24 = data(:,5);
VarName25 = data(:,6);
VarName26 = data(:,7);
VarName27 = data(:,8);
VarName28 = data(:,9);
VarName29 = data(:,10);
VarName30 = data(:,11);
VarName31 = data(:,12);
VarName32 = data(:,13);
VarName33 = data(:,14);
VarName34 = data(:,15);
VarName35 = data(:,16);
VarName36 = data(:,17);
VarName37 = data(:,18);
VarName38 = data(:,19);
VarName39 = data(:,20);
VarName40 = data(:,21);
VarName41 = data(:,22);
VarName42 = data(:,23);
VarName43 = data(:,24);
VarName44 = data(:,25);
VarName45 = data(:,26);
VarName46 = data(:,27);
VarName47 = data(:,28);
VarName48 = data(:,29);
VarName49 = data(:,30);
VarName50 = data(:,31);
VarName51 = data(:,32);
VarName52 = data(:,33);
VarName53 = data(:,34);
VarName54 = data(:,35);
VarName55 = cellVectors(:,19);
VarName56 = data(:,37);
VarName57 = data(:,38);
VarName58 = data(:,39);
VarName59 = data(:,40);
VarName60 = data(:,41);
VarName61 = data(:,42);
VarName62 = data(:,43);
VarName63 = data(:,44);
VarName64 = data(:,45);
VarName65 = data(:,46);
VarName66 = data(:,47);
VarName67 = data(:,48);
VarName68 = data(:,49);
VarName69 = data(:,50);
VarName70 = data(:,51);
VarName71 = data(:,52);
VarName72 = data(:,53);
VarName73 = data(:,54);
VarName74 = 
VarName75 = cellVectors(:,20);
VarName76 = cellVectors(:,21);
VarName77 = cellVectors(:,22);
VarName78 = data(:,59);
VarName79 = data(:,60);
VarName80 = data(:,61);
VarName81 = data(:,62);
VarName82 = data(:,63);
VarName83 = data(:,64);
VarName84 = data(:,65);
VarName85 = data(:,66);
VarName86 = data(:,67);
VarName87 = data(:,68);
VarName88 = data(:,69);
VarName89 = data(:,70);
VarName90 = data(:,71);
VarName91 = data(:,72);
VarName92 = data(:,73);
VarName93 = data(:,74);
VarName94 = data(:,75);
VarName95 = data(:,76);
VarName96 = data(:,77);
VarName97 = data(:,78);
VarName98 = data(:,79);
VarName99 = data(:,80);
VarName100 = data(:,81);
VarName101 = data(:,82);
VarName102 = data(:,83);
VarName103 = data(:,84);
VarName104 = data(:,85);
VarName105 = data(:,86);
VarName106 = data(:,87);
VarName107 = data(:,88);
VarName108 = cellVectors(:,23);
VarName109 = data(:,90);
VarName110 = data(:,91);
VarName111 = data(:,92);
VarName112 = data(:,93);
VarName113 = data(:,94);
VarName114 = data(:,95);
VarName115 = data(:,96);
VarName116 = data(:,97);
VarName117 = data(:,98);
VarName118 = data(:,99);
VarName119 = data(:,100);
VarName120 = data(:,101);
VarName121 = data(:,102);
VarName122 = data(:,103);
VarName123 = data(:,104);
VarName124 = data(:,105);
VarName125 = data(:,106);
VarName126 = data(:,107);
VarName127 = data(:,108);
VarName128 = data(:,109);
VarName129 = data(:,110);
VarName130 = data(:,111);
VarName131 = data(:,112);
VarName132 = data(:,113);
VarName133 = data(:,114);
VarName134 = data(:,115);
VarName135 = data(:,116);
VarName136 = data(:,117);
VarName137 = data(:,118);
VarName138 = data(:,119);
VarName139 = data(:,120);
VarName140 = data(:,121);
VarName141 = data(:,122);
VarName142 = data(:,123);
VarName143 = data(:,124);
VarName144 = data(:,125);
% VarName145 = data(:,126);
% VarName146 = data(:,127);
% VarName147 = data(:,128);
% VarName148 = data(:,129);
% VarName149 = data(:,130);

mydata = [VarName2];
for ii = 1:size(numeric)
    %ff = eval(sprintf('VarName%3d',ii));
    ff=eval(sprintf('%s%02d','VarName',numeric(ii)));
    mydata = [mydata,ff];
end

mycell = VarName3;
for ii = 1:size(notnumeric)
    %ff = eval(sprintf('VarName%2d',ii));
    ff=eval(sprintf('VarName%d',notnumeric(ii)));
    mycell = [mycell,ff];
end
% For code requiring serial dates (datenum) instead of datetime, uncomment
% the following line(s) below to return the imported dates as datenum(s).

% VarName1=datenum(VarName1);

