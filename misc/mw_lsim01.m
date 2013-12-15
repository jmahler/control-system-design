%
% mw_lsim01.m
%
% Example from Mathworks showing how to use the lsim
% command with initial conditions.
%
%  http://ctms.engin.umich.edu/CTMS/index.php?aux=Extras_lsim
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

T = 0:0.01:10;
U = zeros(size(T));
X0 = [0.1 0.1 0.1];
sys = ss(A,B,C,D);
lsim(sys, U, T, X0);
