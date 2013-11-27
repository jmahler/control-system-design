%
% mm3679_init.m
%
% Model Matching
%
% Example from Ogata Pg. 532
%
% Requires: Octave with control toolbox
%

addpath('../lib');

T = 1;

Bz = [0.3679 0.2642];
Az = [1 -1.3679 0.3679];
Gz = tf(Bz, Az, T);
set(Gz, 'inname', 'u1', 'outname', 'y1');

% model to match
Bm = [0.62 -0.3];
Am = [1 -1.2 0.52];
Gm = tf(Bm, Am, T);

% Chosen to acheive order 2n-1 in D for Ackerman's
% order n=2, m=1
F = [1 0];  % z
H1 = [1 0.5];  % z + 0.5
D = conv(F, conv(H1, Bz));  % D = F*B*H1
D = flipud(transpose(D));

E = sylvester(Az, Bz);

M = E\D;

Alpha = fliplr(transpose(M(1:2)));
Beta = fliplr(transpose(M(3:4)));

GmH1 = tf(conv(Bm, H1), Am, T);
set(GmH1, 'inname', 'r1', 'outname', 'v1');

AlphaF = tf(Alpha, F, T);
set(AlphaF, 'inname', 'u1', 'outname', 's1');

BetaF = tf(Beta, F, T);
set(BetaF, 'inname', 'y1', 'outname', 's3');

sum1 = sumblk('u1 = v1 - q1');
sum2 = sumblk('q1 = s1 + s3 - u1');

sys = connect(GmH1, sum1, AlphaF, BetaF, sum2, Gz, 'r1', 'y1');
