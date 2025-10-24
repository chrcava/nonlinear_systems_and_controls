positions = {'Hoods', 'Drop Bars', 'Aero Bars'};
avg_speed = [17.9, 17.9, 18.8];
avg_hr = [165, 174, 178];
max_hr = [184, 192, 187];
calories = [95, 99, 96];
max_speed = [28.5, 29.5, 31.2];
time_sec = [508.6, 505.2, 482];

% Average Speed
figure;
bar(avg_speed);
set(gca, 'xticklabel', positions);
ylabel('Average Speed (mph)');
title('Average Speed Comparison');

% Heart Rate
figure;
bar([avg_hr; max_hr]');
set(gca, 'xticklabel', positions);
legend('Average HR', 'Max HR');
ylabel('Heart Rate (bpm)');
title('Heart Rate Comparison');

% Calories Burned
figure;
bar(calories);
set(gca, 'xticklabel', positions);
ylabel('Calories Burned');
title('Calories Burned Comparison');

% Max Speed
figure;
bar(max_speed);
set(gca, 'xticklabel', positions);
ylabel('Max Speed (mph)');
title('Max Speed Comparison');

% Time
figure;
bar(time_sec);
set(gca, 'xticklabel', positions);
ylabel('Time to complete 2.5 mi (s)');
title('Time Comparison (lower is better)');
