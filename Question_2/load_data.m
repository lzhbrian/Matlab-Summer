% Problem_6 read audio
clear; clc;
load Guitar.MAT;
figure;plot(realwave);
figure;plot(wave2proc);

% !! wavread() deprected, cannot be used.
music = audioread('fmt.wav');
sound(music, 8000);
% Indeed more genuine