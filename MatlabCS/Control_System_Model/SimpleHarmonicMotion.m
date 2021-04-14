%% Simple Harmonic Motion Equation
% Author: Sourav Dey
% PS Number: 99003785
% Date: 7th April 2021.
% Version: Matlab 2020b.

%% Code


M=5;
K= 2.3;
sys = tf([1],[1,0,K/M])


subplot(3,1,1)
step(sys)
subplot(3,1,2)
impulse(sys)
[z,p,k]= tf2zp([1],[1,0,K/M])
subplot(3,1,3)
zplane(z,p)
title('location of root')
S = stepinfo(sys)

 

 

 


