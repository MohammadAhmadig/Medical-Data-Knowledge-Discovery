
clear;

load('data.mat');
sample_size = 50 ;
patient_size = 72 ;
window_size = 50 ;
num_features =149;
DTW_data1 = [];
X(find(ismember(isnan(X),1))) = 0;

for k =1 : patient_size 
    tmp=0;
for i=1 : sample_size-49
   vector =[];
%    if(Last_date(k) ~= 0)
%        window_size = Last_date(k);
%    else
%        window_size = 50 ;
%    end
   
   for j=1 : window_size
       
       vector = [vector , X(k + (tmp*72) , :)];
       tmp =tmp+1;
   end
   
   DTW_data1 = [DTW_data1 ; vector ];
   tmp = i;
   
end
end

dist_matrix1 = zeros(patient_size);
for i =1 : patient_size 
    i
    for j =1 : patient_size 
        j
        if(i ~= j)
            dist_matrix1(i,j) = dtw(DTW_data1(i,1:(end-((sample_size-Last_date(i))*num_features))),DTW_data1(j,1:(end-((sample_size-Last_date(j))*num_features))),0);
        end
    end
end



