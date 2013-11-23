%
% pps2s4_plot.m
%
% Pole Placement
%

Tf = 4;  % time final (sec)

Gs = tf([1], [1 0.4 0]);
Ds = tf([177.94 875], [1 47.996]);

Hs = (Ds*Gs)/(1 + Ds*Gs);

step(Hs, Tf);

print('pps2s4_plot.eps', '-deps');
