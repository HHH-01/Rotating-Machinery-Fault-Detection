cd 'C:\ML Projects\Rotating Machinery Fault Detection\Matlab'
%% This step is to load data from last step if needed
%%Load data
%clc;clearvars;close all;
%load("C:\ML Projects\Rotating Machinery Fault Detection\Matlab\Matlab_Data\data_processing_output");


%% Find important predictor using Decision Tree
NumClasses = 10;
%Find optimal number of split
for MaxSplits = NumClasses-1:1000
    disp(MaxSplits)
    mdl_pretrain = fitctree(output_ML(:, 1:(end-1)), output_ML(:,end),'MaxNumSplits',MaxSplits, SplitCriterion='deviance');
    [yhat_pretrain, yhat_scores_pretrain, costs_pretrain] = predict(mdl_pretrain, output_ML(:, 1:(end-1)));
    CFM_Stats_result_pretrain = CFM_Stats(output_ML(:,end), yhat_pretrain);
    CFM_data(MaxSplits,1) = (CFM_Stats_result_pretrain.Fscore(1)+CFM_Stats_result_pretrain.Fscore(2)+CFM_Stats_result_pretrain.Fscore(3)+...
        CFM_Stats_result_pretrain.Fscore(4)+CFM_Stats_result_pretrain.Fscore(5)+CFM_Stats_result_pretrain.Fscore(6)+...
        CFM_Stats_result_pretrain.Fscore(7)+CFM_Stats_result_pretrain.Fscore(8)+CFM_Stats_result_pretrain.Fscore(9)+...
        CFM_Stats_result_pretrain.Fscore(10))/10;
end

%% Find maximum Avreage Precision from all 3 classes using CFM_Data
[Max_CFM MaxSplits_Selected] = max(CFM_data(:,1));
%MaxSplits_Selected = 30
%Max Avg Fscore= 0.998
MaxSplits_Selected
CFM_data(MaxSplits_Selected)

% Plot Ave. Precision vs No.of Split
for MaxSplits = NumClasses-1:1000
    disp(MaxSplits);
    CFM_data(MaxSplits,2)=MaxSplits;
end  

%plot (CFM_data(:,2),CFM_data(:,1) );
%title('Average F-score vs. Number of Split');
%xlabel('Number of Split');
%ylabel('Ave. F-score');

%Plot Zoom in from 0-50 for x-axis
plot (CFM_data(:,2),CFM_data(:,1) );
xlim([0 50])
title('Average F-score vs. Number of Split');
xlabel('Number of Split');
ylabel('Ave. F-score');



%% Retrain the model with the selected MaxSplit
rng(1); % For reproducibility
mdl_selected= fitctree(output_ML_table(:, 1:(end-1)), output_ML_table(:,end),'MaxNumSplits',MaxSplits_Selected(1,1), SplitCriterion='deviance');
% CFM: To calculate Accuracy, Precision, Recall, F-score using CFM Function on trainning data
[yhat_train, yhat_scores_train, costs_train] = predict(mdl_selected, output_ML_table(:, 1:(end-1)));
CFM_Stats_result_train = CFM_Stats(output_ML(:,end), yhat_train)

%Estimate Predictor Importance
imp = predictorImportance(mdl_selected);
predictorNames = mdl_selected.PredictorNames;

%Figure 1: Display all predictors
f1 = figure(90);
bar(imp);
title('Predictor Importance Estimates (All Predictors)');
ylabel('Estimates'); 
xlabel('Predictors');
set(gca, 'xtick', 1:numel(predictorNames), 'xticklabel', predictorNames);
f1.Position = [80 80 2000 800];
h1 = gca;
h1.XTickLabelRotation = 45; 
h1.TickLabelInterpreter = 'none';

% Figure 2: Display only the top 11 predictors with the highest estimates
% Sort the importance values in descending order and get the top 11 indices
[sortedImp, sortedIndices] = sort(imp, 'descend');
top11Indices = sortedIndices(1:11);

% Keep the original indices and names
top11Predictors = predictorNames(top11Indices);

% Create labels with the format '#index. name' using the original index
top11Labels = arrayfun(@(idx, name) sprintf('#%d. %s', idx, char(name)), top11Indices, top11Predictors, 'UniformOutput', false);

f2 = figure(91);
bar(sortedImp(1:11)); % Display the importance of the top 11 predictors
title('Predictor Importance Estimates (Top 11 Predictors)');
ylabel('Estimates'); 
xlabel('Predictors');
set(gca, 'xtick', 1:11, 'xticklabel', top11Labels);
f2.Position = [80 80 2000 800];
h2 = gca;
h2.XTickLabelRotation = 45; 
h2.TickLabelInterpreter = 'none';

%% Tree Viewer for Important Predictor
view(mdl_selected,'Mode','graph')

%% CFM on Train Data
cm = confusionchart(output_ML(:,end), yhat_train);
%cm.ColumnSummary = 'column-normalized';
%cm.RowSummary = 'row-normalized';
cm.Title = 'Training Data Confusion Matrix';

%% ROC Curve
%%Trainning Data
%ROC Curve for Class 0 (aka Column#1 of the Score)
[xpos, ypos, T, AUC1] = perfcurve(output_ML(:,end), yhat_scores_train(:, 1), 1);
figure(92)    
plot(xpos, ypos)
title('\bf ROC');
xlim([-0.05 1.05]), ylim([-0.05 1.05]), xlabel('\bf FP rate'),  ylabel('\bf TP rate');
hold on;
[xpos, ypos, T, AUC2] = perfcurve(output_ML(:,end), yhat_scores_train(:, 2), 2);
plot(xpos, ypos) 
hold on;
[xpos, ypos, T, AUC3] = perfcurve(output_ML(:,end), yhat_scores_train(:, 3), 3);
plot(xpos, ypos)
hold on;
[xpos, ypos, T, AUC4] = perfcurve(output_ML(:,end), yhat_scores_train(:, 4), 4);
plot(xpos, ypos) 
hold on;
[xpos, ypos, T, AUC5] = perfcurve(output_ML(:,end), yhat_scores_train(:, 5), 5);
plot(xpos, ypos)
hold on;
[xpos, ypos, T, AUC6] = perfcurve(output_ML(:,end), yhat_scores_train(:, 6), 6);
plot(xpos, ypos) 
hold on;
[xpos, ypos, T, AUC7] = perfcurve(output_ML(:,end), yhat_scores_train(:, 7), 7);
plot(xpos, ypos)
hold on;
[xpos, ypos, T, AUC8] = perfcurve(output_ML(:,end), yhat_scores_train(:, 8), 8);
plot(xpos, ypos) 
hold on;
[xpos, ypos, T, AUC9] = perfcurve(output_ML(:,end), yhat_scores_train(:, 9), 9);
plot(xpos, ypos)
hold on;
[xpos, ypos, T, AUC10] = perfcurve(output_ML(:,end), yhat_scores_train(:, 10), 10);
plot(xpos, ypos)

xlim([-0.05 1.05]), ylim([-0.05 1.05]), xlabel('\bf FP rate'),  ylabel('\bf TP rate')
legend('Class 1', 'Class 2', 'Class 3', 'Class 4', 'Class 5', 'Class 6', 'Class 7', 'Class 8', 'Class 9', 'Class 10')


%% Model Improvement

rng(1); % For reproducibility
mdl_selected= fitctree(output_ML_table(:, [19 57 37 12 11 32 25 16 13 6 31]), output_ML_table(:,end),'MaxNumSplits',MaxSplits_Selected(1,1), SplitCriterion='deviance');
% CFM: To calculate Accuracy, Precision, Recall, F-score using CFM Function on trainning data
[yhat_train, yhat_scores_train, costs_train] = predict(mdl_selected, output_ML_table(:, 1:(end-1)));
CFM_Stats_result_train = CFM_Stats(output_ML(:,end), yhat_train)

%Estimate Predictor Importance
imp = predictorImportance(mdl_selected);
f = figure(93);
bar(imp);
names = mdl_selected.PredictorNames;
title('Predictor Importance Estimates');
ylabel('Estimates'); xlabel('Predictors');
h = gca;
set(h,'xtick',1:(size(names,2)),'xticklabel',names);
f.Position = [80 80 2000 800];
h.XTickLabelRotation = 45; h.TickLabelInterpreter = 'none';

cm = confusionchart(output_ML(:,end), yhat_train);
%cm.ColumnSummary = 'column-normalized';
%cm.RowSummary = 'row-normalized';
cm.Title = 'Training Data Confusion Matrix';

[xpos, ypos, T, AUC1] = perfcurve(output_ML(:,end), yhat_scores_train(:, 1), 1);
figure(94)    
plot(xpos, ypos)
title('\bf ROC');
xlim([-0.05 1.05]), ylim([-0.05 1.05]), xlabel('\bf FP rate'),  ylabel('\bf TP rate');
hold on;
[xpos, ypos, T, AUC2] = perfcurve(output_ML(:,end), yhat_scores_train(:, 2), 2);
plot(xpos, ypos) 
hold on;
[xpos, ypos, T, AUC3] = perfcurve(output_ML(:,end), yhat_scores_train(:, 3), 3);
plot(xpos, ypos)
hold on;
[xpos, ypos, T, AUC4] = perfcurve(output_ML(:,end), yhat_scores_train(:, 4), 4);
plot(xpos, ypos) 
hold on;
[xpos, ypos, T, AUC5] = perfcurve(output_ML(:,end), yhat_scores_train(:, 5), 5);
plot(xpos, ypos)
hold on;
[xpos, ypos, T, AUC6] = perfcurve(output_ML(:,end), yhat_scores_train(:, 6), 6);
plot(xpos, ypos) 
hold on;
[xpos, ypos, T, AUC7] = perfcurve(output_ML(:,end), yhat_scores_train(:, 7), 7);
plot(xpos, ypos)
hold on;
[xpos, ypos, T, AUC8] = perfcurve(output_ML(:,end), yhat_scores_train(:, 8), 8);
plot(xpos, ypos) 
hold on;
[xpos, ypos, T, AUC9] = perfcurve(output_ML(:,end), yhat_scores_train(:, 9), 9);
plot(xpos, ypos)
hold on;
[xpos, ypos, T, AUC10] = perfcurve(output_ML(:,end), yhat_scores_train(:, 10), 10);
plot(xpos, ypos)

xlim([-0.05 1.05]), ylim([-0.05 1.05]), xlabel('\bf FP rate'),  ylabel('\bf TP rate')
legend('Class 1', 'Class 2', 'Class 3', 'Class 4', 'Class 5', 'Class 6', 'Class 7', 'Class 8', 'Class 9', 'Class 10')