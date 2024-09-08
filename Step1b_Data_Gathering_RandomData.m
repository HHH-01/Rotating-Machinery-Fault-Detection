%Clear all
clc;clearvars;close all;

%% Combine a random csv file for normal
cd 'C:\ML Data\full\normal'
files = dir('*.csv');

% Generate a random index to select a random file
randomIndex1 = randi([1 numel(files)]);

% Read the randomly selected file
data_c1 = readmatrix(files(randomIndex1).name); 

%Label data
data_c1(:,9) = 1;
%% Combine a random csv file for horizontal misalignment
cd 'C:\ML Data\full\horizontal-misalignment\1.0mm'
files = dir('*.csv');

% Generate a random index to select a random file
randomIndex2 = randi([1 numel(files)]);

% Read the randomly selected file
data_c2 = readmatrix(files(randomIndex2).name);

% Label data
data_c2(:,9) = 2;

%% Combine a random csv file for Vertical Misalignment for 0.51mm
cd 'C:\ML Data\full\vertical-misalignment\0.51mm'
files = dir('*.csv');

% Generate a random index to select a random file
randomIndex3 = randi([1 numel(files)]);

% Read the randomly selected file
data_c3 = readmatrix(files(randomIndex3).name);

% Label data
data_c3(:,9) = 3;

%% Combine a random csv file for Imbalance of 6g
cd 'C:\ML Data\full\imbalance\6g'
files = dir('*.csv');

% Generate a random index to select a random file
randomIndex4 = randi([1 numel(files)]);

% Read the randomly selected file
data_c4 = readmatrix(files(randomIndex4).name);

% Label data
data_c4(:,9) = 4;


%% Combine a random csv file for Underhang Cage Fault of 6g
cd 'C:\ML Data\full\underhang\cage_fault\6g'
files = dir('*.csv');

% Generate a random index to select a random file
randomIndex5 = randi([1 numel(files)]);

% Read the randomly selected file
data_c5 = readmatrix(files(randomIndex5).name);

% Label data
data_c5(:,9) = 5;

%% Combine a random csv file for Underhang Outer Race of 6g
cd 'C:\ML Data\full\underhang\outer_race\6g'
files = dir('*.csv');

% Generate a random index to select a random file
randomIndex6 = randi([1 numel(files)]);

% Read the randomly selected file
data_c6 = readmatrix(files(randomIndex6).name);

% Label data
data_c6(:,9) = 6;

%% Combine a random csv file for Underhang Ball Fault of 6g
cd 'C:\ML Data\full\underhang\ball_fault\6g'
files = dir('*.csv');

% Generate a random index to select a random file
randomIndex7 = randi([1 numel(files)]);

% Read the randomly selected file
data_c7 = readmatrix(files(randomIndex7).name);

% Label data
data_c7(:,9) = 7;

%% Combine a random csv file for Overhang Cage Fault of 6g
cd 'C:\ML Data\full\overhang\cage_fault\6g'
files = dir('*.csv');

% Generate a random index to select a random file
randomIndex8 = randi([1 numel(files)]);

% Read the randomly selected file
data_c8 = readmatrix(files(randomIndex8).name);

% Label data
data_c8(:,9) = 8;

%% Combine a random csv file for Overhang Outer Race of 6g
cd 'C:\ML Data\full\overhang\outer_race\6g'
files = dir('*.csv');

% Generate a random index to select a random file
randomIndex9 = randi([1 numel(files)]);

% Read the randomly selected file
data_c9 = readmatrix(files(randomIndex9).name);

% Label data
data_c9(:,9) = 9;


%% Combine a random csv file for Overhang Ball Fault of 6g
cd 'C:\ML Data\full\overhang\ball_fault\6g'
files = dir('*.csv');

% Generate a random index to select a random file
randomIndex10 = randi([1 numel(files)]);

% Read the randomly selected file
data_c10 = readmatrix(files(randomIndex10).name);

% Label data
data_c10(:,9) = 10;


%% Merge all data into a single file
data_total =vertcat(data_c1, data_c2, data_c3, data_c4, data_c5, data_c6, data_c7, data_c8, data_c9, data_c10 );
%% Export to excel 
%cd 'C:\ML Data\ML_Data_Gathering'
%The data block starting at cell 'A1' exceeds the sheet boundaries by 1451424 row(s) and 0 column(s)

%writematrix(data_total,'data_total_v2.xlsx');
% writematrix(data_horizontal_misalignment,'data_horizontal_misalignment.xlsx');
% writematrix(data_veritcal_misalignment,'data_veritcal_misalignment.xlsx');
% writematrix(data_imbalance,'data_imbalance.xlsx');
% writematrix(data_underhang_outerrace,'data_underhang_outerrace.xlsx');
% writematrix(data_underhang_cagefault,'data_underhang_cagefault.xlsx');
% writematrix(data_underhang_ballfault,'data_underhang_ballfault.xlsx');
% writematrix(data_overhang_outerrace,'data_overhang_outerrace.xlsx');
% writematrix(data_overhang_cagefault,'data_overhang_cagefault.xlsx');
% writematrix(data_overhang_ballfault,'data_overhang_ballfault.xlsx');
%%
cd 'C:\ML Projects\Rotating Machinery Fault Detection\Matlab'