%%% data preparation 
%%  Y. Lu   , Bradley University

%% created 10/20/2016

%% rev1:   10/24/2016 
% (the device ID and channel were computer-dependent when the data were recorded. 
% The file was updated to solve the problem)

%% updated 9/29/2017 (new datasets)

%% new release on 9/20/2018 


clear all; clc; close all;
%%% 
fs = 44100; %% 44.1 kHz sampling rate
nbit = 16;
channel_num = 1;
device_ID = 1;

%--------- For your information: How the data were recorded--------- 
%MATLAB Codes used to record data %%%%%%
%info=audiodevinfo  
% recorder1 = audiorecorder(fs,nbit,channel_num,device_ID);
% record(recorder1);
% stop(recorder1);
% clean_data = getaudiodata(recorder1);
% play(recorder1);
% len_clean_data = length(clean_data);
% t = (0:1:len_clean_data-1)*1000/fs;
% figure;plot(t, clean_data);
% title('clean data; sampling rate: 44.1kHz')
% xlabel('Time [ms]');
% ylabel('Amplitude');



load all_datasets.mat;
% clean DTMF signals without over-talk 



% Plot the dataset1 and play the audio 
% -----dataset1 : clean DTMF data -------
soundsc(dataset1,fs);  

figure;plot(t1,dataset1);grid on;
title([ 'dataset1;  sampling rate = '  num2str(fs) 'Hz' ]);
xlabel('Time [ms]');
ylabel('Amplitude');


pause ( round(max(t1))*1e-3);


% Plot the dataset2 and play the audio 
% -----dataset2 : light corrupted DTMF data -------

%    DTMF signals with light over-talk 
%  1 of 10 numbers is corrupted.

soundsc(dataset2,fs); %% play the signal(light over-talk)




figure;plot(t2,dataset2);grid on;
title([ 'dataset2;  sampling rate = '  num2str(fs) 'Hz' ]);
xlabel('Time [ms]');
ylabel('Amplitude');

pause ( round(max(t2))*1e-3);



% Plot the dataset3 and play the audio 
% -----dataset3 : severe corrupted DTMF data -------

%%   DTMF signals with heavy over-talk
%% most numbers are corrupted

soundsc(dataset3,fs); %% play the signal of heavy over-talk

figure;plot(t3,dataset3);grid on;
title([ 'dataset3;  sampling rate = '  num2str(fs) 'Hz' ]);
xlabel('Time [ms]');
ylabel('Amplitude');


pause ( round(max(t3))*1e-3);