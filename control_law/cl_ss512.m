%
% cl_ss512.m
%
% State Space, Control Law
% full feedback (all observable)
%

addpath('../lib');

T = 0.4;  % time step
Tend = 50;

% roots
z1 = [0.9 0.9 0.9 0.9];
z2 = [(0.9 + 0.05i) (0.9 - 0.5i) (0.8 + 0.4i) (0.8 - 0.4i)];

H = [1 0 0 0];
A = [0 0 1 0;
	 0 0 0 1;
	 -0.91 0.91 -0.036 0.036;
	 0.091 -0.091 0.0036 -0.0036];
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
K2 = place(Phi, Gamma, z2);

sysCL1 = feedback(K1*sysD,1);
sysCL2 = feedback(K2*sysD,1);

%sysCL1 = ss(Phi - Gamma*K1, zeros(n,1), eye(n), zeros(n,1));
[y1,t1] = initial(sysCL1, x0, Tend);
[y2,t2] = initial(sysCL2, x0, Tend);

figure(1);
subplot(2, 1, 1);
plot(t2, y1);
grid on;
axis tight;
title('roots: (0.9 0.9 0.9 0.9)');
%xlabel('time (sec)');
ylabel('y');

subplot(2, 1, 2);
plot(t2, y2);
grid on;
axis tight;
title('roots: (0.9 + 0.05i) (0.9 - 0.5i) (0.8 + 0.4i) (0.8 - 0.4i)');
xlabel('time (sec)');
ylabel('y');
