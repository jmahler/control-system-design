
% State Space, Full Order, Control Law
%
% x' = Ax + Bu
% y = Cx + Du
%
% u = -K*x
%

clear;
%clf;

% Problem specs
T = 0.4;  % time step
%
A = [0 0 1 0;
     0 0 0 1;
     -0.91 0.91 -0.036 0.036;
     0.091 -0.091 0.0036 -0.0036];
n = size(A, 1);  % order
B = [0; 0; 0; 1];
% zero D and pass x through C
C = eye(n);
D = zeros([n 1]);
x1 = [1; 0; 0; 0];  % initial x
% roots (Eignevalues)
% case 1
z1 = [0.9 0.9 0.9 0.9];
% case 2
z2 = [(0.9 + 0.05i) (0.9 - 0.05i) (0.8 + 0.4i) (0.8 - 0.4i)];

% Convert continuous State Space to discrete (Gamma, Phi)
sysC = ss(A, B, C, D);
sysD = c2d(sysC, T);
[Phi, Gamma, H, G] = ssdata(sysD);

K1 = myacker(Phi, Gamma, z1);
K1matlab = acker(Phi, Gamma, z1);
% 'acker' must be used instead of 'place' when
%  there are duplicate roots.

K2 = myacker(Phi, Gamma, z2);
K2matlab = place(Phi, Gamma, z2);

% Our K should match K calculatd by Matlab
K1
K1matlab
K2
K2matlab






