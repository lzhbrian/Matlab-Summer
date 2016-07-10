% Work by Lin, Tzu-Heng
% W42, Dept. of Electronic Engineering, Tsinghua University
% All rights reserved

% The Fifth Problem: Beethoven Symphony No.5
% in C Minor
function Beethoven_5
    speed = 2;
    sample_rate = 8000;
    len = [1,1/3,1/3,1/3,2, 1,1/3,1/3,1/3,2];
    len = len / speed;
    
    % Volume
    volume_array =[];
    for i=1:length(len)
       volume_array = [volume_array, generate_volume(len(i),sample_rate)];
    end
    
    %      F(1), G(2),  -A(3),   B(4),   C(5),   D(6),   E-(7)
    % f = [174.61, 196,  207.65, 246.94, 261.63, 293.66, 311.13];
    f = [349.23, 392,  415.30,  493.88, 523.25, 587.33, 622.25];
    tone = [0, f(4),f(4),f(4),f(2),0, f(3),f(3),f(3),f(1)];
    
    y = [];
    for i = 1:length(tone)
        t = linspace(0,len(i),len(i)*sample_rate);
        y = [y, sin(2*pi*tone(i)*t)];
    end
    
    % y suppressed by volume
    y = y .* volume_array;
    
    % Make sound
    sound(y, sample_rate);
end
