% 1 task

% plant parameters
A1 = [-2 0 0; 0 4 2; 0 -2 4];
B1 = [1; 1; 1];
B2 = [1 0 0 0; 0 0 1 0; 0 0 1 1];
A2 = [0 3 0 0; -3 0 0 0; 0 0 0 1; 0 0 -1 0];
C2 = [1 1 1];
D2 = [0 0 0 0];

% eigenvalues
eig(A1);
eig(A2);

% controllability (A1,B1)
rank([B1 A1*B1 A1*A1*B1]);

% K1 calculation
G = [-1 0 0; 0 -2 1; 0 -1 -2];
Y1 = [1 1 1];
V = [Y1; Y1*G; Y1*G*G];
if rank(V) == 3
    cvx_begin sdp
        variable P1(3,3)
        A1*P1 - P1*G == B1*Y1;                  %#ok<*VUNUS> 
    cvx_end
    K1 = -Y1*inv(P1);                         %#ok<*MINV> 
end

% K2 calculation
cvx_begin sdp
    variable P2(3,4)
    variable Y2(1,4)
    P2*A2 - A1*P2 == B1*Y2 + B2;
    C2*P2 + D2 == 0;
cvx_end
K2 = Y2 - K1*P2;