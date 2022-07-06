% observability martices

% u=0
c = [C2 D2];
a = [A1 B2; zeros(4,3) A2];
v = [c; c*a; c*(a^2); c*(a^3); c*(a^4); c*(a^5); c*(a^6)];
rank(v)

% u=K1x+K2w
c = [C2 D2];
a = [A1+B1*K1 B2+B1*K2; zeros(4,3) A2];
v = [c; c*a; c*(a^2); c*(a^3); c*(a^4); c*(a^5); c*(a^6)];
rank(v)