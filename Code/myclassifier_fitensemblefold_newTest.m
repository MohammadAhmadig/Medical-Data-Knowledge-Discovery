
clear;

%load('data.mat');
load('ZO_data.mat');
load('ZO_noNAN0.mat');
y = concatZO_win5_noNaNandZero(:,end);
x = concatZO_win5_noNaNandZero(:,1:end-1);%% 2 or 1
% y = concatZO_win1(:,end);
% x = concatZO_win1(:,2:end-1);%% 2 or 1
%%%%%%%%%%%%%%%%%
% y = SL_data_comZO(:,end);
% vec =[];
% for i =1:72
%     vec = [vec i*ones(1,46)];
% end
% SL_data_comZO = [vec' SL_data_comZO] ;
% x = SL_data_comZO(:,2:end-1);%% 2 or 1

%x(find(ismember(isnan(x),1))) = 0;%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
% SL_dataZ = [[1:size(SL_dataZ,2)];SL_dataZ];
% csvwrite('dataZ.csv',SL_dataZ);

CVO = cvpartition(Y,'k',10); % Stratified cross-validation
for i = 1:CVO.NumTestSets
    trIdx = CVO.training(i);
    teIdx = CVO.test(i);
    trIdx = find(ismember(concatZO_win5_noNaNandZero(:,4),find(trIdx)));% o 1 and c 1 and z 4
    teIdx = find(ismember(concatZO_win5_noNaNandZero(:,4),find(teIdx)));
    %mdl = fitensemble(x(trIdx,:),y(trIdx,:),'AdaboostM1',20,'Tree');%,'Type','Classification'
    mdl = fitensemble(x(trIdx,:),y(trIdx,:),'Bag',20,'Tree','Type','Classification');%,'Type','Classification'
%     c=1;
%     sigma=1;
%     mdl = fitcsvm(x(trIdx,:),y(trIdx,:),'KernelFunction','RBF','KernelScale','auto','BoxConstraint',c);
%     
    ypred = predict(mdl , x(teIdx,:));
    ytest = y(teIdx);
    
    %%%%%%%%%%%%%%%%%%%%%
    est=ypred;
    Test = x(teIdx,:);
    testID = find(CVO.test(i));
    for j =1: length(testID)
%         ids = find(ismember(idxxx,testID(j)));
%         est(ids)= mode(est(ids));
        ids = find(ismember(Test(:,4),testID(j)));
        est(ids)= mode(est(ids));
    end
    %%%%%%%%%%%%%%%%%%%%%
    
    acc(i)=(length(ytest) - sum(ytest ~= (ypred)) ) / length(ytest) 
    acc2(i)=(length(ytest) - sum(ytest ~= (est)) ) / length(ytest)

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
mean(acc2)
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

