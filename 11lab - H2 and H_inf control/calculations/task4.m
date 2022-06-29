% 4 task

% plant parameters
A = [0 1; 0 0];
B1 = [-2 1 0; 1/2 3 0];
B2 = [0; 1];
C1 = [1 0];
D1 = [0 0 2];
% first case 
C21 = [0 0; 2 3];
D21 = [-2; 0];
% second case
C22 = [6 -4; 0 0];
D22 = [0; 1];
% third case
C23 = [2 -1; 7 0; 0 0];
D23 = [0; 0; 3];

% syntesys of h2 reg
% first case
% C21'*D21;
% det(D21'*D21);
% rank([B2 A*B2]);
% rank([C21; C21*A]);
% B1*D1';
% det(D1*D1');
% rank([C1; C1*A]);
% rank([B1 A*B1]);
% [Q1, ~, ~] = icare(A,B2,C21'*C21,D21'*D21,0,eye(2),0);
% K1 = -inv(D21'*D21)*B2'*Q1;
% [P1, ~, ~] = icare(A',C1',B1*B1',D1*D1',0,eye(2),0);
% L1 = -P1*C1'*inv(D1*D1');
% second case
% C22'*D22;
% det(D22'*D22);
% rank([B2 A*B2]);
% rank([C22; C22*A]);
% B1*D1';
% det(D1*D1');
% rank([C1; C1*A]);
% rank([B1 A*B1]);
% [Q2, ~, ~] = icare(A,B2,C22'*C22,D22'*D22,0,eye(2),0);
% K2 = -inv(D22'*D22)*B2'*Q2;
% [P2, ~, ~] = icare(A',C1',B1*B1',D1*D1',0,eye(2),0);
% L2 = -P2*C1'*inv(D1*D1');
% third case
% C23'*D23;
% det(D23'*D23);
% rank([B2 A*B2]);
% rank([C23; C23*A]);
% B1*D1';
% det(D1*D1');
% rank([C1; C1*A]);
% rank([B1 A*B1]);
% [Q3, ~, ~] = icare(A,B2,C23'*C23,D23'*D23,0,eye(2),0);
% K3 = -inv(D23'*D23)*B2'*Q3;
% [P3, ~, ~] = icare(A',C1',B1*B1',D1*D1',0,eye(2),0);
% L3 = -P3*C1'*inv(D1*D1');

% transfer functions
% W1 = [tf([-20.8267 -86.957 -143.545 0.335146 10.3279],[1 8.2664 30.6664 61.348 69.1655 41.6465 10.3279]) tf([10.4134 77.3219 221.539 270.535 61.9671],[1 8.2664 30.6664 61.348 69.1655 41.6465 10.3279]) tf([20.8267 92.1637 166.586 41.3114 0 0],[1 8.2664 30.6664 61.348 69.1655 41.6465 10.3279]);
%     tf([-2.5 -9.333 18.3945 15.9157],[1 4.1332 6.79151 5.20668 1.5207]) tf([11 51.4652 83.8858 36.187],[1 4.1332 6.79151 5.20668 1.5207]) tf([-31.2401 -29.9509 6.0828],[1 4.1332 6.79151 5.20668 1.5207])];
% W2 = [tf([-14 -100.083 -400.478 -17.5459],[1 7.3631 18.4826 20.4764 9.1242]) tf([-6 -26.1786 103.546 369.183],[1 7.3631 18.4826 20.4764 9.1242]) tf([163.811 -172.723 -109.49],[1 7.3631 18.4826 20.4764 9.1242]);
%     tf([40.9528 309.55 811.33 114.458 -84.3193],[1 14.7262 91.1804 292.654 501.499 445.639 168.639]) tf([-20.4764 -221.323 -925.32 -1505.55 -505.916],[1 14.7262 91.1804 292.654 501.499 445.639 168.639]) tf([-40.9528 -319.788 -891.277 -337.277 0 0],[1 14.7262 91.1804 292.654 501.499 445.639 168.639])];
W3 = [tf([-4.5 -18.3487 -51.0652 1.18257],[1 4.2997 8.56313 8.41542 3.69028]) tf([-1 1.7003 25.6506 55.0691],[1 4.2997 8.56313 8.41542 3.69028]) tf([16.8308 -26.2811 -14.7611],[1 4.2997 8.56313 8.41542 3.69028]);
    tf([-14 -56.6958 -104.835 29.971],[1 4.2997 8.56313 8.41542 3.69028]) tf([7 51.0979 150.236 179.826],[1 4.2997 8.56313 8.41542 3.69028]) tf([-117.816 -51.664],[1 4.2997 8.56313 8.41542 3.69028]);
    tf([50.4925 226.621 467.766 57.708 -47.4006],[1 8.5994 35.6137 82.0532 113.201 87.9295 31.6004]) tf([-25.2463 -195.361 -622.655 -886.167 -284.403],[1 8.5994 35.6137 82.0532 113.201 87.9295 31.6004]) tf([-50.4925 -239.244 -527.577 -189.602 0 0],[1 8.5994 35.6137 82.0532 113.201 87.9295 31.6004])];

% plot amplitude frequency response
% first case
% ampW1 = bodeplot(W1);
% setoptions(ampW1,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off','IOGrouping','all');
% xlim([0 5]);
% second case
% ampW2 = bodeplot(W2);
% setoptions(ampW2,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off','IOGrouping','all');
% xlim([0 5]);
% third case
% ampW3 = bodeplot(W3);
% setoptions(ampW3,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off','IOGrouping','all');
% xlim([0 5]);

% plot singular values to frequency
% first case
% sinValW1 = sigmaplot(W1);
% setoptions(sinValW1,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 5]);
% second case
% sinValW2 = sigmaplot(W2);
% setoptions(sinValW2,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 5]);
% third case
% sinValW3 = sigmaplot(W3);
% setoptions(sinValW3,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 5]);

% find h_2 norm
% norm(W1)
% norm(W2)
% norm(W3)

% find h_inf norm
% getPeakGain(W1)
% getPeakGain(W2)
% getPeakGain(W3)