%
% pps2s1_plot.m
%
% Pole Placement
%

T_end = 3;  % time final (sec)

Gs = tf([1], [1 1 0]);
Ds = tf([149 880], [1 47]);

Hs_nc = (Gs)/(1 + Gs);  % no control
Hs 	  = (Ds*Gs)/(1 + Ds*Gs);

figure;
orient tall;

subplot(2,1,1);
step(Hs_nc, T_end);
title('No Control');
xlabel('');

subplot(2,1,2);
step(Hs, T_end);
title('With Control');

print('pps2s1_plot.eps', '-deps');
