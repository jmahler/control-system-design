%
% spec0525_plot.m
%

Tf = 3;  % time final (sec)

Tr = 0.5;	% rise time
OS = 25;	% percent overshoot

wn = 2.22/Tr;
xz = -0.6*(OS/100 - 1);

Hs = tf([wn^2], [1 2*xz*wn wn^2]);

step(Hs, Tf);

print('spec0525_plot.eps', '-deps');
