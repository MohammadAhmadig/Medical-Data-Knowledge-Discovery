clear;

load('data.mat');
load('distanceMatrix.mat');
k = 10;
dist_matrix2;

for times =1:10
CVO = cvpartition(Y,'k',10); % Stratified cross-validation
for i = 1:CVO.NumTestSets
    ypred = [];
    trIdx = CVO.training(i);
    teIdx = CVO.test(i);
    testIndxs = find(teIdx);
    
    for j=1:length(testIndxs)
        [~,indxs] = sort(dist_matrix1(testIndxs(j),trIdx)); indx=indxs(1:k);
        ypred(j) = mode(Y(indx));
    end
    ytest = Y(teIdx)';
    acc(i,times)=(length(ytest) - sum(ytest ~= (ypred)) ) / length(ytest) 

    % precision
    ind1 = 1 == (ypred);
    ind0 = 0 == (ypred);
    
    
    tp = sum(ytest(ind1) == (ypred(ind1)));
    tn = sum(ytest(ind0) == (ypred(ind0)));
    fp = sum(ytest(ind1) ~= (ypred(ind1)));
    fn = sum(ytest(ind0) ~= (ypred(ind0)));
    
    precision(i,times) = (tp)/(tp+fp)
    recall(i,times) = (tp)/(tp+fn)
    Fmeasure(i,times) = 2*((precision(i)*recall(i))/(precision(i)+recall(i)))
end

end
mean(mean(acc,2))
mean(mean(Fmeasure,2))
std(std(acc))

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
% 

