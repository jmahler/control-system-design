%
% cl_ex82.m
%
% Control Law example from Franklin & Powell for Example
% 8.3 Pg. 288
%

addpath('../lib');

T = 0.4;

H = [1 0 0 0];

F = [0 1 0 0;
	 -0.91 -0.036 0.91 0.036;
	 0 0 0 1;
	 0.091 0.0036 -0.091 -0.0036];
G = [0; 0; 0; 1];
J = 0;

sysC = ss(F, G, H, J);

sysD = c2d(sysC, T, 'zoh');

p = [0.9; 0.9; 0.9; 0.9];

[phi,gam,H,J] = ssdata(sysD);

%K = acker(phi,gam,p);
%K = myacker(phi,gam,p);
K = place(phi,gam,p);

sysCL = feedback(K*sysD,1);
%sysCL = feedback(sysD*K,1);
%sysCL = feedback(sysD*K,'+');

Xo = [1;0;0;0];

d = initial(sysCL,Xo);
