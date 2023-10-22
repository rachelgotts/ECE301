%%%%%%%% ECE 301 - Final Project - Rachel Gottschalk & Andrew Kamp
clc; clear all; close all; 
%%%%%%%% speed of sound 1125.33 ft/s


%Iphone - Gun Source
gs1 = audioread('C:\Users\12623\OneDrive\Desktop\BU\Fall 2022\ECE 301\Final Project\Final_Project_Data\iPhone_Source\Shoot_One.m4a');
gs2 = audioread('C:\Users\12623\OneDrive\Desktop\BU\Fall 2022\ECE 301\Final Project\Final_Project_Data\iPhone_Source\Shoot_Two.m4a');
gs3 = audioread('C:\Users\12623\OneDrive\Desktop\BU\Fall 2022\ECE 301\Final Project\Final_Project_Data\iPhone_Source\Shoot_Three.m4a');
% pdata(gs1,gs2,gs3,1,'Gun Source');

%Macbook
mac = load('C:\Users\12623\OneDrive\Desktop\BU\Fall 2022\ECE 301\Final Project\Final_Project_Data\Macbook\audioCapture_Macbook.mat');
mac1 = mac.clean_data; 
mac2 = mac.clean_data2;
mac3 = mac.clean_data3;
% pdata(mac1,mac2,mac3,2,'Macbook');

% Hp
hp = load('C:\Users\12623\OneDrive\Desktop\BU\Fall 2022\ECE 301\Final Project\Final_Project_Data\Rachel HP\audioCaptureRachelHP.mat');
hp1 = hp.clean_data;
% hp1 = filter(1, [2 1 -1 -2],hp1);
hp2 = hp.clean_data2;
hp3 = hp.clean_data3;
% pdata(hp1,hp2,hp3,3,'Hp');

%Thinkpad & Iphone
tp = load('C:\Users\12623\OneDrive\Desktop\BU\Fall 2022\ECE 301\Final Project\Final_Project_Data\Thinkpad\audioCaptureThinkpad.mat');
ip2 = audioread('C:\Users\12623\OneDrive\Desktop\BU\Fall 2022\ECE 301\Final Project\Final_Project_Data\Thinkpad\Deer Creek.m4a');
ip3 = audioread('C:\Users\12623\OneDrive\Desktop\BU\Fall 2022\ECE 301\Final Project\Final_Project_Data\Thinkpad\Deer Creek 2.m4a');
tp1 = tp.clean_data;
% pdata(tp1,ip2,ip3,4,'Thinkpad/iPhone');

%All Graphs
% alldata(gs1,mac1,hp1,tp1,5)
alldata(gs2,mac2,hp2,ip2,5)
% alldata(gs3,mac3,hp3,ip3,7)


%indexed all data
% h = size(round(hp2));
% hr = sum(h) + 8*10^4;
% zhp2 = zeros(hr,1);
% 
% for i = 8e4:length(hp2)
%     zhp2(8*10^4+i)=hp2(i);
% end

m = 7.89e4;
zhp2 = [zeros(m,1); hp2];

imac2 = mac2(5.8*10^5:end);
ihp2 = zhp2;
itp2 = ip2(1.47*10^5:end);

alldata(gs2, imac2,ihp2, itp2,6)

%correlation
correlation(gs2, mac2, hp2, ip2,7)




%%%%%%%%%%%%%%%%%% Functions %%%%%%%%
function y = pdata(data1,data2,data3,fig,name)
    figure(fig)
    subplot(3,1,1)
    plot(data1)
    grid on;
    title(name)
    subplot(3,1,2)
    plot(data2)
    grid on;
    title(name)
    subplot(3,1,3)
    plot(data3)
    grid on;
    title(name)

end


function y = alldata(data1,data2,data3,data4,fig)
    figure(fig)
    subplot(4,1,1);
    plot(data1)
    grid on;
    title('Gun Shot Source')
    subplot(4,1,2);
    plot(data2)
    grid on;
    title('Macbook')
    subplot(4,1,3);
    plot(data3)
    grid on;
    title('Hp')
    subplot(4,1,4);
    plot(data4)
    grid on;
    title('Thinkpad/iPhone')

end

function y = correlation(gs, imac, ihp, itp,fig)
    
    cxmac = xcorr(imac,gs);
    cxhp = xcorr(ihp,gs);
    cxitp = xcorr(itp,gs);

    [a1 b1] = find(cxmac > 0.87*max(abs(cxmac)));
    [a2 b2] = find(cxhp > 0.9*max(abs(cxhp)));
    [a3 b3] = find(cxitp > 0.9*max(abs(cxitp)));

    
    cxmac_adj = zeros(size(cxmac));
    cxmac_adj(a1)=cxmac(a1);

    cxhp_adj = zeros(size(cxhp));
    cxhp_adj(a2)=cxhp(a2);

    cxitp_adj = zeros(size(cxitp));
    cxitp_adj(a3)=cxitp(a3);

    figure(fig)
    subplot(3,2,1);
    plot(cxmac); grid on;
    title("Macbook Shot 1 Correlation")
    subplot(3,2,3);
    plot(cxhp); grid on;
    title("Hp Shot 1 Correlation")
    subplot(3,2,5);
    plot(cxitp); grid on;
    title("Thinkpad Shot 1 Correlation")
    subplot(3,2,2)
    plot(cxmac_adj); grid on;
    title("Macbook Shot 1 Correlation Adjusted")
    subplot(3,2,4)
    plot(cxhp_adj); grid on;
    title("Hp Shot 1 Correlation Adjusted")
    subplot(3,2,6)
    plot(cxitp_adj); grid on;
    title("Thinkpad Shot 1 Correlation Adjusted")


    [peak1, locs1] = findpeaks(cxmac_adj);
    [peak2, locs2] = findpeaks(cxhp_adj);
    [peak3, locs3] = findpeaks(cxitp_adj);

    fs = 48000;
    t1 = locs1./(fs/1000)
    t2 = locs2./(fs/1000)
    t3 = locs3./(fs/1000)



   
end

























