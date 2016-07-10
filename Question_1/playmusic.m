% Work by Lin, Tzu-Heng
% W42, Dept. of Electronic Engineering, Tsinghua University
% All rights reserved

% Input two arrays of a music, [music],[length]
function playmusic(music, len, sample_rate, speed)
    len = len / speed;
    %      F(1), G(2), A(3),  B-(4),  C(5),   D(6),   E(7)
    f = [349.23, 392,  440,  466.16, 523.25, 587.33, 659.25]; % Hz
    % Generate Sin Signal
    y = [];
    for i = 1:length(music)
        y = [y, generate_sin(f(music(i)),len(i), sample_rate)];
    end
    % Make sound
    sound(y, sample_rate);
end

% Generate Sin Signal
function y = generate_sin(f, len, sample_rate)
    t = linspace(0,len,len*sample_rate);
    y = sin(2*pi*f*( t ));
end
