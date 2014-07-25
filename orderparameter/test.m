



%allYdata = []

% for one file:
%No2msFile = '20140624_apoCzra_DQ_n_40c_ph6_2ms.list';

%[IM,SNM] = parseListFile(No2msFile);
%IM('M32C-C');

tauC=10.595e-9; %s, the global molecular tumbling time, (if you have not measured your protein’s tauC, use the following website to calculate the rough value, http://nickanthis.com/tools/tau),

% T is a column vector containing the lengths of the delays used in the
% experiment, expressed in seconds. For each time point, you have 2 peak 
% list files, one for the yes condition, and one for the no condition.
T = ... %time (s)
    [0.0020
    0.0050
    0.0080
    0.0120
    0.0170
    0.0220
    0.0270]; 


Yfiles = ...
    {'20140624_apoCzra_DQ_y_40c_ph6_2ms.list',
    '20140624_apoCzra_DQ_y_40c_ph6_5ms.list',
    '20140624_apoCzra_DQ_y_40c_ph6_8ms.list',
    '20140624_apoCzra_DQ_y_40c_ph6_12ms.list',
    '20140624_apoCzra_DQ_y_40c_ph6_17ms.list',
    '20140624_apoCzra_DQ_y_40c_ph6_22ms.list',
    '20140624_apoCzra_DQ_y_40c_ph6_27ms.list'};
Nfiles = ...
    {'20140624_apoCzra_DQ_n_40c_ph6_2ms.list',
    '20140624_apoCzra_DQ_n_40c_ph6_5ms.list',
    '20140624_apoCzra_DQ_n_40c_ph6_8ms.list',
    '20140624_apoCzra_DQ_n_40c_ph6_12ms.list',
    '20140624_apoCzra_DQ_n_40c_ph6_17ms.list',
    '20140624_apoCzra_DQ_n_40c_ph6_22ms.list',
    '20140624_apoCzra_DQ_n_40c_ph6_27ms.list'};
[ ratiosMap,sigmasMap ] = parsePeakLists( Yfiles,Nfiles )
for key=ratiosMap.keys
name = char(key)
[ S2,sigS2 ] = plotPeak(name,T,ratiosMap(name).',sigmasMap(name).',tauC)
end
