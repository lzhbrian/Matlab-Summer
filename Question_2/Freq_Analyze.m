% Work by Lin, Tzu-Heng
% W42, Dept. of Electronic Engineering, Tsinghua University
% All rights reserved

% The Eighth Problem

% input_array -> wave2proc
% parameter -> multiplier of time

function Freq_Analyze(input_array, parameter)
    close all;
    % x axis
    x = [ 0 : length(input_array)-1 ] / length(input_array)*8000;
    figure;
    subplot(parameter,1,1);
    plot(x, abs(fft(input_array)));title('original');
    
    unit = input_array;
    for i = 2:parameter
        input_array = repmat(input_array, 2);
        % x axis
        x = [ 0 : length(input_array)-1 ]/length(input_array)*8000;
        
        subplot(parameter,1,i);
        plot(x, abs(fft(input_array)));title(i);
    end


end