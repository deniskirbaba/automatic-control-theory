% 1 task

% plant parameters
A = [-6 19 10 -13; 0 -9 0 6; -4 8 6 -7; 0 -15 0 9];
B = [2 0; 1 0; 3 0; 2 0];

% initial conditions
x0 = [1; -2; -1; 2];

% controllability
eig(A);
CM = [B A*B A*A*B A*A*A*B];
rank(CM);

%--------------------------------------------------

% LQR 1
Q1 = [10 0 0 0; 0 5 0 0; 0 0 20 0; 0 0 0 1];
R1 = [0.1 0; 0 0.1];

% (Q, A) - detectable check
OM1 = [Q1; Q1*A; Q1*A*A; Q1*A*A*A];
rank(OM1);

% finding P, K
[P1, ~, L1] = icare(A, B, Q1, R1, 0, eye(4), 0);
K1 = -inv(R1)*B'*P1;

% min J
minJ1 = x0'*P1*x0;

% experimental J
exp_J1 = sum(out.stiff_j);

%--------------------------------------------------

% LQR 2
Q2 = [0.5 0 0 0; 0 0.5 0 0; 0 0 0.5 0; 0 0 0 0.5];
R2 = [100 0; 0 50];

% (Q, A) - detectable check
OM2 = [Q2; Q2*A; Q2*A*A; Q2*A*A*A];
rank(OM2);

% finding P, K
[P2, ~, L2] = icare(A, B, Q2, R2, 0, eye(4), 0);
K2 = -inv(R2)*B'*P2;

% min J
minJ2 = x0'*P2*x0;

% experimental J
exp_J2 = sum(out.soft_j);

%--------------------------------------------------

% LQR 3
Q3 = [5 0 0 0; 0 5 0 0; 0 0 5 0; 0 0 0 5];
R3 = [5 0; 0 5];

% (Q, A) - detectable check
OM3 = [Q3; Q3*A; Q3*A*A; Q3*A*A*A];
rank(OM3);

% finding P, K
[P3, ~, L3] = icare(A, B, Q3, R3, 0, eye(4), 0);
K3 = -inv(R3)*B'*P3;

% min J
minJ3 = x0'*P3*x0

% experimental J
exp_J3 = sum(out.mid_j)

%--------------------------------------------------