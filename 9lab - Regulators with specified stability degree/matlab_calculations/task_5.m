%#ok<*MINV> 
%#ok<*VUNUS> 
%#ok<*NOPTS>

% 5 task

% plant parameters
A = [0 1; 0 0];
B = [0; 1];
x0 = [1; 0];
x0_der = [0; 0];

% control constraint
mu = 15;

% stiffness constraint
% mu_s = 30;

% desired decay rate
alpha = 2;

% solving LMI
cvx_begin sdp
variable P(2,2)
variable Y(1,2)
variable mumu
minimize mumu
P >= 0.0001*eye(2);
P*A' + A*P + 2*alpha*P + Y'*B' + B*Y <= 0;
[P x0; x0' 1] >= 0;
[P Y'; Y mu^2] >= 0;
[P x0_der; x0_der' 1] >= 0;
[P Y'; Y mumu] >= 0;
cvx_end

% finding controller matrix
K = Y*inv(P)
mu_s = sqrt(mumu)