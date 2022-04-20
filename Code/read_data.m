sheet = 1;
range = 'A3:ES3602';
startRow = 3;
endRow = 3602;

num_of_sheets = 4;
myData = cell(1,num_of_sheets);
fileName = 'to Moham.xlsx';

for sheetNum = 1:1%num_of_sheets
    %fileName = sprintf('myfile%02d.xlsx',sheetNum);
    [date ,myCell,myData] = importfile(fileName,sheet,startRow,endRow);
end

save('load_data')

% load('load_data.mat');
% for j = 1:size(myCell,2)
%     j
%     temp={};
%     for i = 1:size(myCell,1)
%         
%         str = myCell(i,j);
%         
%         if( strcmp(str,'') )
%             
%             myCell2(i,j) = NaN;
% %         elseif(strfind(str,'e3') == 2)% for 1e3 and ..
% %             index = str2num(str);
%             
%         % digit stay digit and strings become digit
% %         elseif( length(num2str(str2num(str),15)) == length(str) )
% %             index = str2num(str);
%         
% %         else
% %             index = find(ismember(temp,str));
% %             if(isempty(index))
% %                 temp{end+1} = str;
% %                 index = length(temp);
% %             end
% %         end
%         else
%             myCell2(i,j) = cell2mat(myCell(i,j));
%         end
%          
%         
%     end
% end
% 
% DATASET = [myData(:,1) , myCell2 , myData(:,2:end)];
% 
% save('load_data2');
% 
% 
