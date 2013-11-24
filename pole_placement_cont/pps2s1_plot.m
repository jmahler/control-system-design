%
% pps2s1_plot.m
%
% Pole Placement
%

Tf = 3;  % time final (sec)

Gs = tf([1], [1 1 0]);
Ds = tf([149 880], [1 47]);

Hs = (Ds*Gs)/(1 + Ds*Gs);

step(Hs, Tf);

print('pps2s1_plot.eps', '-deps');
