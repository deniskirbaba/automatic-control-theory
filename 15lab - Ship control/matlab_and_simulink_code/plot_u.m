sizes = size(u.data);

hold on;
plot(u.time, u.data(:, 1),'LineWidth', 1, 'Color', 'blue', 'LineStyle','-');
plot(u.time, u.data(:, 2),'LineWidth', 1, 'Color', 'red', 'LineStyle','-');
plot(u.time, u.data(:, 3),'LineWidth', 1, 'Color', 'yellow', 'LineStyle','-');
plot(u.time, u.data(:, 4),'LineWidth', 1, 'Color', 'green', 'LineStyle','-');
xlabel('$t$', 'FontSize', fs, 'Interpreter', 'latex');
ylabel('$u$', 'FontSize', fs, 'Interpreter', 'latex');
legend_control = legend('$u_1$', '$u_2$', '$u_3$', '$u_4$', 'NorthEast');
set(legend_control,'Interpreter', 'latex', 'FontSize', fs)
grid on;
hold off;