%
% pps2s1ar_plot.m
%
% ramp response
%

Tf = 3;  % time final (sec)

Gs = tf([1], [1 1 0]);
Ds = tf([20 20 0], [1 4 0]);

Hs = (Ds*Gs)/(1 + Ds*Gs);

ramp(Hs, Tf);

print('pps2s1ar_plot.eps', '-deps');
