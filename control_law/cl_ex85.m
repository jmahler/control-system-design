%
% cl_ex85.m
%
% Control Law, Full Order, Predictor Estimator.
% 
% From Example 8.5 on Pg. 294 of Franklin & Powell.
% Expansion of Example 8.1 and 8.2.
%

clear;
clf;

T = 0.1;
Tend = 5;

Phi = [	1 T;
		0 1];
Gamma = [T^2/2; T];
n = length(Phi);  % order

% Find Gz
Gz = ss(Phi, Gamma, eye(n), zeros(n,1), T);

% Find K
% roots
z1 = [0.8 + 0.25i; 0.8 - 0.25i];
K1 = place(Phi, Gamma, z1);
% create a gain of K using D and zeroing others
sysK1 = ss(zeros(1,1), zeros(1,n), zeros(1,1), K1, T);

% Find Lp
H = [1 0];  % filter
z2 = [(0.4 + 0.4i) (0.4 - 0.4i)];
Lp = place(Phi', H', z2)';
sysL = ss((Phi - Gamma*K1 - Lp*H), Lp, eye(n), zeros(2,1), T);

% Build system
sysCL1 = feedback(Gz*H, sysL*sysK1, -1);
sysCL1 = sminreal(sysCL1);

% Simulate
x0 = [1; 0; 0; 0];  % initial x
u = zeros([(Tend/T) 2]);
[y1,t1] = lsim(sysCL1, u, [], x0);

% Plot
figure(1);
%stairs(t1, y1);  % all
stairs(t1, y1(:,1));  % one
grid on;
axis tight;
title('Regulator Response, Full Order Predictor Estimator');
xlabel('time (sec)');
ylabel('y');

print('cl_ex85.eps', '-depsc2');
