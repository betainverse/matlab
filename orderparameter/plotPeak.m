function [ muS2axis,sigS2axis ] = plotPeak( name,T,ratios,sigmas,tauC )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
mu0=1.2566e-6; %T*m/A, ideal vacuum apedimity constant
gammaH=2.675e8; %s-1*T-1, proton gyromagnetic ratio
rHH=1.813e-10; %m, the distance between pairs of methyl protons
h=6.626E-34; %J*s, Planck constant

F = @(x,xdata)(0.5*x(1)*tanh(xdata*sqrt(x(1)^2+x(2)^2)))./(sqrt(x(1)^2+x(2)^2)-x(2)*tanh(xdata*(sqrt(x(1)^2+x(2)^2))));
% arbitrary initial point:
x0=[1,1];

[x,resnorm,~,exitflag,output]=lsqcurvefit(F,x0,T,ratios)
figure
plot(T,F(x,T),'b')
hold on
errorbar(T,ratios,sigmas,'bo')
title(name)
xlabel('Relaxation Delay (s)')
ylabel('Ia/Ib')
[ muS2axis,sigS2axis ] = S2error( T,ratios,sigmas,tauC )
S2expression = sprintf('S2 = %.2f±%.2f',muS2axis,sigS2axis)
text(0.01,0.02,S2expression)
end

