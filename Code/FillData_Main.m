
clear;

load('fillNanDataLin.mat');
load('data.mat');
% sample_size = 50 ;
% patient_size = 72 ;
% window_size = 5 ;
% SL_dataZ = [];SL_dataO = [];SL_dataC = [];
% 
% 
% for k =1 : patient_size 
%     tmp=0;
% for i=1 : sample_size-4
%    vectorZ =[];
%    vectorO =[];
%    vectorC =[];
%    
%    for j=1 : window_size
%        vectorZ = [vectorZ , zephyr_fill(k + (tmp*72) , :)];
%        vectorO = [vectorO , omega_fill(k + (tmp*72) , :)];
%        vectorC = [vectorC , concat_fill(k + (tmp*72) , :)];
%        tmp =tmp+1;
%    end
%    vectorZ = [vectorZ , Y(k) ];
%    vectorO = [vectorO , Y(k) ];
%    vectorC = [vectorC , Y(k) ];
%    
%    SL_dataZ = [SL_dataZ ; vectorZ ];
%    SL_dataO = [SL_dataO ; vectorO ];
%    SL_dataC = [SL_dataC ; vectorC ];
%    tmp = i;
%    
% end
% end
% save('fillDataMed','SL_dataZ','SL_dataO','SL_dataC');

load('fillDataMed.mat');
y = SL_dataC(:,end);
x = SL_dataC(:,1:end-1);%% 2 or 1

CVO = cvpartition(Y,'k',10); % Stratified cross-validation
for i = 1:CVO.NumTestSets
    trIdx = CVO.training(i);
    teIdx = CVO.test(i);
    trIdx = find(ismember(SL_dataZ(:,4),find(trIdx)));%z 4
    teIdx = find(ismember(SL_dataZ(:,4),find(teIdx)));
    mdl = fitensemble(x(trIdx,:),y(trIdx,:),'AdaboostM1',20,'Tree');%,'Type','Classification'
%     c=1;
%     sigma=1;
%     mdl = fitcsvm(x(trIdx,:),y(trIdx,:),'KernelFunction','RBF','KernelScale','auto','BoxConstraint',c);
%     
    ypred = predict(mdl , x(teIdx,:));
    ytest = y(teIdx);
    
    
    acc(i)=(length(ytest) - sum(ytest ~= (ypred)) ) / length(ytest) 

    % precision
    ind1 = 1 == ypred;
    ind0 = 0 == ypred;
    
    tp = sum(ytest(ind1) == ypred(ind1));
    tn = sum(ytest(ind0) == ypred(ind0));
    fp = sum(ytest(ind1) ~= ypred(ind1));
    fn = sum(ytest(ind0) ~= ypred(ind0));
    precision(i) = (tp)/(tp+fp)
    recall(i) = (tp)/(tp+fn)
    Fmeasure(i) = 2*((precision(i)*recall(i))/(precision(i)+recall(i)))
end

mean(acc)
mean(Fmeasure)
std(acc)

% figure
% plot(acc,'-o')
% title('10 Fold Accuracy ')
% xlabel('Folds')
% ylabel('Accuracy')
%
% figure
% plot(precision,'-o')
% title('10 Fold Precision ')
% xlabel('Folds')
% ylabel('Precision')
% 
% figure
% plot(recall,'-o')
% title('10 Fold Recall ')
% xlabel('Folds')
% ylabel('Recall')
% 
% figure
% plot(Fmeasure,'-o')
% title('10 Fold Fmeasure ')
% xlabel('Folds')
% ylabel('Fmeasure')




