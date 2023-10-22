fs = 44100; %% 44.1 kHz sampling rate
nbit = 16;
channel_num = 1;
device_ID = 1;


info=audiodevinfo  
recorder1 = audiorecorder(fs,nbit,channel_num,device_ID);
record(recorder1);
stop(recorder1);
clean_data = getaudiodata(recorder1);
play(recorder1);
len_clean_data = length(clean_data);
t = (0:1:len_clean_data-1)*1000/fs;
figure;plot(t, clean_data);
title('clean data; sampling rate: 44.1kHz')
xlabel('Time [ms]');
ylabel('Amplitude');