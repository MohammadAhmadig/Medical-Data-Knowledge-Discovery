
clear;

load('data.mat');
sample_size = 50 ;
patient_size = 72 ;
window_size = 5 ;
SL_data = [];


for k =1 : patient_size 
    tmp=0;
for i=1 : sample_size-4
   vector =[];
   
   
   for j=1 : window_size
       
       vector = [vector , X(k + (tmp*72) , :)];
       tmp =tmp+1;
   end
   vector = [vector , Y(k) ];
   SL_data = [SL_data ; vector ];
   tmp = i;
   
end
end





