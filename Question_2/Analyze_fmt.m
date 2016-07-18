% Work by Lin, Tzu-Heng
% W42, Dept. of Electronic Engineering, Tsinghua University
% All rights reserved

% The Nineth Problem


function Analyze_fmt
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
    f = find(freqtarget > maxx*0.1)
    
    err = 5;
    for i = 1:length(f)
        two_in_f = find( (x>x(f(i))*2-err) & (x<x(f(i))*2+err) );
        two = length(two_in_f)~=0 & length(find(ismember(two_in_f,f)))~=0;
        
        three_in_f = find( (f>f(i)*3-err) & (f<f(i)*3+err) );
        three = length(two_in_f)~=0 & length(find(ismember(two_in_f,f)))~=0;
        
        four_in_f = find( (f>f(i)*4-err) & (f<f(i)*4+err) );
        four = length(two_in_f)~=0 & length(find(ismember(two_in_f,f)))~=0;
        if two & three & four
            break;
        end
    end
    disp('Base freq: ');
    disp(x(f(i)));
    
end