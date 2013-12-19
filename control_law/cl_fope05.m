%
% cl_fope05.m
%
% Control Law, Full Order Predictor Estimator
% Predictor is plotted along with non-predictor.
%
% Derived from example given by Dr. Adel Ghandakly as
% part of his class, Computer Control of Dynamic Systems,
% taught at CSU Chico during the Fall of 2013.
%

clear;

T = 0.2;  % time step

% Continuous state space system
A = [ 0 1 0 0;
	  -4 -56 4 56;
	  0 0 0 1;
	  31.25 437.5 -62.5 -437.5];
B = [0; 1; 0; 0];

n = length(A);  % order
Gs = ss(A, B, eye(n), zeros(n,1));
% convert to digital
Gz = c2d(Gs, T, 'ZOH');
[Phi, Gamma] = ssdata(Gz);

% y = H*X
H = [1 0 -1 0];  % filter
% create a gain of H using D and zeroing others
Hz = ss(zeros(1,1), zeros(1,n), zeros(1,1), H, T);

% Find K
% roots (arbitrary)
z1 = [(0.8 + 0.25i) (0.8 - 0.25i) 0 0];
K1 = place(Phi, Gamma, z1);
% create a gain of K using D and zeroing others
K1z = ss(zeros(1,1), zeros(1,n), zeros(1,1), K1, T);

% Find Lp and L system, for predictor estimator
z2 = 0.85*z1;
Lp = place(Phi', H', z2)';
Lz = ss((Phi - Gamma*K1 - Lp*H), Lp, eye(n), zeros(n,1), T);

% Build system(s)
% no prediction
X1z = feedback(Gz, K1z, -1);
CL1z = series(X1z, Hz);
CL1z = sminreal(CL1z);  % simiplify, pole/zero cancellation
% predictor estimator
G1z = series(Gz, Hz);
G2z = series(Lz, K1z);
CL2z = feedback(G1z, G2z, -1);
CL2z = sminreal(CL2z);  % simiplify, pole/zero cancellation

% Simulate
Tend = 10;
u = zeros([(Tend/T) 1]);
% x0, initial conditions
x0 = zeros(length(CL1z.B), 1);
x0(3) = 0.1;
[y1,t1] = lsim(CL1z, u, [], x0);
x0 = zeros(length(CL2z.B), 1);
x0(3) = 0.1;
[y2,t2] = lsim(CL2z, u, [], x0);

% Plot
clf;
figure(1);
[ts1,ys1] = stairs(t1, y1);
[ts2,ys2] = stairs(t2, y2);
plot(ts1,ys1,ts2,ys2);
title('Regulator Response, Full Order Predictor Estimator');
grid on;
axis tight;
legend('non-predictor', 'predictor');
xlabel('time (sec)');
ylabel('y');

% Print to file
print('cl_fope05.eps', '-depsc2');
