% task 6

% plant parameters
A1 = [-3 0 0; 0 4 2; 0 -2 4];
B1 = [1; 1; 1];
B2 = [1 0 0 0; 0 1 0 0; 0 0 1 1];
A2 = [0 5 0 0; -5 0 0 0; 0 0 0 2; 0 0 -2 0];
C1 = [1 1 1];
C2 = C1;
D1 = [-1 -1 -1 -1];
D2 = D1;

% step 1.1: serching K1
G = [-2 0 0; 0 -2 2; 0 -2 -2];
y = [1 1 1];
V = [y; y*G; y*G*G];
if rank(V) == 3
    cvx_begin sdp
        variable p(3,3)
        A1*p - p*G == B1*y;                                      %#ok<*VUNUS> 
    cvx_end
    K1 = -y*inv(p)                                                  %#ok<*MINV,NOPTS> 
end

% step 1.2: searching L1 & L2
g = [-1.5 0 0 0 0 0 0;
    0 -0.5 0 0 0 0 0;
    0 0 -1 1 0 0 0;
    0 0 -1 -1 0 0 0;
    0 0 0 0 -2 0 0;
    0 0 0 0 0 -3 5;
    0 0 0 0 0 -5 -3];
c = [C1 D1];
a = [A1 B2; zeros(4,3) A2];
y = [-1; -1; -1; -1; -1; -1; -1];

% check if pair (g, y) is controllable to count l
u = rank([y g*y (g^2)*y (g^3)*y (g^4)*y (g^5)*y (g^6)*y]);

cvx_begin sdp
    variable p(7,7)
    g*p - p*a == y*c;
cvx_end
l = inv(p)*y;
L1 = l(1:3); L2 = l(4:7);

% step 2.3: solve
cvx_begin sdp
    variable P(3,4)
    variable Y(1,4)
    P*A2 - A1*P == B1*Y + B2;
    C2*P + D2 == 0;
cvx_end

K2 = Y - K1*P                                                       %#ok<*NOPTS> 

% eigenvalues of regulator
eig([A1+B1*K1+L1*C1 B2+B1*K2+L1*D1; L2*C1 A2+L2*D1])