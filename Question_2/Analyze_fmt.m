% Work by Lin, Tzu-Heng
% W42, Dept. of Electronic Engineering, Tsinghua University
% All rights reserved

% The Nineth Problem

function [base, two_standard, three_standard, four_standard] = Analyze_fmt
    close all;
    load Guitar.MAT;
    music = audioread('fmt.wav');
    start_time =[700,  2300 ,14000, 18000, 22000, 25000, 29000,...
        32000, 36000, 40000, 46000, 48000, 56000, 62000, 68000,...
        72000, 76000, 79000, 81000, 83000, 84500, 86500, 90000,...
        94000, 98000,  102000, 106000, 110000, 114500, 119000];
    end_time =  [2300, 14000,18000, 22000, 25000, 29000, 32000,...
        36000, 40000, 46000, 48000, 56000, 62000, 68000, 72000,...
        76000, 79000, 81000, 83000, 84500, 86500, 90000, 94000,...
        98000, 102000, 106000, 110000, 114500, 119000, 131000];
    
    len = [];
    base = [];
    one_amp = [];
    two_amp = [];
    three_amp = [];
    four_amp = [];
    tone = {};
    
    for i = 1:length(start_time)
        
        [base_uut, one_amp_uut,two_amp_uut,three_amp_uut,four_amp_uut ,tone_uut] = ...
        Freq_Analyze( music(start_time(i):end_time(i)), 6, 9);
    
        leng = ( end_time(i) - start_time(i) )*2 / 4000;
        leng = round(leng) / 2;
        
        len(i,1) = leng;
        base(i,1) = base_uut;
        one_amp(i,1) = one_amp_uut;
        two_amp(i,1) = two_amp_uut;
        three_amp(i,1) = three_amp_uut;
        four_amp(i,1) = four_amp_uut;
        tone{i,1} = (tone_uut);
    end
    
    two_standard = two_amp./one_amp;
    three_standard = three_amp./one_amp;
    four_standard = four_amp./one_amp;
    
    report = table(base, len, two_standard,...
        three_standard, four_standard, tone,...
        'VariableNames', {'Base' 'length' 'two_amp' 'three_amp' 'four_amp' 'Tone'})
   
end