%% Test Spectral analysis using FFT, built-in Goertzel Algorithm, and Spectrogram
%% Y. Lu
%%
%% It aims to provide a comparative result of direct FFT, built-in Goertzel algorithm, and spectrogram.


clc;clear all; close all;
Fs = 44100; % sampling rate
N = 5000; % length of x    %2000, 3000, 5000

lo = sin(2*pi*727*(0:N-1)/Fs); %697
hi = sin(2*pi*1239*(0:N-1)/Fs); %1209

%%%
lo(1:1500) = 0; lo(3500:5000) = 0; 
hi(1:1500) = 0; hi(3500:5000) = 0; 
%%%
data = lo + hi;


%%%%%%%%%%%%%%%freq analysis %%%%%%%%%%%%%%%%%%%%%%
%% you need to find out a reasonable N_fft to 
%% reduce the computation

N_fft = 5000;%500, 1000, 5000
data_fft = fft(data, N_fft);

%%%%%%% Goertzel MATLAB search
% you need to rea more about Goertzel algorithm
f = [697 770 852 941 1209 1336 1477];
freq_indices = round(f/Fs*N) + 1;   
dft_data = goertzel(data,freq_indices);


figure; 
subplot(2,1,1);
stem(f,abs(dft_data)); grid on;
title('Part B')
subplot(2,1,2);
f_indx = ((0:1:N_fft-1)/N_fft)*Fs;
stem(f_indx, abs(data_fft));grid on;
title('Part A')



%% spectrogram (you need to read more about spectrogram)

figure;
spectrogram(data); 
