% Work by Lin, Tzu-Heng
% W42, Dept. of Electronic Engineering, Tsinghua University
% All rights reserved

% The Eighth Problem

% input_array -> wave2proc
% parameter = 5 -> multiplier of time zone


function Freq_Analyze(input_array, parameter)
    close all;
    % x axis
    x = [ 0 : length(input_array)-1 ] / length(input_array)*8000;
    figure;
    subplot(parameter,1,1);
    plot(x, abs(fft(input_array)));title('original');
    
    unit = input_array;
    target = input_array;
    for i = 2:parameter
        
        target = repmat(target, 2, 1);
        % x axis
        x = [ 0 : length(target)-1 ]/length(target)*8000;
        
        % plot
        subplot(parameter,1,i);
        plot(x, abs(fft(target)));title(i);
    end
    
    % Start Analyzing
    % 'freqtarget'
    freqtarget = abs(fft(target));
    
    maxx = max(freqtarget);
    f = find(freqtarget > maxx*0.1);
    
    err = 100;
    for i = 1:length(f)
        two_in_f = find( (x>x(f(i))*2-err) & (x<x(f(i))*2+err) );
        two = length(two_in_f)~=0 & length(find(ismember(two_in_f,f)))~=0;
length(find(ismember(two_in_f,f)))
        three_in_f = find( (x>x(f(i))*3-err) & (x<x(f(i))*3+err) );
        three = length(three_in_f)~=0 & length(find(ismember(three_in_f,f)))~=0;
length(find(ismember(three_in_f,f)))
        four_in_f = find( (x>x(f(i))*4-err) & (x<x(f(i))*4+err) );
        four = length(four_in_f)~=0 & length(find(ismember(four_in_f,f)))~=0;
length(find(ismember(four_in_f,f)))
        if two && three && four
            two_amp = freqtarget( two_in_f( find(ismember(two_in_f,f)) ) );
            three_amp = freqtarget( three_in_f( find(ismember(three_in_f,f)) ) );
            four_amp = freqtarget( four_in_f( find(ismember(four_in_f,f)) ) );
            break;
        end
        
    end
    fprintf('Base freq: %d Hz\n',x(f(i)));
    fprintf('Amp of 2, 3, 4: %d, %d, %d\n',two_amp,three_amp,four_amp);
    
end