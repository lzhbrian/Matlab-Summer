% Work by Lin, Tzu-Heng
% W42, Dept. of Electronic Engineering, Tsinghua University
% All rights reserved

% The First Problem: Oriental_Red
function Oriental_Red
    speed = 2;
    sample_rate = 8000;
    len = [1,0.5,0.5,2,1,0.5,0.5,2];
    len = len / speed;
    
    %      F(1), G(2), A(3),  B-(4),  C(5),   D(6),   E(7)
    f = [349.23, 392,  440,  466.16, 523.25, 587.33, 659.25];
    tone = [f(5),f(5),f(6),f(2),f(1),f(1),f(6)/2,f(2)];
    
    % Generate Sin Signal
    y = [];
    for i = 1:length(tone)
        y = [y, generate_sin(tone(i),len(i), sample_rate)];
    end
    % Make sound
    sound(y, sample_rate);
end

% Generate Sin Signal
function y = generate_sin(f, len, sample_rate)
    t = linspace(0,len,len*sample_rate);
    y = sin(2*pi*f*( t ));
end

