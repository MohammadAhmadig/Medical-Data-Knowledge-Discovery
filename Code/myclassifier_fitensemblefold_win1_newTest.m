
clear;

load('fillData.mat');
load('data.mat');

WEKA_HOME = 'C:\Program Files\Weka-3-8';
javaaddpath('\weka.jar');
% load('ZO_data.mat');
% load('ZO_noNAN.mat');
% y = O_SL_data_noNAN(:,end);
% x = O_SL_data_noNAN(:,2:end-1);%% 2 or 1
%%%%%%%%%%%%%%%%%
y = SL_dataC(:,end);
x = SL_dataC(:,1:end-1);%% 2 or 1

%x(find(ismember(isnan(x),1))) = 0;%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%

CVO = cvpartition(Y,'k',10); % Stratified cross-validation
for i = 1:CVO.NumTestSets
    i
    trIdx = CVO.training(i);
    teIdx = CVO.test(i);
    trIdx = find(ismember(SL_dataZ(:,4),find(trIdx)));% o 1 and z 4
    teIdx = find(ismember(SL_dataZ(:,4),find(teIdx)));
    %mdl = fitensemble(x(trIdx,:),y(trIdx,:),'AdaboostM1',20,'Tree');%,'Type','Classification'
    
    Train = [x(trIdx,:) y(trIdx,:)];
    Test = [x(teIdx,:) y(teIdx,:)];
    save train.txt Train -ascii
    save test.txt Test -ascii
    
    ArffTrain = convertToArff('train.txt');
    ArffTest = convertToArff('test.txt');
    
    % Train a J48 classifier
    classifier = weka.classifiers.trees.J48();%J48();
    %classifier = weka.classifiers.trees.RandomForest();
    classifier.buildClassifier(ArffTrain);
    %classifiers = classifier;
    
    % Classify test instances
    numInst = ArffTest.numInstances();
    for k=1:numInst
        
        temp = classifier.classifyInstance(ArffTest.instance(k-1));
        ypred(k,1) = str2num(char(ArffTest.classAttribute().value((temp)))); % Predicted labels
    end
    
    testLabels = y(teIdx,:);
    est_labesl = ypred;
    acc(i) = (sum(est_labesl == testLabels) / length(testLabels)) * 100;
    ypred =[];
end

mean(acc)
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

