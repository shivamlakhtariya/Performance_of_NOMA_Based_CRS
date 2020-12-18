clc;
clear all;
close all;
load file_ldacstxpkt;
Tx_Packet = Tx_Packet.' ;
KFactor=3;
Ts = le-4;
Fd=100;
Tau = [0 1.5e-4 2.5e-4];
PdB = [0, -2, -6 ];
%pkt_allones = ones(1,480) + i*ones(1,480);
h = racianchan(Ts,Fd,KFactor,Tau,PdB);
plot(h);




