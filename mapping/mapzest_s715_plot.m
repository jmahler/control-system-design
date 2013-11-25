%
% mapzest_s715_plot.m
%
% s -> z mapping, z=e^(sT)
%
% XXX - broken

Tf = 20;  % time final (sec)

T = 0.2;

Gs = tf([1], [1 7 0]);

Bs = [1 7];
As = [1.5 2.5 1];
Ds = tf(Bs, As);

Gz = c2d(Gs, T, 'ZOH');

Zz = poly(exp(roots(Bs)*T));
Zp = poly(exp(roots(As)*T));

Dz = tf(Zz, Zp, T);

Ks = Ds(0);
K = abs((1/Dz(1))*Ks);

%K = 0.1398;
%Dz = tf([1 0.246], [1 -1.694 0.7166], T);
Dz = K*Dz;

Hz = (Dz*Gz)/(1 + Dz*Gz);

step(Hz, Tf);

%print('mapzest_s715_plot.eps', '-deps');
