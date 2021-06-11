clear;
close all force;
clc;
tic;

result_file = "E:\DoC_elife\all_result.xlsx";
train_set = readtable(result_file, 'sheet', 'train');
test_set = readtable(result_file, 'sheet', 'test');

%使用one-hot对病因编码
train_etilogy = train_set{:, 5};
test_etilogy = test_set{:, 5};

train_size = size(train_etilogy,1);
test_size = size(test_etilogy,1);

for i = 1:train_size
    train_etilogy_detail = train_etilogy{i};
    if(strcmp(train_etilogy_detail, 'trauma'))
        i_etilogy = 1;
    end
    
    if(strcmp(train_etilogy_detail, 'stroke'))
        i_etilogy = 2;
    end
    
    if(strcmp(train_etilogy_detail, 'nontrauma'))
        i_etilogy = 3;
    end
    Ttrain_etilogy(i,1) = i_etilogy;
end
onehot_train_etilogy = dummyvar(Ttrain_etilogy);
age_train = train_set{:, 3};
duration_train = train_set{:, 4};
train_DoC_clinical_characteristics = [age_train, duration_train, onehot_train_etilogy];
train_DoC_FC_feature = train_set{:, 7:412};
Xtrain = [train_DoC_clinical_characteristics, train_DoC_FC_feature];
ytrain = train_set{:, 2};
%onehot_etilogy
%xlswrite(result_file, onehot_etilogy, 'train', 'E2:E64');
for i = 1:test_size
    test_etilogy_detail = test_etilogy{i};
    if(strcmp(test_etilogy_detail, 'trauma'))
        i_etilogy = 1;
    end
    
    if(strcmp(test_etilogy_detail, 'stroke'))
        i_etilogy = 2;
    end
    
    if(strcmp(test_etilogy_detail, 'nontrauma'))
        i_etilogy = 3;
    end
    Ttest_etilogy(i,1) = i_etilogy;
end

onehot_test_etilogy = dummyvar(Ttest_etilogy);
age_test = test_set{:, 3};
duration_test = test_set{:, 4};
test_DoC_clinical_characteristics = [age_test, duration_test, onehot_test_etilogy];
test_DoC_FC_feature = test_set{:, 7:412};
Xtest = [test_DoC_clinical_characteristics, test_DoC_FC_feature];
ytest = test_set{:, 2};

%特征提取
cvp = cvpartition(ytrain,'kfold',5, 'Stratify',true);%size(W2_trainingset_has_feature_750,1)
numtestsets = cvp.NumTestSets;
%创建数组来存储损失值
n = length(ytrain);
lambdavals = linspace(0,20,20)/n; %生成一个等差的行向量
lossvals = zeros(length(lambdavals),numtestsets);
for i = 1:length(lambdavals)
    for k = 1:numtestsets
        X = Xtrain(cvp.training(k),:);
        y = ytrain(cvp.training(k),:);
        Xvalid = Xtrain(cvp.test(k),:);
        yvalid = ytrain(cvp.test(k),:);

        nca = fscnca(X,y,'FitMethod','exact', ...
             'Solver','lbfgs','Lambda',lambdavals(i), ...
             'IterationLimit',30,'GradientTolerance',1e-4, ...
             'Standardize',true);
                  
        lossvals(i,k) = loss(nca,Xvalid,yvalid,'LossFunction','classiferror');
    end
end
meanloss = mean(lossvals,2);
figure();
plot(lambdavals,meanloss,'ro-');
xlabel('Lambda');
ylabel('Loss (MSE)');
grid on;
[~,idx] = min(meanloss);
%idx
bestlambda = lambdavals(idx);
bestloss = meanloss(idx);

nca = fscnca(Xtrain,ytrain,'FitMethod','exact','Solver','lbfgs',...
    'Lambda',bestlambda,'Standardize',true,'Verbose',1);
figure();
plot(nca.FeatureWeights,'ro');
xlabel('Feature index');
ylabel('Feature weight');
grid on;
