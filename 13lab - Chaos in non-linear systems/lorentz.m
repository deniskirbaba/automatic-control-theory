clear  % clear all variables
close all  % close all graphs
clc  % clear all text in command window
%% Parameter Init

% Number of trajectories
n_tr = 1;

% Starting Points
% Enter as many starting points in the array as corresponds to the value of
% 'n_tr'
X = 1; Y = 1; Z = 1;

% Model Parameters
Sigma = 10;
Rho = 28;
Beta = 8/3;

% Curve Animator Obj
Curve = animatedline('Color', [0, 1, 1], 'LineStyle', '-', 'Marker'...
    , 'none', 'MarkerSize', 2);

% Plot Properties
% Set the background color and remove the toolbar for the current figure.
set(gcf, 'Color', 'k'); axis equal; axis off

% Time Frame
dt = 0.001;

while 1  % Infinite loop entering

    dx = (Sigma * (Y-X)) * dt;
    dy = (X * (Rho-Z) - Y) * dt;
    dz = (X*Y - Beta*Z) * dt;
    X = X + dx;
    Y = Y + dy;
    Z = Z + dz;

    Curve.addpoints(X, Y, Z);
    % drawnow limitrate
    drawnow
end