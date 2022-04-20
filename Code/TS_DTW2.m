
clear;

load('data.mat');
sample_size = 50 ;
patient_size = 72 ;
window_size = 50 ;
num_features =149;
dist_matrix = zeros(patient_size,patient_size,num_features);
X(find(ismember(isnan(X),1))) = 0;

for m =1 : num_features
m
DTW_data2 = [];%zeros(patient_size,patient_size,num_features);
    
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
       
       vector = [vector , X(k + (tmp*72) , m)];
       tmp =tmp+1;
   end
   
   DTW_data2 = [DTW_data2 ; vector ];
   tmp = i;
   
end
end


for ii =1 : patient_size 
    
    for jj =1 : patient_size 
        
        if(ii ~= jj)
            dist_matrix(ii,jj,m) = dtw(DTW_data2(ii,1:(end-(sample_size-Last_date(ii)))),DTW_data2(jj,1:(end-(sample_size-Last_date(jj)))),0);
        end
    end
end

end

dist_matrix2 = sum(dist_matrix,3);

