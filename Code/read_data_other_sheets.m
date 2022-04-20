clear;
sheet = 4;
range = 'A3:ES3602';
startRow = 2;
endRow = 73;

num_of_sheets = 4;
myData = cell(1,num_of_sheets);
fileName = 'to Moham.xlsx';

for sheetNum = 1:1%num_of_sheets
    %fileName = sprintf('myfile%02d.xlsx',sheetNum);
    [raw] = importfile2(fileName,sheet,startRow,endRow);
end

Last_date = zeros(size(raw,1),1);
Y = zeros(size(raw,1),1);
for i = 1:size(raw,1)
    
    if(strcmp(raw(i,2),'X'))
        Y(i) = 1;
    end
    if( cell2mat(cellfun(@isstr, raw(i,4), 'UniformOutput', false)) )
        digits = strsplit(raw{i,4},'/');
        if( str2num(cell2mat(digits(1))) == 5) % month is 30 days
            Last_date(i) = ((str2num(cell2mat(digits(1))) - 4 ) * 30) + ( str2num(cell2mat(digits(2))) - 20);
        else % month is 31 days
            Last_date(i) = ((str2num(cell2mat(digits(1))) - 4 ) * 30) + ( str2num(cell2mat(digits(2))) - 20) +1;
        end
        
    else
        
    end
end

