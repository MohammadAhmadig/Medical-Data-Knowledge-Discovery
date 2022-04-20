
clear;

load('ZO_data');
load('ZO_noNAN0.mat');
sample_size = 50 ;
patient_size = 72 ;
window_size = 5 ;
Z_SL_data_noNAN = [];
%O_SL_data_noNAN_win1 = [];
count =1;

% concat win1
% concatZO_win1 = [zephyr_X omega_X];
% vec =[];
% for i =1:size(concatZO_win1,1)/72
%     vec = [vec [1:72]];
% end
% concatZO_win1 = [vec' concatZO_win1];
% culSize =size(concatZO_win1,2);
% for i=1 : patient_size
%     indxs = find(concatZO_win1(:,1)==i);
%     concatZO_win1(indxs,culSize+1)=Y(i);
%     
% end

%delete nan rows
% for i =1:size(zephyr_X,1)
%      if(sum(isnan(zephyr_X(count,:))) == length(zephyr_X(count,:)) || sum(isnan(zephyr_X(count,:))) == length(zephyr_X(count,:))-3 )
%          zephyr_X(count,:) = [];
%      else
%          count = count +1;
%      end
% end

%zephyr data to SL
% delete zero rows
% for i =1:size(Z_data_noNAN,1)
%      if(sum(Z_data_noNAN(count,5:end) == 0) >= 1 )
%          Z_data_noNAN(count,:) = [];
%      else
%          count = count +1;
%      end
% end

for i=1 : patient_size
    indxs = find(Z_data_noNAN(:,4)==i);

    for j=1: length(indxs)-(window_size-1)
        vector =[];
        for k=1 : window_size
            
            vector = [vector , Z_data_noNAN(indxs(j+k-1) , :)];
            
        end
        vector = [vector , Y(i) ];
        Z_SL_data_noNAN = [Z_SL_data_noNAN ; vector ];
    end
end

%previous
% sample_size = 26 ;
% for k =1 : patient_size 
%     tmp=0;
% for i=1 : sample_size-(window_size-1)
%    vector =[];
%    
%    for j=1 : window_size
%        
%        vector = [vector , Z_data_noNAN(k + (tmp*72) , :)];
%        tmp =tmp+1;
%    end
%    vector = [vector , Y(k) ];
%    Z_SL_data_noNAN_win1 = [Z_SL_data_noNAN_win1 ; vector ];
%    tmp = i;
%    
% end
% end

%omega data to SL
% for i=1 : patient_size
%     indxs = find(O_data_noNAN(:,1)==i);
% 
%     for j=1: length(indxs)-(window_size-1)
%         vector =[];
%         for k=1 : window_size
%             
%             vector = [vector , O_data_noNAN(indxs(j+k-1) , :)];
%             
%         end
%         vector = [vector , Y(i) ];
%         O_SL_data_noNAN_win1 = [O_SL_data_noNAN_win1 ; vector ];
%     end
% end





















% for k =1 : patient_size 
%     k
%     tmp=0;
%     flag=0;
%     counter = 0;
% for i=1 : sample_size-4
% if(flag == 0)
%    window_size = 5;
%    vector =[];
%        
%    while(window_size > 0)
%        % for delete nan_rows if vector is nan go to next row and plus
%        % winSize
%        if( sum(isnan(zephyr_X(k + (tmp*72),:))) == length(zephyr_X(k + (tmp*72),:)) )%if row is NaN
%            counter = counter +1;
%        else
%            vector = [vector , zephyr_X(k + (tmp*72) , :)];% omega_X and zephyr_X
%            window_size = window_size - 1;
%        end
%        
%        tmp =tmp+1;
%        if(tmp == 50)
%            flag =1;
%            break;
%        end
%    end
%    if(flag == 0)
%    vector = [vector , Y(k) ];
%    Z_SL_data_noNAN = [Z_SL_data_noNAN ; vector ];
%    tmp = i+counter;
%    end
% end
% end
% end
% 
% 
