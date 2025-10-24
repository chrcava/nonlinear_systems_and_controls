% Parameters
m     = 69.4;
g     = 9.81;
Cr    = 0.003;
r   = 1.2;

% Frontal areas [m^2]
A     = [0.363, 0.343, 0.323, 0.118];
names = {'Hoods','Drop Bars','Aero Bars','Plank'};

% Velocity range [m/s]
v     = linspace(0,15,300);

% Heavy headwind speed [m/s]
v_wind = 5;

% Plot
colors = lines(length(A));
figure; hold on;
for i = 1:length(A)
    % No wind:
    P0 = 0.5*r*A(i).*v.^3 + m*g*Cr.*v;
    % With headwind:
    P1 = 0.5*r*A(i).*(v + v_wind).^3 + m*g*Cr.*v;
    % Plot no wind with solid line
    plot(v, P0, '-', 'Color', colors(i,:), 'LineWidth', 1.5, ...
         'DisplayName', [names{i} ' (no wind)']);
    % Plot with headwind with dotted line
    plot(v, P1, ':', 'Color', colors(i,:), 'LineWidth', 1.5, ...
         'DisplayName', [names{i} ' (5 m/s wind)']);
end

xlabel('Velocity, v (m/s)');  
ylabel('Required Power, P (W)');
title('Required Cycling Power vs. Velocity');
legend('Location','northwest','Interpreter','none');
grid on;
