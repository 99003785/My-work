%%1(a) First Order Equation
% Author: Sourav Dey
% PS Number: 99003785
% Date: 7th April 2021.
% Version: Matlab 2020b.

%% Plant Description
% The Mass-damper first order system is taken as Plant.
% Equation: f= Bv + M v'
% f = force; B= coefficient of friction; M = mass ; v= velocity.
% Values:  B1= 0.4 M1=1000; B2= 0.5 M2= 500; B3= 1.7 M3= 340;

%% Code:

B1= ([0.1 0.5 1.7]);
M1=([1000 5 340]);
for i=1:3
    sys = tf([1/M1(i)],[1,B1(i)/M1(i)])
    figure(i);
    subplot(2,1,1);
    impulse(sys);
    title('Impulse Input');
    subplot(2,1,2);
    step(sys);
    title('Step Input');
    [z,p,k]= tf2zp([1/M1(i)],[1,B1(i)/M1(i)])
    figure(4);
    zplane(z,p);
    xlim([-4*1e5 2*1e5]);
    ylim([-4*1e5 2*1e5]);
    hold on;
    S = stepinfo(sys)
end

%% Math Analysis
% Independent: Time(t)
% Dependent: Velocity(v) and Force(f)
% Constant: Mass(M) and Frictional Coefficient(B)

% Roots:(-B)/M

% IVT:
% 1. For step input: 0
% 2. For impulse input: 1/M

% FVT:
% 1. For step input: 1/B
% 2. For impulse input: 0

% Time Response Results:
% Rise Time :4tau = (4M)/B; where tau = M/B 

%% Tool Analysis:


%% Comparison Analysis:(Speed, Accuracy and stability):
% Rise time of Sys2 is lowest so Sys2 has the highest speed.
% Settling time of Sys2 is lowest so Sys2 is most stable.