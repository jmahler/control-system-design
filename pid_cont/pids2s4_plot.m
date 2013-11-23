%
% pids2s4_plot.m
%
% PID
%

Tf = 2;  % time final (sec)

Gs = tf([1], [1 0.4 0]);
Ds = tf([47.996 197.14 875], [1 0]);

Hs = (Ds*Gs)/(1 + Ds*Gs);

step(Hs, Tf);

print('pids2s4_plot.eps', '-deps');
