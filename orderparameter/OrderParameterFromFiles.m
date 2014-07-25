%Plot data for WT M32 Zn, with nonlinear data fitting. 
mu0=1.2566e-6; %T*m/A, ideal vacuum apedimity constant
gammaH=2.675e8; %s-1*T-1, proton gyromagnetic ratio
rHH=1.813e-10; %m, the distance between pairs of methyl protons
h=6.626E-34; %J*s, Planck constant
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

% Yfiles is a cell? containing the peaklist file names for the yes
% condition, in the order corresponding to the delay lengths listed in T. 
% Each peaklist file contains the following columns:
% Assignment w1 w2 Data_Height S/N

Yfiles = ...
    {'20140624_apoCzra_DQ_y_40c_ph6_2ms.list',
    '20140624_apoCzra_DQ_y_40c_ph6_5ms.list',
    '20140624_apoCzra_DQ_y_40c_ph6_8ms.list',
    '20140624_apoCzra_DQ_y_40c_ph6_12ms.list',
    '20140624_apoCzra_DQ_y_40c_ph6_17ms.list',
    '20140624_apoCzra_DQ_y_40c_ph6_22ms.list',
    '20140624_apoCzra_DQ_y_40c_ph6_27ms.list'};

% Nfiles is a cell containing the peaklist file names for the no
% condition, in the order corresponding to the delay lengths listed in T. 
% Each peaklist file contains the following columns:
% Assignment w1 w2 Data_Height S/N

Nfiles = ...
    {'20140624_apoCzra_DQ_n_40c_ph6_2ms.list',
    '20140624_apoCzra_DQ_n_40c_ph6_5ms.list',
    '20140624_apoCzra_DQ_n_40c_ph6_8ms.list',
    '20140624_apoCzra_DQ_n_40c_ph6_12ms.list',
    '20140624_apoCzra_DQ_n_40c_ph6_17ms.list',
    '20140624_apoCzra_DQ_n_40c_ph6_22ms.list',
    '20140624_apoCzra_DQ_n_40c_ph6_27ms.list'};

% Test whether the same number of Yfiles and Nfiles are given, and whether
% that matches the number of delays!

% Read in and collate all the data
[ ratiosMap,sigmasMap ] = parsePeakLists( Yfiles,Nfiles )
% Plot the fits, compute S2, and compute the error in S2.
for key=ratiosMap.keys
name = char(key)
[ S2,sigS2 ] = plotPeak(name,T,ratiosMap(name).',sigmasMap(name).',tauC)
end