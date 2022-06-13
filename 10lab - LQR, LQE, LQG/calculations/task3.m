%#ok<*MINV> 
% 3 task

% plant parameters
A = [-6 19 10 -13; 0 -9 0 6; -4 8 6 -7; 0 -15 0 9];
C = [3 -9 -3 6; 0 2 0 -1];

% initial conditions
x0 = [1; -2; -1; 2];
x0obs = [-2; 0; 3; 1];

% observeability
eig(A);
OM = [A; C*A; C*A*A; C*A*A*A];
rank(OM);

%--------------------------------------------------

% LQE 1
Q1_inv = [100 0 0 0; 0 100 0 0; 0 0 100 0; 0 0 0 100];
R1_inv = [1 0; 0 1];
Q1 = inv(Q1_inv);
R1 = inv(R1_inv);

% (A, Q) - stabilisable check
AQ1 = [Q1 A*Q1 A*A*Q1 A*A*A*Q1];
rank(AQ1);

% finding P, L
[P1, ~, ~] = icare(A', C', Q1, R1, 0, eye(4), 0);
L1 = -P1*C'*R1_inv;

%--------------------------------------------------

% LQE 2
Q2_inv = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
R2_inv = [150 0; 0 150];
Q2 = inv(Q2_inv);
R2 = inv(R2_inv);

% (A, Q) - stabilisable check
AQ2 = [Q2 A*Q2 A*A*Q2 A*A*A*Q2];
rank(AQ2);

% finding P, L
[P2, ~, ~] = icare(A', C', Q2, R2, 0, eye(4), 0);
L2 = -P2*C'*R2_inv;

%--------------------------------------------------

% LQE 3
Q3_inv = [5 0 0 0; 0 5 0 0; 0 0 5 0; 0 0 0 5];
R3_inv = [5 0; 0 5];
Q3 = inv(Q3_inv);
R3 = inv(R3_inv);

% (A, Q) - stabilisable check
AQ3 = [Q3 A*Q3 A*A*Q3 A*A*A*Q3];
rank(AQ3);

% finding P, L
[P3, ~, ~] = icare(A', C', Q3, R3, 0, eye(4), 0);
L3 = -P3*C'*R3_inv;