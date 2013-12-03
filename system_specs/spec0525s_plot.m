%
% spec0525s_plot.m
%
% Shifted version the step starts at
% a non-zero value and ends much greater
% than 1.  Interestingly, the specs are
% maintained.
%

Tr = 0.5;	% rise time
OS = 25;	% percent overshoot

% calculate the 2nd order system
wn = 2.22/Tr;
xz = -0.6*(OS/100 - 1);
Hs = tf([wn^2], [1 2*xz*wn wn^2]);

% input signal
T_end = 6;  % time end (sec)
step_lo = 2;
step_hi = 20;
n = 100;
t = linspace(0, T_end, n);
u = [step_lo*ones(1,n/2) step_hi*ones(1,n/2)];

[y, t] = lsim(Hs, u, t);

figure(1);

subplot(2,1,1);
plot(t, u);
grid on;
m = step_hi*0.1;
axis([0 T_end (step_lo - m)  (step_hi + m)]);
title("Input Signal");

subplot(2,1,2);
plot(t, y);
grid on;
title("Output Response");

print('spec0525s_plot.eps', '-deps');
