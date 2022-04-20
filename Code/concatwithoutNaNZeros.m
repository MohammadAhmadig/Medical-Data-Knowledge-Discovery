clear;

load('ZO_data');
load('ZO_noNAN0.mat');
sample_size = 50 ;
patient_size = 72 ;
window_size = 5 ;
concatZO_win5_noNaNandZero =[];
%Z_SL_data_noNAN = [];
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


%delete nan and zero rows
% concatZO_win1_noNaNandZero =concatZO_win1;
% for i =1:size(concatZO_win1_noNaNandZero,1)
%      if(sum(isnan(concatZO_win1_noNaNandZero(count,:))) > 10 || sum(concatZO_win1_noNaNandZero(count,5:25) == 0) >= 1 )
%          concatZO_win1_noNaNandZero(count,:) = [];
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
    indxs = find(concatZO_win1_noNaNandZero(:,1)==i);

    for j=1: length(indxs)-(window_size-1)
        vector =[];
        for k=1 : window_size
            
            vector = [vector , concatZO_win1_noNaNandZero(indxs(j+k-1) , 2:end-1)];
            
        end
        vector = [vector , Y(i) ];
        concatZO_win5_noNaNandZero = [concatZO_win5_noNaNandZero ; vector ];
    end
end
