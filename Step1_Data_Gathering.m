%Clear all
clc;clearvars;close all;

%% Combine all csv files for normal 
cd 'C:\ML Data\full\normal'
files = dir('*.csv');
data_c1 = readmatrix(files(1).name);  % First file

%Concatenate data
% for ii = 2:numel(files)
%    new = readmatrix(files(ii).name);  
%    data_normal = [data_normal;new];  
% end
% for ii = 2:3
%    new = readmatrix(files(ii).name);  
%    data_normal = [data_normal;new];  
% end
%Label data
data_c1(:,9) = 1;

%%  Combine all csv files for Horizontal Misaligment for 1m
cd 'C:\ML Data\full\horizontal-misalignment\1.0mm'
files = dir('*.csv');
data_c2 = readmatrix(files(1).name);  % First file

% Concatenate data
% for ii = 2:numel(files)
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_horizontal_misalignment = [data_horizontal_misalignment;new];   
% end
% for ii = 2:3
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_horizontal_misalignment = [data_horizontal_misalignment;new];   
% end
%Label data
data_c2(:,9) = 2;

%%  Combine all csv files for Veritcal Misaligment for 0.51m
cd 'C:\ML Data\full\vertical-misalignment\0.51mm'
files = dir('*.csv');
data_c3 = readmatrix(files(1).name);  % First file

% Concatenate data
% for ii = 2:numel(files)
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_vertical_misalignment = [data_vertical_misalignment;new];   
% end
% for ii = 2:3
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_vertical_misalignment = [data_vertical_misalignment;new];   
% end
%Label data
data_c3(:,9) = 3;

%%  Combine all csv files for Imbalance of 6g
cd 'C:\ML Data\full\imbalance\6g'
files = dir('*.csv');
data_c4 = readmatrix(files(1).name);  % First file

% Concatenate data
% for ii = 2:numel(files)
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_imbalance = [data_imbalance;new];   
% end
% for ii = 2:3
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_imbalance = [data_imbalance;new];   
% end
%Label data
data_c4(:,9) = 4;

%%  Combine all csv files for Underhang Cage Fault of 6g
cd 'C:\ML Data\full\underhang\cage_fault\6g'
files = dir('*.csv');
data_c5 = readmatrix(files(1).name);  % First file

% Concatenate data
% for ii = 2:numel(files)
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_underhang_cagefault = [data_underhang_cagefault;new];   
% end
% for ii = 2:3
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_underhang_cagefault = [data_underhang_cagefault;new];   
% end
%Label data
data_c5(:,9) = 5;

%%  Combine all csv files for Underhang Outer Race of 6g
cd 'C:\ML Data\full\underhang\outer_race\6g'
files = dir('*.csv');
data_c6 = readmatrix(files(1).name);  % First file

% Concatenate data
% for ii = 2:numel(files)
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_underhang_outerrace = [data_underhang_outerrace;new];   
% end
% for ii = 2:3
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_underhang_outerrace = [data_underhang_outerrace;new];   
% end
%Label data
data_c6(:,9) = 6;

%%  Combine all csv files for Underhang Outer Race of 6g
cd 'C:\ML Data\full\underhang\ball_fault\6g'
files = dir('*.csv');
data_c7= readmatrix(files(1).name);  % First file

% Concatenate data
% for ii = 2:numel(files)
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_underhang_ballfault = [data_underhang_ballfault;new];   
% end
% for ii = 2:3
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_underhang_ballfault = [data_underhang_ballfault;new];   
% end
%Label data
data_c7(:,9) = 7;

%%  Combine all csv files for OVerhang Cage Fault of 6g
cd 'C:\ML Data\full\overhang\cage_fault\6g'
files = dir('*.csv');
data_c8 = readmatrix(files(1).name);  % First file

% Concatenate data
% for ii = 2:numel(files)
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_overhang_cagefault = [data_overhang_cagefault;new];   
% end
% for ii = 2:3
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_overhang_cagefault = [data_overhang_cagefault;new];   
% end
%Label data
data_c8(:,9) = 8;
%%  Combine all csv files for OVerhang Outer Race of 6g
cd 'C:\ML Data\full\overhang\outer_race\6g'
files = dir('*.csv');
data_c9 = readmatrix(files(1).name);  % First file

% Concatenate data
% for ii = 2:numel(files)
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_overhang_outerrace = [data_overhang_outerrace;new];   
% end
% for ii = 2:3
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_overhang_outerrace = [data_overhang_outerrace;new];   
% end
%Label data
data_c9(:,9) = 9;

%%  Combine all csv files for OVerhang Outer Race of 6g
cd 'C:\ML Data\full\overhang\ball_fault\6g'
files = dir('*.csv');
data_c10 = readmatrix(files(1).name);  % First file

% Concatenate data
% for ii = 2:numel(files)
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_overhang_ballfault = [data_overhang_ballfault;new];   
% end
% for ii = 2:3
%    new = readmatrix(files(ii).name);  % Read the nth file
%    data_overhang_ballfault = [data_overhang_ballfault;new];   
% end
%Label data
data_c10(:,9) = 10;

%% Merge all data into a single file
data_total =vertcat(data_c1, data_c2, data_c3, data_c4, data_c5, data_c6, data_c7, data_c8, data_c9, data_c10 );
%% Export to excel 
cd 'C:\ML Data\'
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
