clear all;
close all;
clc;

Img = imread('1.jpg');
radix = [2, 4, 8, 16, 32, 64];
for i=1:6
    tic;
    F = GroupFFT2(Img, radix(i));
    disp(['radix=', num2str(radix(i)), ' : ', num2str(toc), 's']);
end

tic;
F = GroupFFT2(Img, 'f');
disp(['radix=', 'f', ' : ', num2str(toc), 's']);

tic;
F = GroupFFT2(Img, 'b');
disp(['radix=', 'b', ' : ', num2str(toc), 's']);