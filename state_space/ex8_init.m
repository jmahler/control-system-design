
% Chapter 8 examples
% [Digital Control of Dynamic Systems]
%
% Full Order, Full Feedback, Control Law, 
% Full Order "predictor" Estimator

clear;

% ex8.2 [Pg. 286]
% Full Feedback
T = 0.1;
Phi = [1 T; 0 1];
Gam = [T^2/2; T];
p = [0.8+0.25i; 0.8-0.25i];
K = acker(Phi, Gam, p);
x1 = [1; 0];  % initial state

% ex8.4 [Pg. 292], ex8.5 [Pg. 294]
% estimator
% (same specs a ex8.2)
p = [0.4+0.4i; 0.4-0.4i];
H = [1 0];
Lp = acker(Phi', H', p)';