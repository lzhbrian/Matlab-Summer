% Work by Lin, Tzu-Heng
% W42, Dept. of Electronic Engineering, Tsinghua University
% All rights reserved

% The Tenth Problem: Oriental_Red with harmonic calculated by Problem 5
function Oriental_Red_with_harm_1
    speed = 2;
    sample_rate = 8000;
    len = [1,0.5,0.5,2,1,0.5,0.5,2];
    len = len / speed;
    
    % Volume
    volume_array =[];
    for i=1:length(len)
       volume_array = [volume_array, generate_volume_for3(len(i),sample_rate)];
    end
    
    %      F(1), G(2), A(3),  B-(4),  C(5),   D(6),   E(7)
    f = [349.23, 392,  440,  466.16, 523.25, 587.33, 659.25];
    tone = [f(5),f(5),f(6),f(2),f(1),f(1),f(6)/2,f(2)];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Generate Harmonic Sin Signal
    
    y = [];
    for i = 1:length(tone)
        t = linspace(0,len(i),len(i)*sample_rate);        
        y = [y, [1, 1.4572, 0.95874, 1.0999] * ...
            [sin(2*pi*tone(i)*t); sin(2*pi*2*tone(i)*t);...
            sin(2*pi*3*tone(i)*t); sin(2*pi*4*tone(i)*t)]];
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % y suppressed by volume
    y = y .* volume_array;
    
    % Make sound
    sound(y, sample_rate);
end
