
clear all;
clf;


sim('ch423');

% 4.2

plot(simout0.Time, simout0.Data(:,1));
grid on;
axis tight;
title('4.2, Direct Design, T=0.2');
ylabel('H(s)');
xlabel('time(sec)');
pause();

% 4.3

plot(simout1.Time, simout1.Data(:,1));
grid on;
axis tight;
title('4.3, Direct Design Model Matching, T=1');
ylabel('H(z)');
xlabel('time(sec)');
pause();
