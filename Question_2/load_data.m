% Work by Lin, Tzu-Heng
% W42, Dept. of Electronic Engineering, Tsinghua University
% All rights reserved

% The Sixth Problem

clear; clc;
load Guitar.MAT;
figure;
subplot(2,1,1);plot(realwave);ylabel('realwave');
subplot(2,1,2);plot(wave2proc);ylabel('wave2proc');

% !! wavread() deprected, cannot be used.
music = audioread('fmt.wav');
sound(music, 8000);
% Indeed more genuine
