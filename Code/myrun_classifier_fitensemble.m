
clear;

load('data.mat');
y = SL_data(:,end);
%X(:,[1 5 7 9 11 16])= XX;
x = SL_data(:,1:end-1);
%corrInd = ind(771:870);

%x(:,21) = y + rand(345,1)*0.1;

holdoutCVP = cvpartition(y,'holdout',700);%%%%
xtrain = x(holdoutCVP.training,:); xtest = x(holdoutCVP.test,:);
ytrain = y(holdoutCVP.training); ytest = y(holdoutCVP.test);
%for i = [0.01 , 0.1 , 1 ,10,100]
c=6;
sigma=1;
%mdl = fitcsvm(xtrain(:,indxxx), ytrain,'KernelFunction','RBF','KernelScale','auto','BoxConstraint',c);
%mdl = TreeBagger(25,xtrain(:,indxxx),ytrain,'Method','classification');
mdl = fitensemble(xtrain(:,:),ytrain,'AdaBoostM1',20,'Tree');
ypred = predict(mdl , xtest(:,:));
% acc
%acc=(length(ytest) - sum(ytest ~= ypred) ) / length(ytest) 
%acc=(length(ytest) - sum(ytest ~= str2num(cell2mat(ypred))) ) / length(ytest) 

% precision 
% ind1 = 1 == ypred;
% ind0 = 0 == ypred;
acc=(length(ytest) - sum(ytest ~= ypred) ) / length(ytest) 
% precision 
ind1 = 1 == ypred;
ind0 = 0 == ypred;
tp = sum(ytest(ind1) == ypred(ind1));
tn = sum(ytest(ind0) == ypred(ind0));
fp = sum(ytest(ind1) ~= ypred(ind1));
fn = sum(ytest(ind0) ~= ypred(ind0));
precision = (tp)/(tp+fp)
recall = (tp)/(tp+fn)
Fmeasure = 2*((precision*recall)/(precision+recall))
%end
% cp = cvpartition(y,'k',10); % Stratified cross-validation
% opts = statset('display','iter');
% 
% c= 1;
% f = @(xtrain, ytrain, xtest, ytest) sum(predict(fitcsvm(xtrain, ytrain,'Standardize',true,'ClassNames',[1,0],'BoxConstraint',c),xtest) ~= ytest);
% 
% fs = sequentialfs(f,x,y,'cv',cp,'options',opts,'nfeatures',9)
% 
