clear  % clear all variables
close all  % close all graphs
clc  % clear all text in command window
%% Parameter Init

% Number of trajectories
n_tr = 10;

% Starting Points
% Enter as many starting points in the array as corresponds to the value of
% 'n_tr'
a = [1 1 1; 1 1 2; 2 1 1; 2 2 2; 0 1 1; 0 1 0; 0 0 1; 1 2 2; 2 2 0; 0 2 0];

% Model Parameters
Sigma = 10;
Rho = 28;
Beta = 8/3;

% Curve Animator Obj
curves = arrayfun(@(x) animatedline(), 1:n_tr);
for i = 1:n_tr
    curves(i) = animatedline('Color', [0, 1, 1], 'LineStyle', '-', 'Marker'...
    , 'none', 'MarkerSize', 2);
end

% Plot Properties
% Set the background color and remove the toolbar for the current figure.
set(gcf, 'Color', 'k'); axis equal; axis off

% Time Frame
dt = 0.001;

while 1  % Infinite loop entering

    for i = 1:n_tr
        dx = (Sigma * (a(i, 2)-a(i, 1))) * dt;
        dy = (a(i, 1) * (Rho-a(i, 3)) - a(i, 2)) * dt;
        dz = (a(i, 1)*a(i, 2) - Beta*a(i, 3)) * dt;
        a(i, 1) = a(i, 1) + dx;
        a(i, 2) = a(i, 2) + dy;
        a(i, 3) = a(i, 3) + dz;
        addpoints(curves(i), a(i,1), a(i,2), a(i,3));
    end
    drawnow limitrate
    % drawnow
end