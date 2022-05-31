%#ok<*MINV> 
%#ok<*VUNUS> 
%#ok<*NOPTS> 

% 1 task

% plant parameters
A = [-3 0 0 0; 0 3 0 0; 0 0 3 3; 0 0 -3 3];
B = [0; 7; 0; 1];

% desired decay rate
alpha = 0.1;

% solving LMI
cvx_begin sdp
variable P(4,4)
variable Y(1,4)
P > 0.00001*eye(4);
P*A' + A*P + 2*alpha*P + Y'*B' + B*Y <= 0;
cvx_end

% finding controller matrix
K = Y*inv(P)

% finding eigenvalues
eig(A + B*K)