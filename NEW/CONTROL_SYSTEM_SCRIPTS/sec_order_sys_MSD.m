%% Second Order MSD Equation
% Author: Sourav Dey
% PS Number: 99003785
% Date: 7th April 2021.
% Version: Matlab 2020b.

%% Plant Description
% The Mass-damper Spring Second order system is taken as Plant.
% It is used in as suspension.

% Equation: Mx''(t)+ Bx'(t) + Kx(t)= Kf(t).
% f = force; B= coefficient of friction; M = mass ; v= velocity; k=spring constant.
% Values: K1= 0.9 B1= 0.4 M1=1000 Wn=0.03 ; K2= 1 B2= 0.5 M2= 500 Wn=0.44; K3= 3 B3= 1.7 M3= 340 Wn=0.09;

%% Code:
clc
clear all;
B1= ([0.1 0.5 1.7]);
M1=([1000 5 340]);M1=([1000 5 340]);
K1 = ([0.9 1 3]);
for i=1:3
    sys = tf([K1(i)/M1(i)],[1,B1(i)/M1(i),K1(i)/M1(i)])
    figure(i);
    subplot(2,1,1);
    impulse(sys);
    title('Impulse Input');
    subplot(2,1,2);
    step(sys);
    title('Step Input');
    [z,p,k]= tf2zp([K1(i)/M1(i)],[1,B1(i)/M1(i),K1(i)/M1(i)])
    figure(4);
    zplane(z,p);
    xlim([-5*1e5 3*1e5]);
    ylim([-5*1e5 3*1e5]);
    hold on;
    S = stepinfo(sys)
end


%% Math Analysis:
% Independent: Time(t)
% Dependent: Velocity(v) and Force(f)
% Constant: Mass(M), Frictional Coefficient(B), Spring constant(K)

% Roots:((-B/M)+-sqrt(sq(B/M)-4K/M))/2


% Time Response Results:
% K1= 0.9 B1= 0.4 M1=1000
% Rise Time :34.77
% settling time:7.82e+04
% Overshoot:99.47
% Undershoot:0
% PeakTime:104.71

%K2= 1 B2= 0.5 M2= 500
% Rise Time :2.54
% settling time:78.15
% Overshoot:70.21
% Undershoot:0
% PeakTime:7.024

%K3= 3 B3= 1.7 M3= 340
% Rise Time :11.32
% settling time:1.54e+03
% Overshoot:91.97
% Undershoot:0
% PeakTime:33.44

%% Comparison Analysis:(Speed, Accuracy and stability):
% For the first system the poles are present on the left hand side of the
% s-plane making it stable.
% For the second system the poles are present on the L.H.S of the s-plane
% making the system stable.
% For the third system the poles are present on thr L.H.S of the s-plane
% making the system stable .
% Among the three systems second system has the least rising time and
% settling time making it most stable and highest speed.


