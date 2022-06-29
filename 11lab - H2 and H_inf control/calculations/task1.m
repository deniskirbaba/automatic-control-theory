% 1 task

% plant parameters
% A = [-6 2; 3 -5];
% B = [7; 3];
% C = [5 -2; 1 8];  
% modelingTime = 5;
% timeStep = 0.0005;
% timeMoments = modelingTime/timeStep + 1;

% finding Gramians
% cvx_begin sdp
% variable P(2,2)
% variable Q(2,2)
% P > 0.0001*eye(2);
% Q > 0.0001*eye(2);
% A*P + P*A' + B*B' == 0;
% Q*A + A'*Q + C'*C == 0;
% cvx_end

% eigenvalues and eigenvectors
% [VP,DP] = eig(P);
% [VCPC,DCPC] = eig(C*P*C');
% [VQ,DQ] = eig(Q);
% sqrt(eig(C*P*C'))

% plot the control ellipsoid
% fimplicit(@(x1,x2) [x1; x2]'*inv(P)*[x1; x2] - 1,'DisplayName','control ellipsoid', Color='Blue')
% xlabel("x1")
% ylabel("x2")
% grid on;
% hold on;
% xlim([-2.5 2.5])
% ylim([-2 2])
% legend

% plot the eigenvalues and eigenvectors in control ellipsoid
% plot([0,VP(1,1)*sqrt(DP(1,1))], [0,VP(2,1)*sqrt(DP(1,1))],'DisplayName','1-st half axle', LineStyle='--', Color='Red')
% plot([0,VP(1,2)*sqrt(DP(2,2))], [0,VP(2,2)*sqrt(DP(2,2))],'DisplayName','2-nd half axle',LineStyle='--', Color='Green')

% plot path in control ellipsoid
% u1Data = out.udata.signals.values;
% u2Data = out.udata.signals.values;
% u3Data = out.udata.signals.values;
% u4Data = out.udata.signals.values;
% plot(u1Data(:,1), u1Data(:,2),'DisplayName','u_1 path',LineStyle='--', Color='blue')
% plot(u2Data(:,1),u2Data(:,2),'DisplayName','u_2 path',LineStyle='--', Color='red')
% plot(u3Data(:,1),u3Data(:,2),'DisplayName','u_3 path',LineStyle='--', Color='green')
% plot(u4Data(:,1),u4Data(:,2),'DisplayName','u_4 path',LineStyle='--', Color='cyan')

% plot the limiting output ellipsoid
% fimplicit(@(y1,y2) [y1; y2]'*inv(C*P*C')*[y1; y2] - 1,'DisplayName','limiting output ellipsoid', Color='Blue')
% xlabel("y1")
% ylabel("y2")
% grid on;
% hold on;
% xlim([-9 9])
% ylim([-18 18])
% legend

% plot the eigenvalues and eigenvectors in the limiting output ellipsoid
% plot([0,VCPC(1,1)*sqrt(DCPC(1,1))], [0,VCPC(2,1)*sqrt(DCPC(1,1))],'DisplayName','1-st half axle', LineStyle='--', Color='Red')
% plot([0,VCPC(1,2)*sqrt(DCPC(2,2))], [0,VCPC(2,2)*sqrt(DCPC(2,2))],'DisplayName','2-nd half axle',LineStyle='--', Color='Green')

% plot path in control ellipsoid
% u1Data = out.udata.signals.values;
% u2Data = out.udata.signals.values;
% u3Data = out.udata.signals.values;
% u4Data = out.udata.signals.values;
% plot(u1Data(:,1), u1Data(:,2),'DisplayName','u_1 path',LineStyle='--', Color='blue')
% plot(u2Data(:,1),u2Data(:,2),'DisplayName','u_2 path',LineStyle='--', Color='red')
% plot(u3Data(:,1),u3Data(:,2),'DisplayName','u_3 path',LineStyle='--', Color='green')
% plot(u4Data(:,1),u4Data(:,2),'DisplayName','u_4 path',LineStyle='--', Color='cyan')

% plot the observability ellipsoid
% fimplicit(@(x1,x2) [x1; x2]'*Q*[x1; x2] - 1,'DisplayName','observe ellipsoid', Color='blue')
% xlabel("x1")
% ylabel("x2")
% grid on;
% hold on;
% xlim([-0.75 0.75])
% ylim([-0.5 0.5])
% legend

% plot the eigenvalues and eigenvectors in control ellipsoid
% plot([0,VQ(1,1)*(1/sqrt(DQ(1,1)))], [0,VQ(2,1)*(1/sqrt(DQ(1,1)))],'DisplayName','1-st half axle', LineStyle='--', Color='Red')
% plot([0,VQ(1,2)*(1/sqrt(DQ(2,2)))], [0,VQ(2,2)*(1/sqrt(DQ(2,2)))],'DisplayName','2-nd half axle',LineStyle='--', Color='Green')


% initial conditions on observe ellipsoid
% x1 = [0; 0.35728];
% x2 = [-0.537716; 0];
% x3 = [0.28; -0.411031];
% x4 = [-0.5711; 0.326667];

% find the energy of the output
% y_energy = 0;
% for i = 1:timeMoments
%     y_energy = y_energy + (out.ydata.signals.values(i,1)^2 + out.ydata.signals.values(i,2)^2)*timeStep;
% end

% find energy-to-energy gain
% gamma = 15.64;
% D = [0; 0];
% cvx_begin sdp
% variable P_ee(2,2)
% P_ee > 0.0001*eye(2);
% [A*P_ee+P_ee*A' B P_ee*C'; 
%     B' -gamma D'; 
%     C*P_ee D -gamma*eye(2)] < 0; %#ok<*VUNUS> 
% cvx_end

% find h_inf norm
% G = [tf([29 127],[1 11 24]); tf([31 353],[1 11 24])];
% getPeakGain(G);
% h=sigmaplot(G);
% getoptions(h);
% setoptions(h,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 100]);

% find h2 norm matrix way
% h2_q = sqrt(trace(B'*Q*B))
% h2_p = sqrt(trace(C*P*C'))

% find h2 norm matlab func
% norm(G)