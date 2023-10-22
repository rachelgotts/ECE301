clc
clear all
close all 

% n=0:15;
% a=[1 -0.7 0.1];
% b=[2 3 0];
% yi=[]
% x=zeros(1,15);
% x(1:4)=[1,2,3,4];
% 
% y=filter(b,a,x);
% 
% plot(n,y)
% xlabel('n')
% ylabel('Value')
% title('Plot of Output Signal')
% grid on
% 

yi = 0; %y(-1)
yj = 0; %y(-2)
y = zeros(1,15);
x = zeros (1,15);
x(1:4) = [1 2 3 4];
xi = 0; %x(-1)
q = 0:14;

for n = 1:15
    if n == 1
        y(n) = .7*yi-0.1*yj+2*x(n)+3*xi; 
    elseif n==2
        y(n) = .7*y(n-1)-0.1*yi+2*x(n)+3*x(n-1);
    else
        y(n) = .7*y(n-1)-0.1*y(n-2)+2*x(n)+3*x(n-1);
    end
end
stem(q,y,'r')
xlabel('n  Index')
ylabel('Value')
title('Plot of Output Signal')
grid on
