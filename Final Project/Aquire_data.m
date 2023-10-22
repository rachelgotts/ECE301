%% Kamp, Andrew ECE301 Final Project
clear all; close;
%% Record Soud at a given time
prompt = "What is the desired minute time to start? ";
desiredMin = input(prompt);

uslesscount = 0;
while(minute(datetime('now')) ~= desiredMin)
    uslesscount = uslesscount + 1;
    pause(1);
end

%% Record Sound Until a key is pressed
% Get device info then check the ID to set
info=audiodevinfo;

name = getenv('COMPUTERNAME');

if(name~="LAPTOP-EEIRQ1QR")
    pause(1);
end

% Current problem is that the macbooks is starting to record sooner than
% the thinkpad - about 1.3 seconds sooner. This could be hard to sync. Not
% too sure on what to do to fix this problem

device_ID = 0; % Macbook Pro


channel_num = 1; % 1: Mono 2: Stero

fs = 48000;
nbit = 16; % Use 8, 16, or 24

recorder1 = audiorecorder(fs,nbit,channel_num,device_ID);

disp("Begin")
record(recorder1);
disp("Press any key to stop the recording")

pause %% to continue from here, press any key. Thus ending our data collection

disp("Stop")
stop(recorder1);

clean_data = getaudiodata(recorder1);

len_clean_data = length(clean_data);
t = (0:1:len_clean_data-1)*1000/fs;
figure;plot(t, clean_data); 
title('clean data; sampling rate: 48kHz')
xlabel('Time [ms]');
ylabel('Amplitude');

sound(clean_data,fs)

% %Run one
% save('audioCapture.mat','fs','clean_data')

% Run two
clean_data3 = clean_data;
save('audioCapture.mat','clean_data3','-append')
