clc;
clear all;
close all;

x = [2 1 0 1 2];
h = [2 1 0 1 2];

y = conv(x,h);
t = -2:6; 

stem(t,y,'linewidth', 1.5)
title('Output vs n')
xlabel('n')
ylabel('y(n)')