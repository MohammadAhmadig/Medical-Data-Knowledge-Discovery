sheet = 1;
range = 'A3:ES3602';
startRow = 3;
endRow = 3602;

num_of_sheets = 4;
myData = cell(1,num_of_sheets);
fileName = 'to Moham.xlsx';

for sheetNum = 1:1%num_of_sheets
    %fileName = sprintf('myfile%02d.xlsx',sheetNum);
    [raw] = importfile2(fileName,sheet,startRow,endRow);
end

%save('newloaddata')

% load('load_data.mat');
for j = 3:size(raw,2)
    j
    if(j==55 || j==56 || j==57 || j==58 || j==89 ) 
        strIdx = find(cell2mat(cellfun(@isstr, raw(:,j), 'UniformOutput', false)));
        myCell2(strIdx,j) = grp2idx(raw(strIdx,j));% NAN toosh bood
        
        nanIdx = find(ismember(cell2mat(cellfun(@isstr, raw(:,j), 'UniformOutput', false)),0));
        myCell2(nanIdx,j) = NaN;
    else%if(j~=55 && j~=56 && j~=57 && j~=58 && j~=89 )
        
    temp={};
    for i = 1:size(raw,1)
        str = raw(i,j);
        
        if( strcmp(str,'  ') )
            
            myCell2(i,j) = NaN;
            
        
            
        
        elseif(strcmp(str,'N/A'))
            myCell2(i,j) = NaN;
%         elseif(strfind(str,'e3') == 2)% for 1e3 and ..
%             temp1 = str2num(str);
            
        % digit stay digit and strings become digit
%         elseif( length(num2str(str2num(str),15)) == length(str) )
%             index = str2num(str);
        
%         else
%             index = find(ismember(temp,str));
%             if(isempty(index))
%                 temp{end+1} = str;
%                 index = length(temp);
%             end
%         end
%         elseif(ismember(cell2mat(cellfun(@isstr, raw(:,j), 'UniformOutput', false)),0))% if nan
%             myCell2(i,j) = cell2mat(raw(i,j));
        elseif(j==66 && cell2mat(cellfun(@isstr, str, 'UniformOutput', false)) )
            digits = strsplit(raw{i,j},'-');
            mini = str2num(cell2mat(digits(1)));
            maxi = str2num(cell2mat(digits(2)));
            meani = (mini + maxi)/2;
            myCell2(i,j) = meani;
            myCell2(i,1) = mini;
            myCell2(i,2) = maxi;
        elseif(i == 29  && j==101)
            myCell2(i,j) = 1600;
        elseif(i == 16  && j==105)
            myCell2(i,j) = 1000;
        elseif(i == 49  && j==107)
            myCell2(i,j) = 1500;
        elseif(i == 174  && j==107)
            myCell2(i,j) = 1500;
        else
            myCell2(i,j) = cell2mat(raw(i,j));
        end
      
        
    end
    end
end

DATASET2 = myCell2;

%DATASET = [myData(:,1) , myCell2 , myData(:,2:end)];
% 
% save('load_data2');
% 
% 
