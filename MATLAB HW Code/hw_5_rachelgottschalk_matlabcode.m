clc; clear all; close all;

% PART 1
b0 = 1/6; % b = zeros
b2 = [1 1]; 
b3 = [1 2];
a2 = [1 -0.8];
a3 = [1 -.5];

b = b0*conv(b2,b3);
a = conv(a2,a3);

figure(1)
freqz(b,a); hold on; grid on;

% Part 2 and 3

n = 0:99;

x_n = cos(.2*pi*n);
y_n = 2.33*cos(0.2*pi*n-2.122);
yn2 = filter(b,a,x_n);

figure(2)
subplot(2,1,1)
plot(n,y_n, 'b',LineWidth=1)
title('y(n) first 100 samples')
hold on;
grid on;
subplot(2,1,2)
plot(n,yn2,'r', LineWidth=1)
title('y(n) 0 to 99')
hold on;
grid on;



b1 = 1;
b2 = 1;
a1 = [1 -1.2 1];
a2 = [1 -1];

b=conv(b1,b2);
a = conv(a1,a2);

[r,p,k]=residuez(b,a)



