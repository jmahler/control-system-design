%
% dd1s2s_init.m
%
% Direct Design
%
%           1 
% G(s):  --------
%        s(s + 1)
%

addpath('../lib');

% Designer provided specifications
T = 0.2;
% Characteristic polynomial with extra root
% so that 2n-1 = 3 for n = 2.
D = transpose(poly([(0.6 + 0.4i) (0.6 - 0.4i) 0]));

n = 2;

Gs = tf([1], [1 1 0]);
Gz = c2d(Gs, T, 'ZOH');
[Bz, Az] = tfdata(Gz, 'v');

E = sylvester(Az, Bz);

% D, Alpha and Beta are in descending order
% so they will be reversed.

%M = E^-1*transpose(D);
M = E\flipud(D);

% Alpha = a0*z + a1
% Beta = b0*z + b1
Alpha = fliplr(transpose(M(1:n)));
Beta = fliplr(transpose(M((n+1):end)));

Dz = tf(Beta, Alpha, T);

% To find K, the limit should go to 1
% for a step input.
% (refer to the notes for a better description)
K = sum(D)/sum(conv(Bz, Alpha));
