fprintf('logistic regression');
train_file = "F:\zxr_pDOC\train-test\train-20w-nosmote.xlsx";
train_set = readtable(train_file);
Xtrain1 = train_set{:, 3:20};
ytrain1 = train_set{:, 2};

test_file = "F:\zxr_pDOC\train-test\test-20w-nosmote.xlsx";
test_set = readtable(test_file);
Xtest1 = test_set{:, 3:20};
ytest1 = test_set{:, 2};
classNames = {'MCS', 'VS'};
figure;
hold on
plot([0:0.01:1],[0:0.01:1],'-','Color',[0.7,0.7,0.7]);
resp = strcmpi(ytest1,'MCS');
    
% linear svm
%Mdl_linear_svm = fitclinear(Xtrain1,ytrain1,'ClassNames',classNames,'Solver','sparsa','Regularization','lasso','Cost',[0 10; 1 0]);  % linear svm
Mdl_linear_svm = fitclinear(Xtrain1,ytrain1,'ClassNames',classNames);
[test_set_predicted_label_linear_svm,test_set_predicted_score_linear_svm] = predict(Mdl_linear_svm,Xtest1);
[X_linear_svm,Y_linear_svm,T_linear_svm,AUC_linear_svm, OPTROCPT_linear_svm] = perfcurve(resp,test_set_predicted_score_linear_svm(:,2),'true');
AUC_linear_svm
h1 = plot(X_linear_svm,Y_linear_svm,'LineWidth',2);
plot(OPTROCPT_linear_svm(1),OPTROCPT_linear_svm(2),'ro');
%resp_testing_set_predicted_label = strcmpi(test_set_predicted_label_linear_svm,'MCS');

% nonlinear svm
Mdl_nonlinear_svm = fitcsvm(Xtrain1,ytrain1,'ClassNames',classNames); % nonlinear svm
[test_set_predicted_label_nonlinear_svm,test_set_predicted_score_nonlinear_svm] = predict(Mdl_nonlinear_svm,Xtest1);
[X_nonlinear_svm,Y_nonlinear_svm,T_nonlinear_svm,AUC_nonlinear_svm, OPTROCPT_nonlinear_svm ] = perfcurve(resp,test_set_predicted_score_nonlinear_svm(:,1),'true');
AUC_nonlinear_svm
h2 = plot(X_nonlinear_svm,Y_nonlinear_svm,'LineWidth',2);
%plot(OPTROCPT_nonlinear_svm(1),OPTROCPT_nonlinear_svm(2),'ro');

%Logistic regression
Mdl_log = fitclinear(Xtrain1,ytrain1,'Learner','logistic','Solver','sparsa','Regularization','lasso', 'ClassNames', classNames);%,'Cost',[0 2; 1 0]
[training_set_predicted_label_log,training_set_predicted_score_log] = predict(Mdl_log,Xtest1);
[Xlog,Ylog,Tlog,AUC_log,OPTROCPT_log] = perfcurve(resp,training_set_predicted_score_log(:,1),'true');
AUC_log
h3 = plot(Xlog,Ylog,'LineWidth',2);

% decision tree
Mdl_tree = fitctree(Xtrain1,ytrain1, 'ClassNames', classNames);%构造分类树
%[test_set_predicted_label_tree,score_tree] = resubPredict(Mdl_tree);%用构造好的决策树做分类
[test_set_predicted_label_tree,score_tree] = predict(Mdl_tree, Xtest1);
[X_tree,Y_tree,T_tree,AUC_tree] = perfcurve(resp,score_tree(:,1),'true');
AUC_tree
h5 = plot(X_tree,Y_tree,'LineWidth',2);
    
% random forest
nTrees = 50;
Mdl_random_forest= TreeBagger(nTrees,Xtrain1,ytrain1, 'ClassNames', classNames,'OOBPrediction','On','Method','classification');
[training_set_predicted_label_random_forest,training_set_predicted_score_random_forest] = predict(Mdl_random_forest, Xtest1);
[X_random_forest,Y_random_forest,T_random_forest,AUC_random_forest] = perfcurve(resp,training_set_predicted_score_random_forest(:,1),'true');
AUC_random_forest
h6 = plot(X_random_forest,Y_random_forest,'LineWidth',2);

%legend([h3, h4, h1, h2, h5, h6],{'Logistic regression','Naive Bayes','Linear SVM','Nonlinear SVM','Decision tree','Random forest'},'Location','Best')
legend([h1, h2, h3, h5, h6],{'Linear SVM','Nonlinear SVM','Logistic regression','decision tree', 'random forest'},'Location','Best')
xlabel('False positive rate');
ylabel('True positive rate');
title('ROC Curves of test dataset for diagnosing DoC ')
hold off
%SVMModel = fitcsvm(Xtrain1,ytrain1,'KFold',3);
%pgroup = predict(SVMModel,Xtest1);
%ACC = sum(strcmp(pgroup,ytest1))/25;
%ACC