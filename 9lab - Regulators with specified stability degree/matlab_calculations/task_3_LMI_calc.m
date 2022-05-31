%#ok<*MINV> 
%#ok<*VUNUS> 
%#ok<*NOPTS>

% 3 task

% plant parameters
A = [0 5 0 0; -5 0 0 0; 0 0 0 1; 0 0 -1 0];
C = [0 9 1 0];

% desired decay rate
alpha = 0.5;

% solving LMI
cvx_begin sdp
variable Q(4,4)
variable Y(4,1)
Q > 0.00001*eye(4);
A'*Q + Q*A + 2*alpha*Q + C'*Y' + Y*C <= 0;
cvx_end

% finding controller matrix
L = inv(Q)*Y;
-L
A+L*C

% finding eigenvalues
eig(A + L*C);