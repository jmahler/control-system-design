%
% dd1s2_plot.m
%
% ramp response
%

Tf = 4;  % time final (sec)

dd1s2_init;  % dd1s2_init.m

Hz = K*Gz/(1 + Dz*Gz);

ramp(Hz, Tf);

print('dd1s2r_plot.eps', '-deps');
