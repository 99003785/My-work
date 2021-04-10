%% Simple Harmonic Motion Equation
% Author: Sourav Dey
% PS Number: 99003785
% Date: 7th April 2021.
% Version: Matlab 2020b.

%% Code


M=5;
K= 2.3;
sys = tf([1],[1,0,K/M])


subplot(4,3,1)
step(sys)
title('Step Input');
subplot(4,3,2)
impulse(sys)
title('Impulse Input');
[z,p,k]= tf2zp([1],[1,0,K/M])
subplot(4,3,3)
zplane(z,p)
title('location of root')
S = stepinfo(sys)
hold on;

M=5;
K= 2.3;
P= 2;
sys = tf([P],[1,0,K/M])

subplot(4,3,4)
step(sys)
title('Step Input for k');
subplot(4,3,5)
impulse(sys)
title('Impulse Input for k');
[z,p,k]= tf2zp([P],[1,0,K/M])
subplot(4,3,6)
zplane(z,p)
title('location of root')
S = stepinfo(sys)



 

 

 


