% 3 task

% plant parameters
A = [0 1; 0 0];
B1 = [-2 1; 1/2 3];
B2 = [0; 1];
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
% [Q1, ~, ~] = icare(A,B2,C21'*C21,D21'*D21,0,eye(2),0);
% K1 = -inv(D21'*D21)*B2'*Q1;
% second case
% C22'*D22;
% det(D22'*D22);
% rank([B2 A*B2]);
% rank([C22; C22*A]);
% [Q2, ~, ~] = icare(A,B2,C22'*C22,D22'*D22,0,eye(2),0);
% K2 = -inv(D22'*D22)*B2'*Q2;
% third case
% C23'*D23;
% det(D23'*D23);
% rank([B2 A*B2]);
% rank([C23; C23*A]);
% [Q3, ~, ~] = icare(A,B2,C23'*C23,D23'*D23,0,eye(2),0);
% K3 = -inv(D23'*D23)*B2'*Q3;

% transfer functions
% first case
% W1 = [tf([-1.9384 1],[1 2.0616 1]) tf([14.3696 6],[1 2.0616 1]);
%     tf([-2.5 -1.2464],[1 2.0616 1]) tf([11 7.1232],[1 2.0616 1])];
% second case
% W2 = [tf([-14 -108.498],[1 5.2915 6]) tf([-6 73.749],[1 5.2915 6]);
%     tf([9.35425 -3],[1 5.2915 6]) tf([-21.8745 -18],[1 5.2915 6])];
% third case
% W3 = [tf([-4.5 -12.7658],[1 2.2281 2.4267]) tf([-1 12.8829],[1 2.2281 2.4267]);
%     tf([-14 -27.6934],[1 2.2281 2.4267]) tf([7 36.5967],[1 2.2281 2.4267]);
%     tf([11.218 -3.64005],[1 2.2281 2.4267]) tf([-27.333 -21.8503],[1 2.2281 2.4267])];

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
