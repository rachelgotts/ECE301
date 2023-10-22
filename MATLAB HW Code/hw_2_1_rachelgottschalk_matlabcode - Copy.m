clc;
clear all;
close all;

x = [3 0 1];
h = [2 -6 -2];

y = conv(x,h);
t = 0:4; 

stem(t,y)
title('Output vs n')
xlabel('n')
ylabel('y(n)')