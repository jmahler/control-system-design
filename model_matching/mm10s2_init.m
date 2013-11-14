%
% mm10s2_init.m
%
% Model Matching

clear;

T = 0.5;

% continuous plant to discrete
Bs = 10;
As = [1 1 1];
Gs = tf(Bs, As);
Gz = c2d(Gs, T, 'ZOH');
[Bz, Az] = tfdata(Gz, 'v');

% model to match
Bm = [0.1044 0.08828];
Am = [1 -1.414 0.6065];
Gm = tf(Bm, Am, T);

% Chosen to acheive order 2n-1 in D for Ackerman's
% order n=2, m=1
F = [1 0];  % order (n-1)
H1 = [1 0.5];  % roots, order (n-m)
D = conv(F, conv(H1, Bz));

% n=2, Sylvester Matrix
E = [Az(3) 0     Bz(3) 0;
     Az(2) Az(3) Bz(2) Bz(3);
     Az(1) Az(2) Bz(1) Bz(2);
     0     Az(1) 0     Bz(1)];

Dp = transpose(fliplr(D(2:5)));

%AlphaBeta = (E^-1)*Dp;
AlphaBeta = E\Dp;
Alpha = fliplr(transpose(AlphaBeta(1:2)));
Beta = fliplr(transpose(AlphaBeta(3:4)));
Dz = tf(Beta, Alpha, T);

% [?]
QBz = conv(H1, conv(F, Bm));
QAz = conv(Alpha, Am);
Qz = tf(QBz, QAz, T);