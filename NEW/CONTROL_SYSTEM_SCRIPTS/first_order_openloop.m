%%1(b) First Order Open Loop with cntroller
% Author: Sourav Dey
% PS Number: 99003785
% Date: 7th April 2021.
% Version: Matlab 2020b.

%% Plant Description
% The Mass-damper first order system is taken as Plant.
% Equation: f= Bv + M v'
% f = force; B= coefficient of friction; M = mass ; v= velocity.
% Values: B1= 0.5 M1= 5;
% Here we have used three controllers i.e. Proportional(P), Integrator(1/s),
% Differentiator(s).

%% Code:
clc;
B1= 0.5;
M1= 5;
P = 2;

 sys = tf([P/M1],[1,B1/M1])
 subplot(4,3,1);
 impulse(sys);
 title('Impulse Input for k');
 subplot(4,3,2);
 step(sys);
 title('Step Input for k');
 subplot(4,3,3);
 [z,p,k]= tf2zp([P/M1],[1,B1/M1])
 pzmap(sys)
 subplot(4,3,10);
 bode(sys)
 
 hold on;
 S = stepinfo(sys)
    
sys = tf([P/M1],[1,B1/M1,0])
subplot(4,3,4);
impulse(sys);
title('Impulse Input for 1/s');
subplot(4,3,5);
step(sys);
title('Step Input for 1/s');
subplot(4,3,6);
[z,p,k]= tf2zp([P/M1],[1,B1/M1,0])
pzmap(sys)
 subplot(4,3,11);
 bode(sys)
hold on;
S = stepinfo(sys)
sys = tf([P/M1,0],[1,B1/M1])
subplot(4,3,7);
impulse(sys);
title('Impulse Input for s');
subplot(4,3,8);
step(sys);
title('Step Input for s');
subplot(4,3,9);
[z,p,k]= tf2zp([P/M1,0],[1,B1/M1])
pzmap(sys)
 subplot(4,3,12);
 bode(sys)
hold on;
S = stepinfo(sys)





%% Math Analysis
% Independent: Time(t)
% Dependent: Velocity(v) and Force(f)
% Constant: Mass(M) and Frictional Coefficient(B)

% Roots:(-B)/M

% Poles and Zero Calculation:


% IVT:
% 1. For step input: 0
% 2. For impulse input: 1/M

% FVT:
% 1. For step input: 1/B
% 2. For impulse input: 0

% Time Response Results:
% Rise Time :4tau = (4M)/B; where tau = M/B 


%% Comparison Analysis:(Speed, Accuracy and stability):
% First we are taking Proportional controller. From the graph we can say
% that the system is stable as the poles are on the left hand side of the
% s-plane. The proportional controller only increases the amplitude and
% does not affects any other aspect of a system.

% Second we are taking an integrator.An integrator adds a pole to
% the system at origin. Thus the stability of the system changes from
% stable to marginal stable. Use of integrator also reduces the
% steady-state error.

% Third we are taking an differentiator controller. A differentiator adds a
% zero at origin. From the graph we can say that pole is present in left
% hand side of s-plane.Zero makes a system from unstable to stable.


