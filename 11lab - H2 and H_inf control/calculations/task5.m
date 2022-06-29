% 5 task

% plant parameters
A = [0 1; 0 0];
B1 = [-2 1; 1/2 3];
B2 = [0; 1];
C2 = [2 -1; 7 0; 0 0];
D2 = [0; 0; 3];
g = 14.49;

% find regulator matrix
[Q, ~, ~] = icare(A,B2,C2'*C2,D2'*D2,0,eye(2),(g.^-2).*B1*B1');
K = -inv(D2'*D2)*B2'*Q;

% transfer functions
% W1 = [tf([-4.5 -13.0378],[1 2.2708 2.4773]) tf([-1 13.0189],[1 2.2708 2.4773]);
%     tf([-14 -28.2912],[1 2.2708 2.4773]) tf([7 36.8956],[1 2.2708 2.4773]);
%     tf([11.4576 -3.71595],[1 2.2708 2.4773]) tf([-27.8691 -22.2957],[1 2.2708 2.4773])];
% W2 = [tf([-4.5 -25.9992],[1 4.2899 4.9198]) tf([-1 19.4996],[1 4.2899 4.9198]);
%     tf([-14 -56.5586],[1 4.2899 4.9198]) tf([7 51.0293],[1 4.2899 4.9198]);
%     tf([23.084 -7.3797],[1 4.2899 4.9198]) tf([-53.3685 -44.2782],[1 4.2899 4.9198])];
% W3 = [tf([-4.5 -117.087],[1 18.31 22.4234]) tf([-1 65.0434],[1 18.31 22.4234]);
%     tf([-14 -252.84],[1 18.31 22.4234]) tf([7 149.17],[1 18.31 22.4234]);
%     tf([107.075 -33.6351],[1 18.31 22.4234]) tf([-232.06 -201.811],[1 18.31 22.4234])];
W4 = [tf([-4.5 -271.447],[1 42.0057 52.212]) tf([-1 142.223],[1 42.0057 52.212]);
    tf([-14 -584.58],[1 42.0057 52.212]) tf([7 315.04],[1 42.0057 52.212]);
    tf([250.263 -78.318],[1 42.0057 52.212]) tf([-534.687 -469.908],[1 42.0057 52.212])];

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
% xlim([0 20]);
% fourth case
% ampW4 = bodeplot(W4);
% setoptions(ampW4,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off','IOGrouping','all');
% xlim([0 20]);

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
% xlim([0 20]);
% fourth case
% sinValW4 = sigmaplot(W4);
% setoptions(sinValW4,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 20]);

% find h_2 norm
% norm(W4)

% find h_inf norm
% getPeakGain(W4)