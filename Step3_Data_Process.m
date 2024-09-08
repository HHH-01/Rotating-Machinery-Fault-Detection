cd 'C:\ML Projects\Rotating Machinery Fault Detection\Matlab'
%% This step is to load data from last step if needed
%%Load data
%clc;clearvars;close all;
%load("C:\ML Projects\Rotating Machinery Fault Detection\Matlab\Matlab_Data\data_processing_output.mat");
data = data_total;
%%
%HPF Data
[b, a] = butter(1, 0.01, 'high');
data_HPF(:,1)= filtfilt(b,a,data(:,1));
data_HPF(:,2)= filtfilt(b,a,data(:,2));
data_HPF(:,3)= filtfilt(b,a,data(:,3));
data_HPF(:,4)= filtfilt(b,a,data(:,4));
data_HPF(:,5)= filtfilt(b,a,data(:,5));
data_HPF(:,6)= filtfilt(b,a,data(:,6));
data_HPF(:,7)= filtfilt(b,a,data(:,7));
data_HPF(:,8)= filtfilt(b,a,data(:,8));
%% 3nd way to Process Data using HPF data, where BandPower Data is computed using specgram - Reference from Professor Code
Fs=50000;
len = length(data(:,1)) ;
window = 1000; %window size
overlap = 0.5*window; %50percent overlap
%Power Band
f1 = 1; f2 = 2500;
f3 = 2501; f4 = 8000;
f5 = 8001; f6= 11000;
f7 = 11001; f8= 15000;
f9 = 15001; f10= 21000;
f11 = 21001; f12 = 25000;
%for i=1:overlap:len-window

for i=1:overlap:len-window
    disp(i)
    idxNew = ceil(i/overlap);
    idxOld = i+window;

    %Mean and Var of Tach and Microphone
    Avg_tach(idxNew)=mean(data(i:idxOld,1));   
    Var_tach(idxNew)= var(data(i:idxOld,1));

    Avg_mic(idxNew)=mean(data(i:idxOld,1));   
    Var_mic(idxNew)= var(data(i:idxOld,1));

    %Mean and Var of Accel
    Avg_1x(idxNew)=mean(data(i:idxOld,2));   % mean of 2nd column
    Var_1x(idxNew)= var(data(i:idxOld,2));
    Avg_1y(idxNew)=mean(data(i:idxOld,3));   % mean of 3rd column
    Var_1y(idxNew)= var(data(i:idxOld,3));
    Avg_1z(idxNew)=mean(data(i:idxOld,4));   % mean of 4th column
    Var_1z(idxNew)= var(data(i:idxOld,4));
    Avg_2x(idxNew)=mean(data(i:idxOld,5));   % mean of 5th column
    Var_2x(idxNew)= var(data(i:idxOld,5));
    Avg_2y(idxNew)=mean(data(i:idxOld,6));   % mean of 6th column
    Var_2y(idxNew)= var(data(i:idxOld,6));
    Avg_2z(idxNew)=mean(data(i:idxOld,7));   % mean of 7th column
    Var_2z(idxNew)= var(data(i:idxOld,7));
    
    %Power Band
    BandPower1_1x(idxNew,:)=bandpower(data_HPF(i:idxOld-1,2), Fs, [f1 f2]);
    BandPower1_1y(idxNew,:)=bandpower(data_HPF(i:idxOld-1,3), Fs, [f1 f2]);
    BandPower1_1z(idxNew,:)=bandpower(data_HPF(i:idxOld-1,4), Fs, [f1 f2]);
    BandPower1_2x(idxNew,:)=bandpower(data_HPF(i:idxOld-1,5), Fs, [f1 f2]);
    BandPower1_2y(idxNew,:)=bandpower(data_HPF(i:idxOld-1,6), Fs, [f1 f2]);
    BandPower1_2z(idxNew,:)=bandpower(data_HPF(i:idxOld-1,7), Fs, [f1 f2]);

    BandPower2_1x(idxNew,:)=bandpower(data_HPF(i:idxOld-1,2), Fs, [f3 f4]);
    BandPower2_1y(idxNew,:)=bandpower(data_HPF(i:idxOld-1,3), Fs, [f3 f4]);
    BandPower2_1z(idxNew,:)=bandpower(data_HPF(i:idxOld-1,4), Fs, [f3 f4]);
    BandPower2_2x(idxNew,:)=bandpower(data_HPF(i:idxOld-1,5), Fs, [f3 f4]);
    BandPower2_2y(idxNew,:)=bandpower(data_HPF(i:idxOld-1,6), Fs, [f3 f4]);
    BandPower2_2z(idxNew,:)=bandpower(data_HPF(i:idxOld-1,7), Fs, [f3 f4]);

    BandPower3_1x(idxNew,:)=bandpower(data_HPF(i:idxOld-1,2), Fs, [f5 f6]);
    BandPower3_1y(idxNew,:)=bandpower(data_HPF(i:idxOld-1,3), Fs, [f5 f6]);
    BandPower3_1z(idxNew,:)=bandpower(data_HPF(i:idxOld-1,4), Fs, [f5 f6]);
    BandPower3_2x(idxNew,:)=bandpower(data_HPF(i:idxOld-1,5), Fs, [f5 f6]);
    BandPower3_2y(idxNew,:)=bandpower(data_HPF(i:idxOld-1,6), Fs, [f5 f6]);
    BandPower3_2z(idxNew,:)=bandpower(data_HPF(i:idxOld-1,7), Fs, [f5 f6]);

    BandPower4_1x(idxNew,:)=bandpower(data_HPF(i:idxOld-1,2), Fs, [f7 f8]);
    BandPower4_1y(idxNew,:)=bandpower(data_HPF(i:idxOld-1,3), Fs, [f7 f8]);
    BandPower4_1z(idxNew,:)=bandpower(data_HPF(i:idxOld-1,4), Fs, [f7 f8]);
    BandPower4_2x(idxNew,:)=bandpower(data_HPF(i:idxOld-1,5), Fs, [f7 f8]);
    BandPower4_2y(idxNew,:)=bandpower(data_HPF(i:idxOld-1,6), Fs, [f7 f8]);
    BandPower4_2z(idxNew,:)=bandpower(data_HPF(i:idxOld-1,7), Fs, [f7 f8]);

    BandPower5_1x(idxNew,:)=bandpower(data_HPF(i:idxOld-1,2), Fs, [f9 f10]);
    BandPower5_1y(idxNew,:)=bandpower(data_HPF(i:idxOld-1,3), Fs, [f9 f10]);
    BandPower5_1z(idxNew,:)=bandpower(data_HPF(i:idxOld-1,4), Fs, [f9 f10]);
    BandPower5_2x(idxNew,:)=bandpower(data_HPF(i:idxOld-1,5), Fs, [f9 f10]);
    BandPower5_2y(idxNew,:)=bandpower(data_HPF(i:idxOld-1,6), Fs, [f9 f10]);
    BandPower5_2z(idxNew,:)=bandpower(data_HPF(i:idxOld-1,7), Fs, [f9 f10]);

    BandPower6_1x(idxNew,:)=bandpower(data_HPF(i:idxOld-1,2), Fs, [f11 f12]);
    BandPower6_1y(idxNew,:)=bandpower(data_HPF(i:idxOld-1,3), Fs, [f11 f12]);
    BandPower6_1z(idxNew,:)=bandpower(data_HPF(i:idxOld-1,4), Fs, [f11 f12]);
    BandPower6_2x(idxNew,:)=bandpower(data_HPF(i:idxOld-1,5), Fs, [f11 f12]);
    BandPower6_2y(idxNew,:)=bandpower(data_HPF(i:idxOld-1,6), Fs, [f11 f12]);
    BandPower6_2z(idxNew,:)=bandpower(data_HPF(i:idxOld-1,7), Fs, [f11 f12]);

    %Compute Number of Zero Crossing    
    zcd = dsp.ZeroCrossingDetector;
    numZeroCross_1x(ceil(i/overlap)) = zcd(data_HPF(i:i+window,2));
    zcd = dsp.ZeroCrossingDetector;
    numZeroCross_1y(ceil(i/overlap)) = zcd(data_HPF(i:i+window,3));
    zcd = dsp.ZeroCrossingDetector;
    numZeroCross_1z(ceil(i/overlap)) = zcd(data_HPF(i:i+window,4));
    zcd = dsp.ZeroCrossingDetector;
    numZeroCross_2x(ceil(i/overlap)) = zcd(data_HPF(i:i+window,5));
    zcd = dsp.ZeroCrossingDetector;
    numZeroCross_2y(ceil(i/overlap)) = zcd(data_HPF(i:i+window,6));
    zcd = dsp.ZeroCrossingDetector;
    numZeroCross_2z(ceil(i/overlap)) = zcd(data_HPF(i:i+window,7));
end

%% Create new Response after doing Sample Window and Overlap 
len_pdata = width(Avg_1x);
%Labeling activity
for i=1:len_pdata
    if i<=500        label(i) = 1; 
    elseif i<=1000   label(i) = 2; 
    elseif i<=1500   label(i) = 3; 
    elseif i<=2000   label(i) = 4; 
    elseif i<=2500   label(i) = 5; 
    elseif i<=3000   label(i) = 6; 
    elseif i<=3500   label(i) = 7; 
    elseif i<=4000   label(i) = 8; 
    elseif i<=4500   label(i) = 9; 
    else label(i) = 10;            
    end
end

%% Create new dataset
numZeroCross_1x= double(numZeroCross_1x);
numZeroCross_1y= double(numZeroCross_1y);
numZeroCross_1z= double(numZeroCross_1z);
numZeroCross_2x= double(numZeroCross_2x);
numZeroCross_2y= double(numZeroCross_2y);
numZeroCross_2z= double(numZeroCross_2z);

output_ML = [ ...
    Avg_tach' Avg_mic'...
    Var_tach' Var_mic'...
    Avg_1x' Avg_1y' Avg_1z' Avg_2x' Avg_2y' Avg_2z' ...
    Var_1x' Var_1y' Var_1z' Var_2x' Var_2y' Var_2z'  ... 
    numZeroCross_1x' numZeroCross_1y' numZeroCross_1z' numZeroCross_2x' numZeroCross_2y' numZeroCross_2z'...
    BandPower1_1x BandPower1_1y BandPower1_1z BandPower1_2x BandPower1_2y BandPower1_2y...
    BandPower2_1x BandPower2_1y BandPower2_1z BandPower2_2x BandPower2_2y BandPower2_2y...
    BandPower3_1x BandPower3_1y BandPower3_1z BandPower3_2x BandPower3_2y BandPower3_2y...
    BandPower4_1x BandPower4_1y BandPower4_1z BandPower4_2x BandPower4_2y BandPower4_2y...
    BandPower5_1x BandPower5_1y BandPower5_1z BandPower5_2x BandPower5_2y BandPower5_2y...
    BandPower6_1x BandPower6_1y BandPower6_1z BandPower6_2x BandPower6_2y BandPower6_2y...
    label'];

 output_ML_table = array2table(output_ML,'VariableNames',{...
     'Avg_tach', 'Avg_mic',...
     'Var_tach', 'Var_mic',...
     'Avg_1x', 'Avg_1y', 'Avg_1z', 'Avg_2x', 'Avg_2y', 'Avg_2z', ...
     'Var_1x', 'Var_1y', 'Var_1z', 'Var_2x', 'Var_2y', 'Var_2z'  ... 
     'numZeroCross_1x', 'numZeroCross_1y', 'numZeroCross_1z', 'numZeroCross_2x', 'numZeroCross_2y', 'numZeroCross_2z',...
    'BandPower1_1x','BandPower1_1y', 'BandPower1_1z', 'BandPower1_2x', 'BandPower1_2y', 'BandPower1_2z',...
    'BandPower2_1x','BandPower2_1y', 'BandPower2_1z', 'BandPower2_2x', 'BandPower2_2y', 'BandPower2_2z'...
    'BandPower3_1x','BandPower3_1y', 'BandPower3_1z', 'BandPower3_2x', 'BandPower3_2y', 'BandPower3_2z'...
    'BandPower4_1x','BandPower4_1y', 'BandPower4_1z', 'BandPower4_2x', 'BandPower4_2y', 'BandPower4_2z'...
    'BandPower5_1x','BandPower5_1y', 'BandPower5_1z', 'BandPower5_2x', 'BandPower5_2y', 'BandPower5_2z',...
    'BandPower6_1x','BandPower6_1y', 'BandPower6_1z', 'BandPower6_2x', 'BandPower6_2y', 'BandPower6_2z',...
                     'Label'});


