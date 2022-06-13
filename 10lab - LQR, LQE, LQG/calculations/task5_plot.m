% J plot

hold on;
grid on;

plot(out.j1.time, j1,'DisplayName','J1')
plot(out.j1.time, j2,'DisplayName','J2')
plot(out.j1.time, j3,'DisplayName','J3')
plot(out.j1.time, j5,'DisplayName','J4')
plot(out.j1.time, j4,'DisplayName','J5',LineStyle='--')
plot(out.j1.time, j6,'DisplayName','J6',LineStyle='--')
plot(out.j1.time, j7,'DisplayName','J7',LineStyle='--')
xlabel("time, sec")
ylabel("J")
legend