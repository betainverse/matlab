%Plot data for WT M32 Zn, with nonlinear data fitting. 
mu0=1.2566e-6; %T*m/A, ideal vacuum apedimity constant
gammaH=2.675e8; %s-1*T-1, proton gyromagnetic ratio
rHH=1.813e-10; %m, the distance between pairs of methyl protons
h=6.626E-34; %J*s, Planck constant
tauC=10.595e-9; %s, the global molecular tumbling time, (if you have not measured your protein’s ?c, use the following website to calculate the rough value, http://nickanthis.com/tools/tau),

T = ... %time (s)
    [0.0020
    0.0050
    0.0080
    0.0120
    0.0170
    0.0220
    0.0270]; 
YesI = ... %peak height in Yes condition
       [-1848
       -6848
       -9325
      -13796
      -13625
      -14669
      -15012]; 
NoI = ... %peak height in No condition
    [210432
      199072
      164087
      170676
      157143
      143310
      126862];
YesSN=[2;6;11;12;13;17;16];
NoSN=[161;144;91;172;80;93;100];

ratio=-1*YesI./NoI;
sigma=ratio.*sqrt((NoSN.^-2)+(YesSN.^-2));
% eta is x(1), delta is x(2), xdata is T
F = @(x,xdata)(0.5*x(1)*tanh(xdata*sqrt(x(1)^2+x(2)^2)))./(sqrt(x(1)^2+x(2)^2)-x(2)*tanh(xdata*(sqrt(x(1)^2+x(2)^2))));
% arbitrary initial point:
x0=[1,1];
subplot(1,2,1)
for k = 1:500
    genratios=normrnd(ratio,sigma);
    allgenratios(:,k)=genratios;
    [x,resnorm,~,exitflag,output]=lsqcurvefit(F,x0,T,genratios)
    plot(T,F(x,T),'g')
    hold on
    etas(k)=x(1);
    deltas(k)=x(2);
    S2axises(k)=(10/9)*(4*pi/mu0)^2*4*rHH^6*etas(k)/(tauC*(h/(2*pi))^2*gammaH^4);
end
avgETA=mean(etas)
stdevETA=std(etas)
%avgDELTA=mean(deltas)
%stdevDELTA=std(deltas)
%[mu,sig,muci,sigmaci] = normfit(etas)

plot(T,allgenratios,'r.')
[x,resnorm,~,exitflag,output]=lsqcurvefit(F,x0,T,ratio)
plot(T,F(x,T),'b')
errorbar(T,ratio,sigma,'bo')
title('M32 Zn WT CzrA')
xlabel('Relaxation Delay (s)')
ylabel('Ia/Ib')
subplot(1,2,2)
hist(S2axises,30)
xlabel('S2 value')
ylabel('count')
title('Histogram of S2 values from 500 generated data sets')
[muS2axis,sigS2axis,muciS2,sigmaciS2] = normfit(S2axises)
%S2axis=(10/9)*(4*pi/mu0)^2*4*rHH^6*avgETA/(tauC*(h/(2*pi))^2*gammaH^4)