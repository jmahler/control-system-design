%
% cl_fonp01.m
%
% Control Law, Full Order, No Estimation
%
% Derived from example 8.1 and 8.2 in Franklin & Powell on Pg. 282-286.
%

clear;

T = 0.1;  % time step

Phi = [1 T; 0 1];
Gamma = [T^2/2; T];

n = length(Phi);  % order
Gz = ss(Phi, Gamma, eye(n), zeros(n,1), T);

% y = H*x, filter
H = zeros(1,n);
H(1) = 1;
% create a gain of H using D and zeroing others
Hz = ss(zeros(1,1), zeros(1,n), zeros(1,1), H, T);

% Find K
% roots (arbitrary)
z1 = [0.8 + 0.25i; 0.8 - 0.25i];
K1 = place(Phi, Gamma, z1);
% create a gain of K using D and zeroing others
K1z = ss(zeros(1,1), zeros(1,n), zeros(1,1), K1, T);

% Build system(s)
X1z = feedback(Gz, K1z, -1);
CL1z = series(X1z, Hz);
CL1z = sminreal(CL1z);

% Simulate
Tend = 5;
x0 = [1; 0];  % initial x
u = zeros([(Tend/T) 1]);
[y1,t1] = lsim(CL1z, u, [], x0);

% Plot
clf;
figure(1);
stairs(t1, y1);
grid on;
axis tight;
title('Regulator Response, roots: (0.8 + 0.25i) (0.8 - 0.25i)');
xlabel('time (sec)');
ylabel('y');

% Print to file
print('cl_fonp01.eps', '-depsc2');
