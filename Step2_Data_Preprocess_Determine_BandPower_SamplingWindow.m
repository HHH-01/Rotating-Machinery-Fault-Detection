close all;
%% High-Pass Filter (HPF) Data
[b, a] = butter(1, 0.01, 'high');
data_HPF = data_total;  % Initialize HPF data
for i = 2:7
    data_HPF(:,i) = filtfilt(b, a, data_total(:,i));  % Apply HPF to columns 2 through 7
end
data_HPF(:,1) = data_total(:,1);  % Keep column 1 unchanged
data_HPF(:,8) = data_total(:,8);  % Keep column 8 unchanged

%% Plot HPF Data (Tachometer)
data = data_total;
plot_with_xlines(data(:,1), 'Tachometer', 'samples', 'magnitude');

%% Plot Accelerometer#1 Data
plot_with_xlines(data(:,2:4), 'Accelerometer#1 Data', 'samples', 'magnitude', {'x', 'y', 'z'});

%% Plot Accelerometer#2 Data
plot_with_xlines(data(:,5:7), 'Accelerometer#2 Data', 'samples', 'magnitude', {'x', 'y', 'z'});

%% Plot Microphone Data
plot_with_xlines(data(:,8), 'Microphone', 'samples', 'magnitude');

%% Below is FFT for everything
%% Setup for FFT
data_total_height = height(data_total); % 2,500,000
data_c_height = height(data_c1);        % 250,000
Fs = 50000;                             % Sampling frequency 50kHz
T = 1/Fs;                               % Sampling period 
L = ((1/Fs) * data_c_height) * 1000;    % 5000ms
t = (0:L-1) * T;                        % Time vector
f = Fs * (0:(L/2)) / L;                 % Frequency vector
% Store data classes in a cell array
data_classes = {data_c1, data_c2, data_c3, data_c4, data_c5, data_c6, data_c7, data_c8, data_c9, data_c10};

% Create an empty cell array to store FFT results for each class
data_fft = cell(1, 10);

%% Perform FFT on each class
for i = 1:10
    data_fft{i} = fft(data_classes{i}); % Compute FFT for each class
end

%% Plot Accel-1 x-axis (2nd column) for all 10 classes
figure(5);
hold on;

% Loop through each class and plot FFT results
for i = 1:10
    P2_1x = abs(data_fft{i}(:,2) / L);      % Compute magnitude of FFT
    P1_1x = P2_1x(1:L/2+1);                    % Single-sided spectrum
    P1_1x(2:end-1) = 2 * P1_1x(2:end-1);       % Adjust amplitude
    plot(f, zscore(P1_1x));                 % Plot z-scored data
end
% Set plot title and labels
title("Z-Score Amplitude Spectrum of Class-1 to Class-10 Accel#1 in x-axis");
xlabel("f (Hz)");
ylabel("|P1(f)|");

% Add x-axis lines
x_lines_1x = [2500, 5000, 7500, 10000, 12500, 15000, 17500, 20000, 22500, 25000];
for i = 1:length(x_lines_1x)
    xline(x_lines_1x(i), '-.', sprintf('#%d', i), 'LabelHorizontalAlignment', 'left', 'LabelVerticalAlignment', 'bottom', 'FontWeight', 'bold');
end

% Add legend
legend(arrayfun(@(x) sprintf('Class-%d', x), 1:10, 'UniformOutput', false));

hold off;
%% Plot Accel-1 y-axis in all 10 classes
figure(6);
hold on;

% Store data FFT results in a cell array
data_fft_y = cell(1, 10);

% Loop through each class and calculate the FFT for the y-axis (3rd column)
for i = 1:10
    P2_1y = abs(data_fft{i}(:, 3) / L);      % Compute magnitude of FFT for y-axis
    P1_1y = P2_1y(1:L/2+1);                     % Single-sided spectrum
    P1_1y(2:end-1) = 2 * P1_1y(2:end-1);        % Adjust amplitude
    plot(f, zscore(P1_1y));                  % Plot z-scored FFT result for each class
end

% Set title, labels, and legend
title("Z-Score Amplitude Spectrum of Class-1 to Class-10 Accel#1 in y-axis");
xlabel("f (Hz)");
ylabel("|P1(f)|");

% Add xline markers at specified frequencies
x_lines_1y = [2500, 5000, 7500, 10000, 12500, 15000, 17500, 20000, 22500, 25000];
for i = 1:length(x_lines_1y)
    xline(x_lines_1y(i), '-.', sprintf('#%d', i), 'LabelHorizontalAlignment', 'left', 'LabelVerticalAlignment', 'bottom', 'FontWeight', 'bold');
end

% Create legend dynamically for all 10 classes
legend(arrayfun(@(x) sprintf('Class-%d', x), 1:10, 'UniformOutput', false));

hold off;
%% Plot Accel-1 z-axis in all 10 classes
figure(7);
hold on;

% Loop through each class and calculate the FFT for the z-axis (4th column)
for i = 1:10
    P2_1z = abs(data_fft{i}(:, 4) / L);      % Compute magnitude of FFT for z-axis
    P1_1z = P2_1z(1:L/2+1);                     % Single-sided spectrum
    P1_1z(2:end-1) = 2 * P1_1z(2:end-1);        % Adjust amplitude
    plot(f, zscore(P1_1z));                  % Plot z-scored FFT result for each class
end

% Set title, labels, and legend
title("Z-Score Amplitude Spectrum of Class-1 to Class-10 Accel#1 in z-axis");
xlabel("f (Hz)");
ylabel("|P1(f)|");

% Add xline markers at specified frequencies
x_lines_1z = [2500, 5000, 7500, 10000, 12500, 15000, 17500, 20000, 22500, 25000];
for i = 1:length(x_lines_1z)
    xline(x_lines_1z(i), '-.', sprintf('#%d', i), 'LabelHorizontalAlignment', 'left', 'LabelVerticalAlignment', 'bottom', 'FontWeight', 'bold');
end

% Create legend dynamically for all 10 classes
legend(arrayfun(@(x) sprintf('Class-%d', x), 1:10, 'UniformOutput', false));

hold off;
%% Plot Accel-2 x-axis in all 10 classes
figure(8);
hold on;

% Loop through each class and calculate the FFT for the x-axis (5th column)
for i = 1:10
    P2_2x = abs(data_fft{i}(:, 5) / L);      % Compute magnitude of FFT for x-axis
    P1_2x = P2_2x(1:L/2+1);                     % Single-sided spectrum
    P1_2x(2:end-1) = 2 * P1_2x(2:end-1);        % Adjust amplitude
    plot(f, zscore(P1_2x));                  % Plot z-scored FFT result for each class
end

% Set title, labels, and legend
title("Z-Score Amplitude Spectrum of Class-1 to Class-10 Accel#2 in x-axis");
xlabel("f (Hz)");
ylabel("|P1(f)|");

% Add xline markers at specified frequencies
x_lines = [2500, 5000, 7500, 10000, 12500, 15000, 17500, 20000, 22500, 25000];
for i = 1:length(x_lines)
    xline(x_lines(i), '-.', sprintf('#%d', i), 'LabelHorizontalAlignment', 'left', 'LabelVerticalAlignment', 'bottom', 'FontWeight', 'bold');
end

% Create legend dynamically for all 10 classes
legend(arrayfun(@(x) sprintf('Class-%d', x), 1:10, 'UniformOutput', false));

hold off;

%% Plot Accel-2 y-axis in all 10 classes
figure(9);
hold on;

% Loop through each class and calculate the FFT for the y-axis (6th column)
for i = 1:10
    P2_2y = abs(data_fft{i}(:, 6) / L);      % Compute magnitude of FFT for y-axis
    P1_2y = P2_2y(1:L/2+1);                     % Single-sided spectrum
    P1_2y(2:end-1) = 2 * P1_2y(2:end-1);        % Adjust amplitude
    plot(f, zscore(P1_2y));                  % Plot z-scored FFT result for each class
end

% Set title, labels, and legend
title("Z-Score Amplitude Spectrum of Class-1 to Class-10 Accel#2 in y-axis");
xlabel("f (Hz)");
ylabel("|P1(f)|");

% Add xline markers at specified frequencies
x_lines = [2500, 5000, 7500, 10000, 12500, 15000, 17500, 20000, 22500, 25000];
for i = 1:length(x_lines)
    xline(x_lines(i), '-.', sprintf('#%d', i), 'LabelHorizontalAlignment', 'left', 'LabelVerticalAlignment', 'bottom', 'FontWeight', 'bold');
end

% Create legend dynamically for all 10 classes
legend(arrayfun(@(x) sprintf('Class-%d', x), 1:10, 'UniformOutput', false));

hold off;
%% Plot Accel-2 z-axis in all 10 classes
figure(10);
hold on;

% Loop through each class and calculate the FFT for the z-axis (7th column)
for i = 1:10
    P2_2z = abs(data_fft{i}(:, 7) / L);      % Compute magnitude of FFT for z-axis
    P1_2z = P2_2z(1:L/2+1);                     % Single-sided spectrum
    P1_2z(2:end-1) = 2 * P1_2z(2:end-1);        % Adjust amplitude
    plot(f, zscore(P1_2z));                  % Plot z-scored FFT result for each class
end

% Set title, labels, and legend
title("Z-Score Amplitude Spectrum of Class-1 to Class-10 Accel#2 in z-axis");
xlabel("f (Hz)");
ylabel("|P1(f)|");

% Add xline markers at specified frequencies
x_lines = [2500, 5000, 7500, 10000, 12500, 15000, 17500, 20000, 22500, 25000];
for i = 1:length(x_lines)
    xline(x_lines(i), '-.', sprintf('#%d', i), 'LabelHorizontalAlignment', 'left', 'LabelVerticalAlignment', 'bottom', 'FontWeight', 'bold');
end

% Create legend dynamically for all 10 classes
legend(arrayfun(@(x) sprintf('Class-%d', x), 1:10, 'UniformOutput', false));

hold off;


%% Plot to determin Sampleing Window - Using time
figure(11);
%Class 1
plot(data_c1(:,2));

%% Plot function to add x-lines
function plot_with_xlines(data, title_str, xlabel_str, ylabel_str, legend_labels)
    figure();
    plot(data);
    
    % Add xlines at specific intervals
    x_lines = [250000, 500000, 750000, 1000000, 1250000, 1500000, 1750000, 2000000, 2250000, 2490000];
    for i = 1:length(x_lines)
        xline(x_lines(i), '-.', sprintf('#%d', i), 'LabelHorizontalAlignment', 'left', 'LabelVerticalAlignment', 'bottom', 'FontWeight', 'bold');
    end
    
    % Set plot labels and title
    xlabel(xlabel_str);
    ylabel(ylabel_str);
    title(title_str);
    
    % Add legend if labels are provided
    if nargin == 5
        legend(legend_labels);
    end
    
    grid on;
end