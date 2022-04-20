
clear;

load('data.mat');
y = SL_data(:,end);
x = SL_data(:,1:end-1);
%x(find(ismember(isnan(x),1))) = 0;%%%%%%%%%%%%%%%


CVO = cvpartition(y,'k',10); % Stratified cross-validation
for i = 1:CVO.NumTestSets
    trIdx = CVO.training(i);
    teIdx = CVO.test(i);
    mdl = fitensemble(x(trIdx,:),y(trIdx,:),'AdaboostM1',20,'Tree');
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
std(acc)

figure
plot(acc,'-o')
title('10 Fold Accuracy ')
xlabel('Folds')
ylabel('Accuracy')

figure
plot(precision,'-o')
title('10 Fold Precision ')
xlabel('Folds')
ylabel('Precision')

figure
plot(recall,'-o')
title('10 Fold Recall ')
xlabel('Folds')
ylabel('Recall')

figure
plot(Fmeasure,'-o')
title('10 Fold Fmeasure ')
xlabel('Folds')
ylabel('Fmeasure')

