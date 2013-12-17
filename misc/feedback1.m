%
% feedback1.m
%
% Two input system with a feedback.
%
%                u2
%                |
%      +         |
% u1 ---(+)---->(+)-----+---> y
%        ^ -            |
%        |              |
%        +--------------+
%
%
%             u1 + u2
%        y = ---------
%                2
%

clear;
clf;

T = 1;
Tend = 10;

% Build System
sum1 = sumblk('y = u2 + x');
sys1 = connect(sum1, {'x', 'u2'}, {'y'});
% Gain of 1, pass thru
G1 = tf([1], [1], T);
sys2 = feedback(sys1, G1, [1], [1], -1)

% Simulate and Plot
n = Tend/T;
u1 = 3*ones(n,1);
u2 = 1*ones(n,1);
u = [u1 u2];
lsim(sys2, u, []);
