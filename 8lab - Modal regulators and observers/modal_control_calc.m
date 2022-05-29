A = [-3 0 0 0; 0 3 0 0; 0 0 3 3; 0 0 -3 3];
B = [0; 7; 0; 1];
G = [-3 1 0 0; 0 -3 1 0; 0 0 -3 1; 0 0 0 -3];
Y = [1 1 1 1];

cvx_begin sdp
variable P(4,4)
A*P-P*G == B*Y;
cvx_end

K = -Y*inv(P);
K1 = -Y1*inv(P1);