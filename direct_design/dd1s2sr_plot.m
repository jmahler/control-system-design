%
% dd1s2s_plot.m
%
% ramp response
%

Tf = 4;  % time final (sec)

dd1s2s_init;  % dd1s2_init.m

Hz = K*Gz/(1 + Dz*Gz);

ramp(Hz, Tf);

print('dd1s2sr_plot.eps', '-deps');
