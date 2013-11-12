
%
% ss512_plot.m
%

clf;

ss512_init;
sim('ss512');

figure;
subplot(2, 1, 1)
plot(d1.Time, d1.Data(:,1));
grid on;
axis tight;
title('Full Feedback Response, case 1, (z - 0.0)^4');
ylabel('y');
xlabel('time (sec)');

subplot(2, 1, 2);
plot(d2.Time, d2.Data(:,1));
grid on;
axis tight;
title('Full Feedback Response, case 2');
ylabel('y');
xlabel('time (sec)');

figure;
plot(d3.Time, d3.Data(:,1));
grid on;
axis tight;
title('Full Order "predictor" Estimator');
ylabel('y');
xlabel('time (sec)');
