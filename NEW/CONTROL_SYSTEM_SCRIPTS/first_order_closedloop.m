%%1(c) First Order close loop with controller.
% Author: Sourav Dey
% PS Number: 99003785
% Date: 7th April 2021.
% Version: Matlab 2020b.

%% Plant Description
% The Mass-damper first order system is taken as Plant.
% Equation: f= Bv + M v'
% f = force; B= coefficient of friction; M = mass ; v= velocity.
% Values: B= 0.5 M= 500;

%% Code:

%Negative Feedback using gain input
clc;
B1= 0.5;
M1= 5;
P = 2;

sys = tf([P],[M1,B1+1])
subplot(4,4,1);
impulse(sys);
title('Impulse Input for k');
subplot(4,4,2);
step(sys);
title('Step Input for k');
subplot(4,4,3);
[z,p,k]= tf2zp([P],[M1,B1+1])
pzmap(sys)
subplot(4,4,4)
bode(sys)
margin(sys)
[Gm,Pm,Wcg,Wcp] = margin(sys)
hold on;
S = stepinfo(sys)

B2= -2;
M2= 5;
P2 = 2;

sys = tf([P2],[M2,B2+1])
subplot(4,4,5);
impulse(sys);
title('Impulse Input for k-Unstable');
subplot(4,4,6);
step(sys);
title('Step Input for k-Unstable');
subplot(4,4,7);
[z,p,k]= tf2zp([P2],[M2,B2+1])
pzmap(sys)
subplot(4,4,8)
bode(sys)
margin(sys)
[Gm,Pm,Wcg,Wcp] = margin(sys)
hold on;
S = stepinfo(sys)

%Positive Feedback using integral input
B3= 0.8;
M3= 5;


sys = tf([1],[M3,B3-1,0])
subplot(4,4,9);
impulse(sys);
title('Step Input for Positive feedback');
subplot(4,4,10);
step(sys);
title('Step Input for Positive feedback');
subplot(4,4,11);
[z,p,k]= tf2zp([1],[M3,B3-1,0])
pzmap(sys)
subplot(4,4,12)
bode(sys)
margin(sys)
[Gm,Pm,Wcg,Wcp] = margin(sys)
hold on;
S = stepinfo(sys)

%Positive Feedback using differentiator input
B4= 0.8;
M4= 5;


sys = tf([1,0],[M4,B4-1])
subplot(4,4,13);
impulse(sys);
title('Step Input for Positive feedback');
subplot(4,4,14);
step(sys);
title('Step Input for Positive feedback');
subplot(4,4,15);
[z,p,k]= tf2zp([1,0],[M4,B4-1])
pzmap(sys)
subplot(4,4,16)
bode(sys)
margin(sys)
[Gm,Pm,Wcg,Wcp] = margin(sys)
hold on;
S = stepinfo(sys)



%% Math Analysis
% Independent: Time(t)
% Dependent: Velocity(v) and Force(f)
% Constant: Mass(M) and Frictional Coefficient(B)
% T.F. = G/1-G for -ve feedback where G is open loop T.F.
% T.F. = G/1+G for +ve feedback where G is open loop T.F.
% Here we take unity feedback.
% Roots:(-B)/M

%% Comparison Analysis:(Speed, Accuracy and stability):
% First we are analysing the system with negative feedback and p
% controller. Here, rise time and settling time of the system is reduced
% thus the system becomes more stable and more fast. We can also say that
% the system is reaching stability at a faster rate. Here the P controller
% increases the amplitude also.
% From the frequency response we can say that the T.F is stable.

% From the second graph we can say that the poles are on the left hand side
% so the system is unstable. We can also  validate  by seeing the frequency
% reponse  as GM is negative, so the system is unstable.

% Now we are analysing the system with positive feedback.
% Here we are using two controllers a First Integrator and then
% Differentiator.

% For Integrator with positive feedback the stability of the system changes
% from stable to unstable. The location of the poles are also on the right
% hand side of the s-plane.
% Here the phase margin is negative which says that the system is unstable.

% For differentiator with positive feedback the system becomes unstable and
% poles are also present in the right hand side of the s-plane.
% From the frequency response we can see that the PM and GM becomes
% infinity which implies that the system is unable to accept signals without
% errors. Thus more errors get accumulated and the system becomes unstable.

