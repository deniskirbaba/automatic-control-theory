%H = tf([1 1],[1 1 1]);
H = tf([1 1],[1 6 7],'InputDelay',1000);
nyquist(H)
%bode(H)
%grid on;