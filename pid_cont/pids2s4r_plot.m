%
% pids2s4_plot.m
%
% PID, ramp response
%

Tf = 5;  % time final (sec)

Gs = tf([1], [1 0.4 0]);
Ds = tf([47.996 197.14 875], [1 0]);

Hs = (Ds*Gs)/(1 + Ds*Gs);

ramp(Hs, Tf);

print('pids2s4r_plot.eps', '-deps');
