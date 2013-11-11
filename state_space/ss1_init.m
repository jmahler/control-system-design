
% State Space, full order
% 1/s^2 plant

clear;

% Problem specs
T = 0.1;
% x' = Ax * Bu
% y = Cx + Du
A = [0 1; 0 0];
B = [0; 1];
%C = [1 0];
C = eye(2);
%D = [0];
D = [0; 0];
x1 = [1; 1];  % initial x
% roots (Eigenvalues)
%z = [(0.8 + 0.245i) (0.8 - 0.245i)];
z = [(0.3749 + 0.3203i) (0.3749 - 0.3203i)]

% Convert continuous State Space to discrete (Gamma, Phi)
sysC = ss(A, B, C, D);
sysD = c2d(sysC, T);
[Phi, Gamma, H, G] = ssdata(sysD);
%H = eye(2);
%G = [0; 0];

K = myacker(Phi, Gamma, z);
%Kmatlab = acker(Phi, Gamma, z);
Kmatlab = place(Phi, Gamma, z);

% Our K should match K calculatd by Matlab
K
Kmatlab



