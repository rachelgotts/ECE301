b0 = 1/17.5;
b1 = [1 -1.5*exp(1i*pi/3)];
b2 = [1 -1.5*exp(-1i*pi/3)];
a1 = [1 -.8];
a2 = [1 -.5];

b=b0*conv(b1,b2);
a=conv(a1,a2);

freqz(b,a,'whole')