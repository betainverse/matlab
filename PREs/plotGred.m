function [maxG] = plotGred(pA,R2a,R2b,kex)
pB=1-pA;
pi=3.14;
nuA=100;
nuB=180;
nu=0:280;
lambdaA=R2a+pB*kex-2*pi*1i*(nuA-nu);
lambdaB=R2b+pA*kex-2*pi*1i*(nuB-nu);
G=1i*20*(lambdaA*pB+lambdaB*pA+2*pA*pB*kex)./(lambdaA.*lambdaB-pA*pB*kex*kex);
plot(nu,imag(G),'r')
maxG = max(imag(G));
end

