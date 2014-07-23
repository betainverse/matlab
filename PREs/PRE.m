linewidthHz=25;
t=0.009;
%wH=500000000;
wH=499955000; %i500
%wH=499632000; %u500
%wH=500132000; %b500
tauC=21*10^-9;


Kcm=1.23*10^-32;
conv=10^8;
Kangstrom=Kcm*(conv^6);
R2SP=0:200;
R2=linewidthHz*pi;
const=(4*tauC)+(3*tauC)/(1+((wH^2)*(tauC^2)));

ratio=(R2*exp(-t*R2SP))./(R2+R2SP);
dist=(Kangstrom*const./R2SP).^(1/6);

figure
hold on
%title('Determining PRE distance restraints','FontSize',16)
subplot(1,3,1);plot(ratio,R2SP)
xlabel('Intensity Ratio Ox/Red','FontSize',16)
ylabel('Relaxation Enhancement','FontSize',16)
%figure
subplot(1,3,2);plot(R2SP,dist)
xlabel('Relaxation Enhancement','FontSize',16)
ylabel('Distance (A)','FontSize',16)
%figure
subplot(1,3,3);plot(ratio,dist)
xlabel('Intensity Ratio Ox/Red','FontSize',16)
ylabel('Distance (A)','FontSize',16)
%title('Determining PRE distance restraints','FontSize',16)