%
% mapzest_1s2s_plot.m
%
% s -> z mapping, z=e^(sT)
%
% unstable!
%

Tf = 8;  % time final (sec)

T = 0.1;

Gs = tf([1], [1 1 0]);
Ds = tf([147 880], [1 47]);

Gz = c2d(Gs, T, 'ZOH');

K = 11.87;
Dzp = tf([1 0.591], [1 -0.009], T);

Dz = c2d(Ds, T);
%Dz = K*Dzp;

%Hs = (Ds*Gs)/(1 + Ds*Gs);
Hz = (Dz*Gz)/(1 + Dz*Gz);

step(Hz, Tf);

print('mapzest_1s2s_plot.eps', '-deps');
