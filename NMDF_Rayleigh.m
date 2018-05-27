clc;
close all;

% Setting the parameters of the Jake's Fading Simulator
M=8;
N=34;
ht=0;

% Sampling time obtained from Bandwidth
ts=33.33e-6;
t=0:ts:200*ts;

% Number of Samples
s=0:1:200;

% For Normalized Doppler Frequency = 0.0027 
% Doppler Frequency
fd=80.4;

for n=1:M
   bn= (pi*n)/(M+1); 
   an=(2*pi*n)/N;
   temp=exp(1i*bn);
   h= temp*cos(2*pi*t*fd*cos(an));
   ht=ht+h;
   eo=abs(power(ht,2))/t;
   hn=ht/sqrt(eo);
   hn_db=10*log10(hn);
end

figure
plot(s,hn_db)
xlabel('Number of samples');
ylabel('|h(t)|');
title("Rayleigh Fading Channel using Jake's Fading Simulator");
hold on;

% For Normalized doppler frequency = 0.1 
ht=0;
fd=3000;
for n=1:M
   bn= (pi*n)/(M+1); 
   an=(2*pi*n)/N;
   temp=exp(1i*bn);
   h= temp*cos(2*pi*t*fd*cos(an));
   ht=ht+h;
   eo=abs(power(ht,2))/t;
   hn=ht/sqrt(eo);
   hn_db=10*log10(hn);
end

plot(s,hn_db)
xlabel('Number of samples');
ylabel('|h(t)|');
legend('NMDF = 0.0027','NMDF = 0.1');

