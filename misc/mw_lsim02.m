%
% mw_lsim02.m
%
% Discrete version of mw_lsim01.m
%

clear;
clf;

A = [-20 -40 -60
	 1	 0	 0
	 0	 1	 0];
B = [1
	 0
	 0];
C = [0 0 1];
D = 0;

T = 0.01;
Ts = 0:T:10;
U = zeros(size(Ts));
X0 = [0.1 0.1 0.1];
sysC = ss(A,B,C,D);
sysD = c2d(sysC, T);

lsim(sysD, U, [], X0);
