% Parameters
m = 69.4;
g = 9.81;
C_rr = 0.003;
rho = 1.2;
C_d = 1.0;
% Hill's parameters
F0 = 1500;
a = 100;
b = 0.5;
r = 5;

% Frontal area (m^2)
HOODS = 1; DROPS = 2; AERO = 3; PLANK = 4;
A_vals = [0.363, 0.343, 0.323, 0.118];

% Change the following for different simulations
controller_type = 'adaptive';   % 'steady' for steady effort, 'adaptive' for adaptive pacing
course_type = 'ironman';      % 'repeating' for repeating 0/5/-5 deg hills, 'ironman' for Western Mass course

%% Course definitions
total_distance_m = 90.1 * 1000;
if strcmpi(course_type, 'repeating')
    segment_length_m = 5 * 1609.34;
else
    segment_lengths_m = [8, 4, 8, 5, 5, 5, 10, 5, 6] * 1609.34;
    segment_slopes_deg = [0.8, -0.5, 0.8, 1.5, -2.0, 0.8, -0.88, 0.5, -1.0];
    cum_segment_dist = cumsum(segment_lengths_m);
    current_segment = 1;
end

%% Simulation initialized
dt = 1.0;
time = 0;
distance = 0;
V = 0;

time_history = [];
speed_history = [];
power_history = [];
posture_history = [];
slope_history = [];
distance_history = [];

%% Simulation
while distance < total_distance_m
    if strcmpi(course_type, 'repeating')
        dist_miles = distance / 1609.34;
        segment_pos = mod(dist_miles, 15);
        if segment_pos < 5
            theta_deg = 0;
        elseif segment_pos < 10
            theta_deg = 5;
        else
            theta_deg = -5;
        end
    else
        if current_segment <= length(cum_segment_dist) && distance >= cum_segment_dist(current_segment)
            current_segment = current_segment + 1;
        end
        if current_segment > length(segment_slopes_deg)
            theta_deg = segment_slopes_deg(end);
        else
            theta_deg = segment_slopes_deg(current_segment);
        end
    end

    if theta_deg > 3
        posture = HOODS;
    elseif theta_deg > 1
        posture = DROPS;
    elseif theta_deg > -3
        posture = AERO;
    else
        posture = PLANK;
    end

    if strcmpi(controller_type, 'steady')
        alpha = 0.8;
        if posture == PLANK
            alpha = 0;
        end
    else
        if theta_deg >= 1
            alpha = 1.0;
        elseif theta_deg >= -1
            alpha = 0.8;
        elseif theta_deg >= -3
            alpha = 0.5;
        else
            alpha = 0.0;
        end
    end

    v_muscle = V / r;
    F_muscle = (b * (F0 + a) / (v_muscle + b)) - a;
    if F_muscle < 0
        F_muscle = 0;
    end
    F_drive = alpha * F_muscle / r;

    F_gravity = m * g * sind(theta_deg);
    F_roll = m * g * C_rr;
    A = A_vals(posture);
    F_aero = 0.5 * rho * C_d * A * V^2;
    F_resist = F_roll + F_gravity + F_aero;

    acc = (F_drive - F_resist) / m;
    V = V + acc * dt;
    if V < 0
        V = 0;
    end
    distance = distance + V * dt;
    time = time + dt;

    power = F_drive * V;
    V_mph = V * 2.23694;

    time_history(end+1) = time;
    speed_history(end+1) = V_mph;
    power_history(end+1) = power;
    posture_history(end+1) = posture;
    slope_history(end+1) = theta_deg;
    distance_history(end+1) = distance;
end

%% Performance summary
total_time = time;
hours = floor(total_time / 3600);
minutes = floor(mod(total_time, 3600) / 60);
seconds = mod(total_time, 60);
avg_speed_mps = distance / total_time;
avg_speed_mph = avg_speed_mps * 2.23694;
fprintf('Controller: %s, Course: %s\n', controller_type, course_type);
fprintf('Total time to complete 56 miles: %d h %d min %.1f s\n', hours, minutes, seconds);
fprintf('Average speed: %.2f mph (%.2f m/s)\n', avg_speed_mph, avg_speed_mps);
if sum(power_history) > 0
    avg_power = mean(power_history(power_history > 0));
    fprintf('Average power output (while pedaling): %.1f W\n', avg_power);
end

%% Results
time_hours = time_history / 3600;
figure;
subplot(5,1,1);
plot(time_hours, speed_history, 'b');
ylabel('Speed (mph)');
title('Speed vs Time');

subplot(5,1,2);
plot(time_hours, power_history, 'b');
ylabel('Power (W)');
title('Power vs Time');
ylim([0 500]);

subplot(5,1,3);
plot(time_hours, slope_history);
ylabel('Slope (deg)');
title('Road Slope vs Time');

subplot(5,1,4);
stairs(time_hours, posture_history);
yticks([HOODS, DROPS, AERO, PLANK]);
yticklabels({'Hoods','Drops','Aero','Plank'});
ylabel('Posture');
title('Posture Mode vs Time');

subplot(5,1,5);
plot(time_hours, distance_history / 1609.34);
ylabel('Distance (mi)');
xlabel('Time (hours)');
title('Distance vs Time');
