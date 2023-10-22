% ECE 301, Rachel Gottschalk, Part 3 - Spectrogram 


clear all; clc; close all;
load all_datasets.mat;

%%%%%%%%%%% Dataset #1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(1);
% plot(t1,dataset1);

windows(dataset1, 1)


%%%%%%%%%%% Dataset #2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(2);
% plot(t2,dataset2);

windows(dataset2, 2)


%%%%%%%%%%% Dataset #3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(3);
%plot(t3,dataset3);

windows(dataset3, 3)


%%%%%%%%% Spectrogram Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function windows(data, fig)
    M = 4500; % length of window - mainlobe
    L = 4000; % overlap - sidelobe
    window1 = bartlett(M);
    window2 = hann(M);
    window3 = hamming(M);
    window4 = blackman(M);
    Ndft = 5000; % # of freq bins
    
    spec(data, window1, window2, window3, window4, Ndft, L, fig)

end


function spec(data, window1, window2, window3, window4, Ndft, L, fig)
    fs = 44100;
    
    figure(fig)
    subplot(2,2,1)
    spectrogram(data, window1,L,Ndft,fs)
    title("Barlett Window")
    xlim([0.6 1.8]);

    subplot(2,2,2)
    spectrogram(data, window2,L,Ndft,fs)
    title("Hanning Window")
    xlim([0.6 1.8]);

    subplot(2,2,3)
    spectrogram(data, window3,L,Ndft,fs)
    title("Hamming Window")
    xlim([0.6 1.8]);

    subplot(2,2,4)
    spectrogram(data, window4,L,Ndft,fs)
    title("Blackman Window")
    xlim([0.6 1.8]);

end




