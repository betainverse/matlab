figure
subplot(2,2,1)
title('slow exchange, kex 100, 80 Hz peak shift')
ylabel('intensity')
xlabel('Hz')
hold on
for pA = 0:.1:1
    plotG(pA,20,40,100)
end
%figure
subplot(2,2,2)
title('intermediate exchange, kex 1000, 80 Hz peak shift')
ylabel('intensity')
xlabel('Hz')
hold on
for pA = 0:.1:1
    plotG(pA,20,40,1000)
end
%figure
subplot(2,2,3)
title('fast exchange, kex 10000, 80 Hz peak shift')
ylabel('intensity')
xlabel('Hz')
hold on
for pA = 0:.1:1
    plotG(pA,20,40,10000)
end
%figure
subplot(2,2,4)
title('faster exchange, kex 100000, 80 Hz peak shift')
ylabel('intensity')
xlabel('Hz')
hold on
for pA = 0:.1:1
    plotG(pA,20,40,100000)
end
