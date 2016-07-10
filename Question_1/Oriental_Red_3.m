% Work by Lin, Tzu-Heng
% W42, Dept. of Electronic Engineering, Tsinghua University
% All rights reserved

% The Third Problem: Oriental_Red up/down degrees
function Oriental_Red_3
    speed = 2;
    sample_rate = 8000;
    len = [1,0.5,0.5,2,1,0.5,0.5,2];
    len = len / speed;
    
    % Volume
    volume_array =[];
    for i=1:length(len)
       volume_array = [volume_array, generate_volume(len(i),sample_rate)];
    end
    
    %      F(1), G(2), A(3),  B-(4),  C(5),   D(6),   E(7)
    f = [349.23, 392,  440,  466.16, 523.25, 587.33, 659.25];
    tone = [f(5),f(5),f(6),f(2),f(1),f(1),f(6)/2,f(2)];

    % Generate Sin Signal
    y = [];
    for i = 1:length(tone)
        t = linspace(0,len(i),len(i)*sample_rate);
        y = [y, sin(2 * pi * tone(i) * t )];
    end
    
    % y suppressed by volume
    y = y .* volume_array;
    
    % up for a half degree %%%%%%%
    [p,q] = rat(2^(1/12),0.00000001);
    y = resample(y,q,p);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Make sound
    sound(y, sample_rate);
    % sound(y, 2*sample_rate);    % up a key
    % sound(y, 1/2*sample_rate);  % down a key
end
