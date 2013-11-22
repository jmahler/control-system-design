%
% dd1s2_plot.m
%

Tf = 4;  % time final (sec)

dd1s2_init;  % dd1s2_init.m

Hz = K*Gz/(1 + Dz*Gz);

step(Hz, Tf);

print('dd1s2_plot.eps', '-deps');
