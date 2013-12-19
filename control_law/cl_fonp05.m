%
% cl_fonp05.m
%
% Control Law, Full Order, No Estimation
% Plots of two sets of roots are given.
%
% Derived from example given by Dr. Adel Ghandakly as
% part of his class, Computer Control of Dynamic Systems,
% taught at CSU Chico during the Fall of 2013.
%

clear;

addpath('../lib');

T = 0.4;  % time step

% Continuous state space system
A = [0 0 1 0;
	 0 0 0 1;
	 -0.91 0.91 -0.036 0.036;
	 0.091 -0.091 0.0036 -0.0036];
B = [0; 0; 0; 1];

n = length(A);  % order
Gs = ss(A, B, eye(n), zeros(n,1));
% convert to digital
Gz = c2d(Gs, T, 'ZOH');
[Phi, Gamma] = ssdata(Gz);

% y = H*x, filter
H = zeros(1,n);
H(1) = 1;
% create a gain of H using D and zeroing others
Hz = ss(zeros(1,1), zeros(1,n), zeros(1,1), H, T);

% Find K
% roots
z1 = [0.9 0.9 0.9 0.9];
z2 = [(0.9 + 0.05i) (0.9 - 0.5i) (0.8 + 0.4i) (0.8 - 0.4i)];
% can't use 'place' with identical roots
%K1 = place(Phi, Gamma, z1);
K1 = myacker(Phi, Gamma, z1);
K2 = myacker(Phi, Gamma, z2);
% create a gain of K using D and zeroing others
K1z = ss(zeros(1,1), zeros(1,4), zeros(1,1), K1, T);
K2z = ss(zeros(1,1), zeros(1,4), zeros(1,1), K2, T);

% Build system(s)
X1z  = feedback(Gz, K1z, -1);
CL1z = series(X1z, Hz);
X2z  = feedback(Gz, K2z, -1);
CL2z = series(X2z, Hz);
% simplify, structural pole/zero cancellation
CL1z = sminreal(CL1z);
CL2z = sminreal(CL2z);

% Simulate
Tend = 50;
u = zeros([(Tend/T) 1]);
% x0, initial conditions
x0 = zeros(length(CL1z.B), 1);
x0(1) = 1;
[y1,t1] = lsim(CL1z, u, [], x0);
[y2,t2] = lsim(CL2z, u, [], x0);

% Plot
clf;
figure(1);
subplot(2, 1, 1);
stairs(t1, y1);
grid on;
axis tight;
title('Regulator Response, roots: (0.9 0.9 0.9 0.9)');
%xlabel('time (sec)');
ylabel('y');

subplot(2, 1, 2);
stairs(t2, y2);
grid on;
axis tight;
title('Regulator Response, roots: (0.9 + 0.05i) (0.9 - 0.5i) (0.8 + 0.4i) (0.8 - 0.4i)');
xlabel('time (sec)');
ylabel('y');

% Print to file
print('cl_fonp05.eps', '-depsc2');
