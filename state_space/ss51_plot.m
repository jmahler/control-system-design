
%
% ss51_plot.m
%

ss51_init;
sim('ss51');

figure;
subplot(2, 1, 1)
plot(d1.Time, d1.Data(:,1));
grid on;
axis tight;
title('Full Feedback Response, case 1, (z - 0.0)^4');
ylabel('x(1)');
xlabel('time (sec)');

subplot(2, 1, 2);
plot(d2.Time, d2.Data(:,1));
grid on;
axis tight;
title('Full Feedback Response, case 2');
ylabel('x(1)');
xlabel('time (sec)');