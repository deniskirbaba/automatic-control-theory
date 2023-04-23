sizes = size(e.data);
n = sizes(3);

fs=18;
set(0, 'DefaultAxesFontSize', fs);

hold on;
axis([0 50 -200 350])

plot(e.time, reshape(e.data(1,:,:), n, []),'LineWidth', 3, 'Color', 'yellow');
plot(e.time, reshape(e.data(2,:,:), n, []),'LineWidth', 3, 'Color', 'blue');
plot(e.time, reshape(e.data(3,:,:), n, []),'LineWidth', 3, 'Color', 'red');

xlabel('$t$', 'FontSize', fs, 'Interpreter', 'latex');
ylabel('$errors$', 'FontSize', fs, 'Interpreter', 'latex');
legend_output=legend('$e_x$', '$e_y$', '$e_{\Phi}$', 'Location', 'NorthEast');
set(legend_output,'Interpreter', 'latex', 'FontSize', fs)
grid on;
hold off;