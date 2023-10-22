
clc;
clear all;
close all;

%% MOVE PLOTS? y/n

b = 'y';

%% Part 1
N = 100;                      % Parameters
x = linspace(-3,3,N);
y = linspace(-3,3,N);
MUx = 0;
VARx = 1;
MUy = 0;
VARy = 1;
corr_coeff = 0.6;

f_xy = bivariatePDF(x,y,MUx,VARx,MUy,VARy,corr_coeff);
figure(1);                       % Plot
meshc(x,y,f_xy);
shading interp;
colorbar;
title('Part 1: Standard Bivariate Gaussian PDF')
xlabel('x');
ylabel('y');
zlabel('Joint PDF f_x_,_y(x,y)');

%% Part 2
N = 100;                      % Parameters
v = linspace(-3,3,N);
w = linspace(-3,3,N);
MUx = 0;
VARx = 1;
MUy = 0;
VARy = 1;
corr_coeff = 0.6;

W = [v;w];

A =  1/sqrt(2)*[1 1; -1 1];   %    A =  [1/sqrt(2)  1/sqrt(2)]
                              %         [-1/sqrt(2) 1/sqrt(2)]
input = A^-1*W;
x = input(1,:);               %    Transformation
y = input(2,:);

f_vw = bivariatePDF(x,y,MUx,VARx,MUy,VARy,corr_coeff)/det(A);     %f_v_w(v,w) = f_x_y(A^-1*W)/det(A)
figure(2);                       % Plot
meshc(v,w,f_vw);
shading interp;
colorbar;
title('Part 2: PDF of linear transformations')
xlabel('v');
ylabel('w');
zlabel('Joint PDF f_v_,_w(v,w)')


%% Part 3
m = 100; %100 samples
MUx = 3;
VARx = 5^2;
MUy = 3;
VARy = 1^2;
corr_coeff = 0.7;

Z = randn(2,m);

A = [sqrt(VARx) 0; corr_coeff*sqrt(VARy) sqrt((1-corr_coeff^2)*VARy)];

MU = [MUx; MUy];

X = MU + A*Z;

x = X(1,:);
y = X(2,:);

figure(3);
scatter(x,y,20,'filled');
hold on;
title('Part 3a: Generating Bivariate Samples Using Standard Gaussian PDF');
xlabel('x');
ylabel('y');


x = sort(x); %sort randomly generated samples
y = sort(y);

f_xy = bivariatePDF(x,y,MUx,VARx,MUy,VARy,corr_coeff);


figure(4);                       % Plot
meshc(x,y,f_xy);
shading interp;
colorbar;
title('Part 3b: Generating Bivariate Samples Using Standard Gaussian PDF');
xlabel('x');
ylabel('y');
zlabel('Joint PDF f_x_,_y(x,y)')


%% Part 4a
N = 100;                      % Parameters
MUx = 0;
SIGx = 2;
VARx = 4;
MUn = 0;
SIGn = 2;
VARn = 4;
MUy = 0;
SIGy = sqrt(VARx+VARn);
VARy = SIGy^2;
corr_coeff = 0;

x = normrnd(0,SIGx,1,N); %Generate Z1 and Z2
y = normrnd(0,SIGy,1,N);

x_orig = x; %preserve originally generated values before sorting
y_orig = y; 

x = sort(x); %sort randomly generated variables for plotting
y = sort(y);

A  = [1 0; 1 1];

w = A\[x;y];
x = w(1,:);
n = w(2,:);

f_xy = bivariatePDF(x,n,MUx,VARx,MUn,VARn,corr_coeff)/det(A);
figure(5);                       % Plot
meshc(x,y,f_xy);
shading interp;
colorbar;
title('Part 4a: Estimating a signal from its noisy measurements')
xlabel('x');
ylabel('y');
zlabel('Joint PDF f_x_,_y(x,y)')

%% Part 4b
A  = [1 0; 1 1];

w = A\[x_orig;y_orig];
x = w(1,:);
n = w(2,:);

x_i = x;
n_i = n;

% y_i = x_i + n_i;
y_i = y_orig;

x_hat = (VARx/(VARx+VARn)).*y_i; %generate estimated signal

figure(6);
plot(1:1:N,x_i,'r');
hold on;
plot(1:1:N,y_i,'b-.');
plot(1:1:N,x_hat,'k-'); xlabel('Sample Number'); ylabel('Signal');
title('Part 4b: Samples of the Original, Measured, and Estimated Signals')
legend('Original Signal','Measured Signal','Estimated Signal');

%% Part 4c
figure(7);
error_M_O = abs(y_i - x_i);
error_E_O = abs(x_hat-x_i);
plot(1:1:N,error_M_O,'b-.');
title('Part4c: Errors');
hold on;
plot(1:1:N,error_E_O,'k-'); xlabel('Sample Number'); ylabel('Error');
legend('Measured Error', 'Estimated Error')

%% Part 4d
sum1 = sum((y_i-x_i).^2);
sum2 = sum((x_hat-x_i).^2);

fprintf("Sum of Squared Measured Error:  %f\n", sum1);
fprintf("Sum of Squared Estimated Error: %f\n", sum2);

moveplots(b);

%% BivariatePDF Function
function f_xy = bivariatePDF(x,y,mu1,var1,mu2,var2,corr_coeff)
    cov = [var1,  corr_coeff*sqrt(var1)*sqrt(var2); %Calculate covariance matrix
           corr_coeff*sqrt(var1)*sqrt(var2)   var2];
  
    mu = [mu1;mu2]; %Mean matrix

    f_xy = zeros(length(x),length(y));

    for i=1:length(x) %Nested for loop to calculate bivariate guassian pdf
        for j=1:length(y)
            xVec = [x(i); y(j)];
            f_xy(i,j) = (1/(2*pi*sqrt(det(cov))))*exp(-0.5*(xVec-mu)'*cov^-1*(xVec-mu));
        end
    end
end


%% Move plots function
function moveplots(b)
    if b=='y'
        
        fprintf("\n\nMoving Plots. If this is not desired, change variable b to 'n' on line 14\n")

        movegui(1,'northwest');
        movegui(2,'north');
        movegui(3,'northeast');
        movegui(4,'southwest');
        movegui(5,'south');
        movegui(6,'southeast');
        movegui(7,'center');
    end
end