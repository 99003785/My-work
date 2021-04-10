%% Simple Harmonic Motion Equation
% Author: Sourav Dey
% PS Number: 99003785
% Date: 7th April 2021.
% Version: Matlab 2020b.

%% Code:

K = [2.3 0];
M = [5 0];

 

for i = 1
    sys_ol = tf([1],[1,0,K/M])
    sys_cl = feedback(sys_ol,1);
    
    [GC_PI,info_PI] = pidtune(sys_ol,'PI');
     sys_cl_PI = feedback(sys_ol * GC_PI,1);
    
    [GC_PD,info_PD] = pidtune(sys_ol,'PD');
    sys_cl_PD = feedback(sys_ol * GC_PD,1);
    
    [GC_PID,info_PID] = pidtune(sys_ol,'PID');
    sys_cl_PID = feedback(sys_ol * GC_PID,1);

 

    % PZ map
    figure(1);
    subplot(5,3,i);
    pzmap(sys_ol);
    title(['PZ MAP of ', num2str(i) ,' OL TF']);
   
    subplot(5,3,i+3);
    pzmap(sys_cl);
    title(['PZ MAP of ', num2str(i) ,' CL TF']);
   
    subplot(5,3,i+6);
    pzmap(sys_cl_PI);
    title(['PZ MAP of ', num2str(i) ,' CL PI TF']);
   
    subplot(5,3,i+9);
    pzmap(sys_cl_PD);
    title(['PZ MAP of ', num2str(i) ,' CL PD TF']);
   
    subplot(5,3,i+12);
    pzmap(sys_cl_PID);
    title(['PZ MAP of ', num2str(i) ,' CL PID TF']);

 
% input response plots
    figure(2);
    subplot(4,3,i);
    step(sys_ol);
    title(['Step of ', num2str(i) ,'th OL TF']);
    
    subplot(4,3,i+3);
    impulse(sys_ol);
    title(['impulse of ', num2str(i) ,'th OL TF']);
        
    subplot(4,3,i+6);
    step(sys_cl);
    title(['Step of ', num2str(i) ,'th CL TF']);
    
    subplot(4,3,i+9);
    impulse(sys_cl);
    title(['impulse of ', num2str(i) ,'th CL TF']);

 

% controller plots
    figure(3);
    subplot(4,3,i);
    step(sys_cl)
    title(['CL Uncontrolled response of ', num2str(i) ,'th TF']);
    
    subplot(4,3,i+3);
    step(sys_cl_PI)
    title(['CL PI controlled response of ', num2str(i) ,'th TF']);
    
    subplot(4,3,i+6);
    step(sys_cl_PD)
    title(['CL PD controlled response of ', num2str(i) ,'th TF']);
    
    subplot(4,3,i+9);
    step(sys_cl_PID)
    title(['CL PID controlled response of ', num2str(i) ,'th TF']);
    
% Bode plots
    figure(4);
    subplot(3,3,i);
    bode(sys_ol)
    title(['OL of ',num2str(i),'th TF']);
    
    subplot(3,3,i+3);
    bode(sys_cl)
    title(['CL uncontrolled ',num2str(i),'th TF']);
    
    subplot(3,3,i+6);
    bode(sys_cl_PID)
    title(['CL PID controlled ',num2str(i),'th TF']);
    
end

%% Analysis: