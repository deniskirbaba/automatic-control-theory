% 2 task

% transfer functions
% W1 = [tf([20],[1 4]) tf([1], [1 3 1]) tf([9 -10 -8], [1 2 1 1]);
%     0 tf([1],[1 1]) tf([3], [1 2 8 1/2]);
%     tf([10], [1 4 7 24]) tf([-5 -7 4], [1 5 8 1]) tf([10 -7 -3 0], [1 4 7 10 5]);
%     tf([1 0], [1 1 24]), tf([9], [1 1]) tf([1 3], [6 10 1]);
%     tf([1], [1 3]) tf([1 3 0], [3 6 10 1]) tf([5], [1 5])];
% W2 = [tf([4],[2 6 1/2]) tf([1],[5 3]) tf([-3 0 5],[1 7 9 10]) tf([10 0],[3 1 24]) tf([1 0],[4 3 1]) tf([5],[1 5]);
%     tf([4],[4 1]) tf([8 7 0],[1 6 10 1]) tf([4 3],[3 10 1]) 0 tf([4 3],[5 5 2]) tf([3/2],[7 2 8 1/2]);
%     tf([5 3],[9 1 24]) tf([1],[1 10]) 0 tf([1],[1 3 1]) tf([-1 0 0 3],[1 4 10 5 1]) tf([1],[1 11])];

% plot amplitude frequency response
% ampW1 = bodeplot(W1);
% setoptions(ampW1,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off','IOGrouping','all');
% xlim([0 6]);
% ampW2 = bodeplot(W2);
% setoptions(ampW2,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off','IOGrouping','all');
% xlim([0 6]);

% plot singular values to frequency
% sinValW1 = sigmaplot(W1);
% setoptions(sinValW1,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 6]);
% sinValW2 = sigmaplot(W2);
% setoptions(sinValW2,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 6]);

% find h_inf norm
% getPeakGain(W1)
% getPeakGain(W2)

% find h_2 norm
% norm(W1)
% norm(W2)