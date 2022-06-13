% 5 task

dt = 0.005;

j7 = zeros(200001, 1);
j7(1) = out.j1.signals.values(1)*dt;

for i = 2:200001
    j7(i) = j7(i-1) + out.j1.signals.values(i)*dt;
end