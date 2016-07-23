% Work by Lin, Tzu-Heng
% W42, Dept. of Electronic Engineering, Tsinghua University
% All rights reserved

% The Eighth Problem

% input_array -> wave2proc
% parameter = 5 -> multiplier of time zone
% problem_index = 8 or 9 -> 8:output a table 9:do nothing


function [base, one_amp,two_amp,three_amp,four_amp ,tone]=...
    Freq_Analyze(input_array, parameter,problem_index)
    
    close all;
    % x axis
    x = [ 0 : length(input_array)-1 ] / length(input_array)*8000;
    
    if(problem_index==8)
        figure;
        subplot(parameter,1,1);
        plot(x, abs(fft(input_array)));title('original');
    end
    
    unit = input_array;
    target = input_array;
    for i = 2:parameter
        
        target = repmat(target, 2, 1);
        % x axis
        x = [ 0 : length(target)-1 ]/length(target)*8000;

        if(problem_index==8)
            % plot
            subplot(parameter,1,i);
            plot(x, abs(fft(target)));title(i);
        end
    end
    
    % Start Analyzing
    % 'freqtarget'
    freqtarget = abs(fft(target));
    
    % half
    x = x(1:ceil(length(x)/2));
    freqtarget = freqtarget(1:ceil(length(freqtarget) / 2));
    
    % test plot
    if (problem_index==8)
        figure;
        plot(x,freqtarget);
    end
    
    % filter top
    maxx = max(freqtarget);
    f = find(freqtarget > maxx*0.2);
    
    % possible top
    possible_top = freqtarget(f);
    [val,index]=max(possible_top);
    base = x(f(index));
    
    err = 3;

    % ismember( find( (x>base/2-err & x<base/2+err) ), f )
    if sum(ismember( find( (x>=base/4-err & x<=base/4+err) ), f ))
        base = x( find( (x>=base/4-err & x<=base/4+err & ismember(x,x(f))) ) );
    elseif sum(ismember( find( (x>=base/3-err & x<=base/3+err) ), f ))
        base = x( find( (x>=base/3-err & x<=base/3+err & ismember(x,x(f))) ) );
    elseif sum(ismember( find( (x>=base/2-err & x<=base/2+err) ), f ))
        base = x( find( (x>=base/2-err & x<=base/2+err & ismember(x,x(f)) ) ) );
    end
    
    % If more than one base exist, give it with the biggest amp
    ans = find( ismember(x,base) );
    [val, index] = max( freqtarget( ans ) );
    
    base = x( ans(index) );

    % Calculate Harmonic Components
    one_amp = freqtarget(x == base);
    
    two_amp_index = find(x>base*2-err & x<base*2+err & ismember(x,x(f)) );
    [val, index] = max( freqtarget( two_amp_index ) );
    two_amp = freqtarget( two_amp_index(index) );
    
    three_amp_index = find(x>base*3-err & x<base*3+err & ismember(x,x(f)) );
    [val, index] = max( freqtarget( three_amp_index ) );
    three_amp = freqtarget( three_amp_index(index) );
    
    four_amp_index = find(x>base*4-err & x<base*4+err & ismember(x,x(f)) );
    [val, index] = max( freqtarget( four_amp_index ) );
    four_amp = freqtarget( four_amp_index(index) );
    
    nan = 0;
    % Check if its empty(zero)
    if isempty(two_amp) | two_amp/one_amp < nan
        two_amp = 0; 
    end
    if isempty(three_amp) | three_amp/one_amp < nan
        three_amp = 0; 
    end
    if isempty(four_amp) | four_amp/one_amp < nan
        four_amp = 0; 
    end
    
    keys = [174.61, 196, 220, 246.94, 261.63, 293.66, 329.63, 349.23, 392, ...
        184.99, 207.65, 233.08, 277.18, 311.13, 369.99, 415.30 ...
    ];
    values = ['f '; 'g '; 'a '; 'b '; 'c1';     'd1';   'e1';  'f1';  'g1';...
        'bG'  ; 'bA'  ; 'bB'  ; 'bD'  ; 'bE'  ; 'bG'  ; 'bA'   ...
    ];
    
    [val,index] = min(abs(keys-base));
    tone = values(index,:);
    tone_cell = cellstr(tone);
    
    if(problem_index==8)
    % Output result
        report = table(base, one_amp./one_amp,two_amp./one_amp,...
            three_amp./one_amp,four_amp./one_amp ,tone_cell,...
        'VariableNames', {'Base' 'base_amp' 'two_amp' 'three_amp' 'four_amp' 'Tone'})
    end
end