clc; close all; clear all; 

% reference
t01 = 161863;
t02 = 271750;
t03 = 470891;

% mac
t11 = 742895;
t12 = 852139;
t13 = 1050750;

%hp
t21 = 83464;
t22 = 192354;
t23 = 391974;

%iphone 
t31 = 308778;
t32 = 418141;
t33 = 617336;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%gunshot 1 
d10 = 18.2;
d11 = 20;
d12 = 18.9;

d1g1 = delay(t11,t01,t12,t02,d10,d11);
d1g2 = delay(t11,t01,t13,t03,d10,d12);

shot1 = [d1g1 d1g2]

%gunshot 2
d20 = 27.2;
d21 = 18;
d22 = 27.2;

d2g1 = delay(t21,t01,t22,t02,d20,d21);
d2g2 = delay(t21,t01,t23,t03,d20,d22);

shot2 = [d2g1 d2g2]

%gunshot 3
d30 = 36.3;
d31 = 21;
d32 = 37.24;

d3g1 = delay(t31,t01,t32,t02,d30,d31);
d3g2 = delay(t31,t01,t33,t03,d30,d32);

shot3 = [d3g1 d3g2]


%%%%%%%%%%%%%%%%%%%%%%%%%%%% Functions %%%%%%%%%%
function delay = delay(time1, time2, time3, time4,d1, d2)
    d1 = (2*(d1))/1125.33;
    d2 = (2*(d2))/1125.33;
    delay = 0.5*(-d1-d2+(time1-time2)+(time3-time4));
end