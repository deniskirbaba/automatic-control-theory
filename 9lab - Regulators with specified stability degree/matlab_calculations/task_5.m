%#ok<*MINV> 
%#ok<*VUNUS> 
%#ok<*NOPTS>

% 5 task

% plant parameters
A = [0 1; 0 0];
C = [1 0];

% initial conditions
x0 = [1; 0];
x0_obs = [0; -1];
e0 = x0-x0_obs;

% desired decay rate
alpha = 5;

% solving LMI
cvx_begin sdp
variable Q(2,2)
variable Y(2,1)
variable mumu
minimize mumu
Q > 0.00001*eye(2);
A'*Q + Q*A + 2*alpha*Q + C'*Y' + Y*C <= 0;
[Q e0; e0' 1] > 0;
[Q Y; Y' mumu] > 0;
cvx_end

% finding observer matrix
L = inv(Q)*Y;
mu = sqrt(mumu);

-L
A + L*C
eig(A+L*C)

