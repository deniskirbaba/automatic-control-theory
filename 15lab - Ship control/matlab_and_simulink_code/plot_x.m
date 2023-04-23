sizes = size(x.data);

n = sizes(3);

% n = sizes(1);

fs=18;
set(0, 'DefaultAxesFontSize', fs);

hold on;
axis([0 50 -50 1150])

plot(x.time, reshape(x.data(1,:,:), n, []),'LineWidth', 3, 'Color', 'yellow');
plot(x.time, reshape(x.data(2,:,:), n, []),'LineWidth', 3, 'Color', 'blue');
plot(x.time, reshape(x.data(3,:,:), n, []),'LineWidth', 3, 'Color', 'red');

% plot(x.time, x.data(:, 1),'LineWidth', 3, 'Color', 'yellow');
% plot(x.time, x.data(:, 2),'LineWidth', 3, 'Color', 'blue');
% plot(x.time, x.data(:, 3),'LineWidth', 3, 'Color', 'red');

xlabel('$t$', 'FontSize', fs, 'Interpreter', 'latex');
ylabel('$states$', 'FontSize', fs, 'Interpreter', 'latex');
legend_output=legend('$x$', '$y$', '$\Phi$', 'Location', 'NorthEast');
set(legend_output,'Interpreter', 'latex', 'FontSize', fs)
grid on;
hold off;