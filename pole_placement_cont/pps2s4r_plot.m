%
% pps2s4r_plot.m
%
% ramp response
%

Tf = 3;  % time final (sec)

Gs = tf([1], [1 0.4 0]);
Ds = tf([177.94 875], [1 47.996]);

Hs = (Ds*Gs)/(1 + Ds*Gs);

ramp(Hs, Tf);

print('pps2s4r_plot.eps', '-deps');
