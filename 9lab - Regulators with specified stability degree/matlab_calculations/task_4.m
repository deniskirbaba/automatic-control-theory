% 4 task

% plant parameters
A = [5 -7 -5 1; -7 5 -1 5; -5 -1 5 7; 1 5 7 5];
B = [5; 7; 1; 9];
C = [0 0 2 2; 1 1 -1 1];

% initial conditions
x0 = [2; 1; 0; -1];
x0_obs = [5; -1; -8; 12];

% desired decay rates
alpha_reg = 3;
alpha_obs = 1.5;

% solving LMI
cvx_begin sdp
variable P(4,4)
variable Y_reg(1,4)
variable mumu
minimize mumu
P > 0.00001*eye(4);
P*A' + A*P + 2*alpha_reg*P + Y_reg'*B' + B*Y_reg <= 0;
[P x0; x0' 1] > 0;
[P Y_reg'; Y_reg mumu] > 0;
cvx_end

% solving LMI
cvx_begin sdp
variable Q(4,4)
variable Y_obs(4,2)
Q > 0.00001*eye(4);
A'*Q + Q*A + 2*alpha_obs*Q + C'*Y_obs' + Y_obs*C <= 0;
cvx_end

% finding controller matrix and control constraint
K = Y_reg*inv(P);
mu=sqrt(mumu);

% finding observer matrix
L = inv(Q)*Y_obs;

eig(A + B*K)
A + L*C + B*K
K