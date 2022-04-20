
clear;

load('ZO_data');
%load('ZO_noNAN.mat');
sample_size = 50 ;
patient_size = 72 ;
window_size = 10 ;
count=1;
% omega_X in zo_data , X in data

for i =1:size(zephyr_X,1)
     if(sum(zephyr_X(count,5:end) == 0) >= 1 )
         zephyr_X(count,:) = NaN;
     else
         count = count +1;
     end
end
concat_fill = [zephyr_X omega_X];
zephyr_fill = zephyr_X;
omega_fill = omega_X;
% number_of_row
vec =[];
for i =1:size(zephyr_X,1)/72
    vec = [vec [1:72]];
end
vec = vec';

%fill nan with Linear Interpolation 
for i =1:patient_size
    indxs = find(vec == i);
    zephyr_fill(indxs,:) = fillmissing(zephyr_fill(indxs,:),'linear',1,'EndValues','nearest');%'EndValues','nearest'
    
end

%fill nan with median window
% for i =1:patient_size
%     indxs = find(vec == i);
%     zephyr_fill(indxs,:) = fillmissing(zephyr_fill(indxs,:),'movmedian',window_size,'EndValues','nearest');
%     
% end
zz=zephyr_fill(indxs,:);

%fill nan with Linear Interpolation 
for i =1:patient_size
    indxs = find(vec == i);
    omega_fill(indxs,:) = fillmissing(omega_fill(indxs,:),'linear',1,'EndValues','nearest');%'EndValues','nearest'
    
end

%fill nan with median window
% for i =1:patient_size
%     indxs = find(vec == i);
%     omega_fill(indxs,:) = fillmissing(omega_fill(indxs,:),'movmedian',window_size,'EndValues','nearest');
%     
% end


%fill nan with Linear Interpolation 
for i =1:patient_size
    indxs = find(vec == i);
    concat_fill(indxs,:) = fillmissing(concat_fill(indxs,:),'linear',1,'EndValues','nearest');%'EndValues','nearest'
    
end

%fill nan with median window
% for i =1:patient_size
%     indxs = find(vec == i);
%     concat_fill(indxs,:) = fillmissing(concat_fill(indxs,:),'movmedian',window_size,'EndValues','nearest');
%     
% end


save('fillNanDataLin0','zephyr_fill','omega_fill','concat_fill');

