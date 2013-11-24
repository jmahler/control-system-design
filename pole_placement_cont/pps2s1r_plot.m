%
% pps2s1r_plot.m
%
% ramp response
%

Tf = 3;  % time final (sec)

Gs = tf([1], [1 1 0]);
Ds = tf([149 880], [1 47]);

Hs = (Ds*Gs)/(1 + Ds*Gs);

ramp(Hs, Tf);

print('pps2s1r_plot.eps', '-deps');
