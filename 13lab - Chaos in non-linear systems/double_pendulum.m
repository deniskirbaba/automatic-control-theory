clear
close all
clc
%% Parameter Declaration and Pendulum Properties

Length1 = 300;              % Pendulum1 Length
Length2 = 300;              % Pendulum2 Length
Mass1 = 40;                 % Pendulum1 Mass
Mass2 = 40;                 % Pendulum2 Mass
Theta1 = pi/2;              % Pendulum1 Release Angle
Theta2 = pi/2;              % Pendulum2 Release Angle
Velocity1 = 0;              % Pendulum1 Velocity
Velocity2 = 0;              % Pendulum2 Velocity
Acc1 = 0;                   % Pendulum1 Acceleration
Acc2 = 0;                   % Pendulum2 Acceleration
g = 1;                      % G

X0 = 0;                     % Origin X Coordinate
Y0 = 0;                     % Origin Y Coordinate

%% Numeric Solving + Plotting

f = figure;
f.GraphicsSmoothing = 'on';

% Animator Obj
Pendulum = animatedline('Color', 'b', 'Marker', 'o', 'MarkerSize' ...
    , 10, 'MarkerFaceColor', 'b', 'LineWidth', 3);
Curve = animatedline('Color', 'w', 'LineStyle', '-', 'Marker',  ...
    'none', 'LineWidth', 2);

% Plot Properties
Range = [(Length1+Length2)*(-1.5), (Length1+Length2)*1.5];
axis equal; axis off;
set(gca, 'Xlim', Range, 'Ylim', Range);
set(gcf, 'Color', 'k')

while 1

    x1 = X0+Length1*sin(Theta1);
    y1 = Y0-Length1*cos(Theta1);
    x2 = x1+Length2*sin(Theta2);
    y2 = y1-Length2*cos(Theta2);
    
    % Pendular 1 solvage
    num1 = -g * (2*Mass1 + Mass2) * sin(Theta1);
    num2 = -Mass2 * g * sin(Theta1 - 2*Theta2);
    num3 = -2 * sin(Theta1 - Theta2) * Mass2;
    num4 = Velocity2^2 * Length2 + Velocity1^2 * Length1 * cos(Theta1 - Theta2);
    den = Length1 * (2*Mass1 + Mass2 - Mass2 * cos(2*Theta1 - 2*Theta2));
    Acc1 = (num1+num2+num3*num4)/den;

    % Pendular 2 Solvage
    num1 = 2 * sin(Theta1 - Theta2);
    num2 = Velocity1^2 * Length1 * (Mass1 + Mass2);
    num3 = g * (Mass1 + Mass2) * cos(Theta1);
    num4 = Velocity2^2 * Length2 * Mass2 * cos(Theta1 - Theta2);
    den = Length2* (2*Mass1 + Mass2 - Mass2 * cos(2*Theta1 - 2*Theta2));
    Acc2 = (num1*(num2+num3+num4))/den;

    if isnan(Acc1) || isinf(Acc1)
        Acc1 = 0;
    end
    if isnan(Acc2) || isinf(Acc2)
        Acc2 = 0;
    end

    Velocity1 = Velocity1+Acc1;
    Velocity2 = Velocity2+Acc2;
    Theta1 = (Theta1+Velocity1);
    Theta2 = (Theta2+Velocity2);

    Curve.addpoints(x2, y2);
    Pendulum.addpoints([X0 x1 x2], [X0 y1 y2]);
    %drawnow
    drawnow limitrate

    clearpoints(Pendulum);
end