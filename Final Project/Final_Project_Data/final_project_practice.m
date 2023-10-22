%% 
clear all; clc; close all;

load record_gunshot_fast_3times.mat;


%load record_gunshot_fast_with_talk.mat;


len =length(gunshot_data);
gunshot_data_local = zeros(len,1);
gunshot_data_local(1:(len-8e4)) = gunshot_data(8e4+1:len);

%% normalize the data

gunshot_data_local = gunshot_data_local./max(abs(gunshot_data_local));

Fs = 44.1e3;
[gunshot_fast_orig,Fs] = audioread('gunshot-fast.wav');
gunshot_fast_ref = gunshot_fast_orig(:,1);
gunshot_corr = xcorr(gunshot_data_local, gunshot_fast_ref);

[test1 test2]=find(gunshot_corr > 0.8*max(abs(gunshot_corr)));

gunshot_corr_adjust = zeros(size(gunshot_corr));
gunshot_corr_adjust(test1) = gunshot_corr(test1);



figure;
subplot(223);plot(gunshot_data_local);grid on; title('recorded');
subplot(221);plot(gunshot_fast_ref);grid on;title('reference');
subplot(222);plot(gunshot_corr);grid on;title('correlation');
subplot(224);plot(gunshot_corr_adjust);grid on;title('correlation adjusted');

%%%
