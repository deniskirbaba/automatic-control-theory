% 4 task

% plant parameters
A = [-6 19 10 -13; 0 -9 0 6; -4 8 6 -7; 0 -15 0 9];
B = [2 0; 1 0; 3 0; 2 0];
C = [3 -9 -3 6; 0 2 0 -1];
D = [0 0; 0 4];

% initial conditions
x0 = [1; -2; -1; 2];
x0obs = [-2; 0; 3; 1];

%--------------------------------------------------

% LQR
Q1 = [100 0 0 0; 0 100 0 0; 0 0 100 0; 0 0 0 100];
R1 = [100 0; 0 100];

% (Q1, A) - detectable check
rank([Q1; Q1*A; Q1*A*A; Q1*A*A*A]);

% finding P1, K
[P1, ~, ~] = icare(A, B, Q1, R1, 0, eye(4), 0);
K = -inv(R1)*B'*P1;

% min J
minJ = x0'*P1*x0;

%--------------------------------------------------

% LQE
Q2 = [15 0 0 0; 0 9 0 0; 0 0 29 0; 0 0 0 33];
R2 = [19 0; 0 5];

% (A, Q2) - stabilisable check
rank([Q2 A*Q2 A*A*Q2 A*A*A*Q2]);

% finding P2, L
[P2, ~, ~] = icare(A', C', Q2, R2, 0, eye(4), 0);
L = -P2*C'*inv(R2);
