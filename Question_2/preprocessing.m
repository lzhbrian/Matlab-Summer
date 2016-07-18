% Work by Lin, Tzu-Heng
% W42, Dept. of Electronic Engineering, Tsinghua University
% All rights reserved

% The Seventh Problem

% input_array -> realwave
% cycle -> The amount of cycles we saw
% Standard -> The array teacher has given

function preprocessed_array = preprocessing(input_array, cycle, standard)
    % First *10, output a 2430 elements array
    input_array_10 = resample(input_array', cycle, 1);
    
    % Calculate the mean of the 10 cycles
    unit = mean(...
        reshape(input_array_10', [length(input_array),cycle])'...
    );

    % Integrate into one array
    units = [unit,unit,unit,unit,unit,unit,unit,unit,unit,unit];
    
    % Resampling
    % preprocessed_array = resample(units, length(input_array), 1);
    preprocessed_array = resample(units, 1, 10)';
    
    % Plot
    figure; 
    subplot(3,1,1); plot(input_array); ylabel('realwave');
    subplot(3,1,2); plot(standard); ylabel('wave2proc');
    subplot(3,1,3); plot(preprocessed_array); ylabel('My wave2proc');
    
end