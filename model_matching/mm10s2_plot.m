
mm10s2_init;

sim('mm10s2');

clf;

figure;
plot(d1.Time, d1.Data(:,1));
grid on;
axis tight;
title('Model Matched Controller');
ylabel('y');
xlabel('time (sec)');

figure;
plot(d2.Time, d2.Data(:,1));
grid on;
axis tight;
title('Continuous PID');
ylabel('y');
xlabel('time (sec)');

figure;
plot(d3.Time, d3.Data(:,1));
grid on;
axis tight;
title('Discrete PID');
ylabel('y');
xlabel('time (sec)');