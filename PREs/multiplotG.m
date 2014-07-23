figure
hold on
subplot(3,2,1)
title(['int. exchange, kex 1000, 80 Hz peak shift',sprintf('\n'),'60s-1 paramagnetic R2 enhancement (red)']);
ylabel('intensity')
xlabel('Hz')
hold on
decimals=0:0.1:1;
ratio=zeros(size(decimals));
for i=1:11;
    pA = decimals(i);
    dia = plotG(pA,20,40,1000);
    para = plotGred(pA,20,60,1000);
    ratio(i) = para/dia;
end
%figure
subplot(3,2,2)
axis([0,1,0,1])
hold on
title('peak height ratios')
ylabel('ratio')
xlabel('fraction bound')
%hold on
pBs=1-decimals;
plot(pBs,ratio)

%figure
subplot(3,2,3)
title(['fast exchange, kex 10000, 80 Hz peak shift',sprintf('\n'),'60s-1 paramagnetic R2 enhancement (red)']);
ylabel('intensity')
xlabel('Hz')
hold on
%decimals=0:0.1:1;
%ratio=zeros(size(decimals));
for i=1:11;
    pA = decimals(i);
    dia = plotG(pA,20,40,10000);
    para = plotGred(pA,20,60,10000);
    ratio(i) = para/dia;
end
%figure
subplot(3,2,4)
axis([0,1,0,1])
title('peak height ratios')
ylabel('ratio')
xlabel('fraction bound')
hold on
%pBs=1-decimals;
plot(pBs,ratio)
ratio
%figure
subplot(3,2,5)
title(['faster exchange, kex 100000, 80 Hz peak shift',sprintf('\n'),'60s-1 paramagnetic R2 enhancement (red)']);
ylabel('intensity')
xlabel('Hz')
hold on
%decimals=0:0.1:1;
%ratio=zeros(size(decimals));
for i=1:11;
    pA = decimals(i);
    dia = plotG(pA,20,40,100000);
    para = plotGred(pA,20,60,100000);
    ratio(i) = para/dia;
end
%figure
subplot(3,2,6)
axis([0,1,0,1])
title('peak height ratios')
ylabel('ratio')
xlabel('fraction bound')
hold on
%pBs=1-decimals;
plot(pBs,ratio)
ratio