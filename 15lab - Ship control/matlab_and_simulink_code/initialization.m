% initial = [789.5551 536.7011 313.3634];
initial = x.data(:, 1, 1); % for PID
K = [25 0 0 100 0 0; 0 75 0 0 100 0; 0 0 1000 0 0 100];
lambda = 10;
kappa = 7;
C_1 = [1 0 0; 0 2 0; 0 0 3];
C_2 = [4 0 0; 0 5 0; 0 0 6];
B_0 = kappa.*[C_2; kappa.*C_1];
A_0 = [-kappa.*C_2 eye(3); -kappa.*kappa.*C_1 zeros(3,3)];

size(A_0)
size(B_0)