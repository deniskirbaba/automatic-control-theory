% plant parameters
A1 = [-3 0 0; 0 4 2; 0 -2 4];
B1 = [1; 1; 1];
B2 = [1 0 0 0; 0 1 0 0; 0 0 1 1];
A2 = [0 5 0 0; -5 0 0 0; 0 0 0 2; 0 0 -2 0];
C1 = [1 0 1];
D1 = [1 1 0 0];
C2 = [1 1 1];
D2 = [-1 -1 -1 -1];

% detectability check

% observability of ([C1 D1], [A1 B2; 0 A2])
c = [C1 D1];
a = [A1 B2; zeros(4,3) A2];
v = [c; c*a; c*(a^2); c*(a^3); c*(a^4); c*(a^5); c*(a^6)];
rank(v)

% check observability of each eigenvalue
obs = [eig(a) zeros(7,1)];
for i=1:7
    hautus = [a-obs(i,1)*eye(7);c];
    obs(i,2) = rank(hautus);
end
disp(obs)