function [ muS2axis,sigS2axis ] = S2error( T,ratios,sigmas,tauC )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

mu0=1.2566e-6; %T*m/A, ideal vacuum apedimity constant
gammaH=2.675e8; %s-1*T-1, proton gyromagnetic ratio
rHH=1.813e-10; %m, the distance between pairs of methyl protons
h=6.626E-34; %J*s, Planck constant

% eta is x(1), delta is x(2), xdata is T
F = @(x,xdata)(0.5*x(1)*tanh(xdata*sqrt(x(1)^2+x(2)^2)))./(sqrt(x(1)^2+x(2)^2)-x(2)*tanh(xdata*(sqrt(x(1)^2+x(2)^2))));
% arbitrary initial point:
x0=[1,1];
for k = 1:5000
    generatedratios=normrnd(ratios,sigmas);
    %allgeneratedratios(:,k)=generatedratios; % just to be able to plot
    %them later if desired
    [x,resnorm,~,exitflag,output]=lsqcurvefit(F,x0,T,generatedratios);
    %plot(T,F(x,T),'g')
    %hold on
    etas(k)=x(1);
    %deltas(k)=x(2);
    S2axises(k)=(10/9)*(4*pi/mu0)^2*4*rHH^6*etas(k)/(tauC*(h/(2*pi))^2*gammaH^4);
end
[muS2axis,sigS2axis,muciS2,sigmaciS2] = normfit(S2axises)
end

