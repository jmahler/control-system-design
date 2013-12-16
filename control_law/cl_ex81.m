%
% cl_ex81.m
%
% Control Law, Full Order, No Estimation.
%
% Example from Franklin & Powell for Examples
% 8.1 and 8.2 on Pg. 282-286.
%

clear;
clf;

T = 0.1;  % time step
Tend = 5;

% roots
z1 = [0.8 + 0.25i; 0.8 - 0.25i];

Phi = [1 T; 0 1];
Gamma = [T^2/2; T];
n = length(Phi);  % order

x0 = [1; 0];  % initial x

sysD = ss(Phi, Gamma, eye(n), zeros(n,1), T);

K1 = place(Phi, Gamma, z1);

% create a gain of K using D and zeroing others
sysK1 = ss(zeros(1,1), zeros(1,n), zeros(1,1), K1, T);

sysCL1 = feedback(sysD, sysK1, -1);
sysCL1 = sminreal(sysCL1);

u = zeros([(Tend/T) 1]);
[y1,t1] = lsim(sysCL1, u, [], x0);

figure(1);
%stairs(t1, y1);  % all
stairs(t1, y1(:,1));  % one
grid on;
axis tight;
title('Regulator Response, roots: (0.8 + 0.25i) (0.8 - 0.25i)');
xlabel('time (sec)');
ylabel('y');

print('cl_ex81.eps', '-depsc2');
