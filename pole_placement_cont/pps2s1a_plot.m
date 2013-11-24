%
% pps2s1a_plot.m
%
% Pole Placement
%

Tf = 3;  % time final (sec)

Gs = tf([1], [1 1 0]);
Ds = tf([20 20 0], [1 4 0]);

Hs = (Ds*Gs)/(1 + Ds*Gs);

step(Hs, Tf);

print('pps2s1a_plot.eps', '-deps');
