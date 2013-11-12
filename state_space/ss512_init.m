
%
% ss512_init.m
%
% State Space, Control Law
%  full feedback (all observable)
%

clear;

% problem specs
T = 0.4;  % time step
%
A = [0 0 1 0;
     0 0 0 1;
     -0.91 0.91 -0.036 0.036;
     0.091 -0.091 0.0036 -0.0036];
n = size(A, 1);  % order
B = [0; 0; 0; 1];
% zero D and pass x through C (x' = Ax + Bu only)
C = eye(n);
D = zeros([n 1]);
x1 = [1; 0; 0; 0];  % initial x
% roots (Eignevalues)
% case 1
z1 = [0.9 0.9 0.9 0.9];
% case 2
z2 = [(0.9 + 0.05i) (0.9 - 0.05i) (0.8 + 0.4i) (0.8 - 0.4i)];

% Convert continuous state space to discrete (Gamma, Phi)
sysC = ss(A, B, C, D);
sysD = c2d(sysC, T);
[Phi, Gamma, H, G] = ssdata(sysD);

% case 1
K1 = myacker(Phi, Gamma, z1);
K1matlab = acker(Phi, Gamma, z1);
% 'acker' must be used instead of 'place' when
%  there are duplicate roots.

% case 2
K2 = myacker(Phi, Gamma, z2);
K2matlab = place(Phi, Gamma, z2);
%K2matlab = acker(Phi, Gamma, z2);

% full order "predictor" estimator
z3 = 0.85*z2;
H = [1 0 0 0];
Lp = acker(Phi', H', z3)';