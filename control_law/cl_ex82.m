%
% cl_ex82.m
%
% Control Law example from Franklin & Powell for Example
% 8.3 Pg. 288
%

clear;

addpath('../lib');

T = 0.4;  % time step
Tend = 50;

% roots
z1 = [0.9 0.9 0.9 0.9];
z2 = [(0.9 + 0.05i) (0.9 - 0.5i) (0.8 + 0.4i) (0.8 - 0.4i)];

H = [1 0 0 0];
A = [0 1 0 0;
	 -0.91 -0.036 0.91 0.036;
	 0 0 0 1;
	 0.091 0.0036 -0.091 -0.0036];
n = length(A);  % order
B = [0; 0; 0; 1];
C = eye(n);
D = zeros(n, 1);

x0 = [1; 0; 0; 0];  % initial x

sysC = ss(A, B, C, D);
sysD = c2d(sysC, T, 'ZOH');

[Phi, Gamma, H, G] = ssdata(sysD);

% can't use 'place' with identical roots
%K1 = place(Phi, Gamma, z1);
K1 = myacker(Phi, Gamma, z1);
K2 = myacker(Phi, Gamma, z2);

% create a gain of K using D and zeroing others
sysK1 = ss(zeros(1,1), zeros(1,4), zeros(1,1), K1, T);
sysK2 = ss(zeros(1,1), zeros(1,4), zeros(1,1), K2, T);

%sysCL1 = feedback(sysD*K1, -1);
%sysCL2 = feedback(sysD*K2, -1);
sysCL1 = feedback(sysD, sysK1, -1);
sysCL2 = feedback(sysD, sysK2, -1);

% simplify, structural pole/zero cancellation
sysCL1 = sminreal(sysCL1);
sysCL2 = sminreal(sysCL2);

u = zeros([(Tend/T) 1]);
[y1,t1] = lsim(sysCL1, u, [], x0);
[y2,t2] = lsim(sysCL2, u, [], x0);

figure(1);
subplot(2, 1, 1);
%plot(t1, y1);  % all
plot(t1, y1(:,1));  % one
grid on;
axis tight;
title('Regulator Response, roots: (0.9 0.9 0.9 0.9)');
%xlabel('time (sec)');
ylabel('y');

subplot(2, 1, 2);
%plot(t2, y2);  % all
plot(t2, y2(:,1));  % one
grid on;
axis tight;
title('Regulator Response, roots: (0.9 + 0.05i) (0.9 - 0.5i) (0.8 + 0.4i) (0.8 - 0.4i)');
xlabel('time (sec)');
ylabel('y');

print('cl_ex82.eps', '-depsc2');
