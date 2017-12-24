options = odeset('Events', @event_1, 'RelTol', 1e-10, 'AbsTol', 1e-10);
params.d = 0.8;
params.l =  1;
params.X = [3.6, 0];
params.Y = [0.8, -2.4];
params.mu = [0.525, 2.85];
params.k = 1;
params.nu = 1;
params.epsilon = 0.1;
params.tolerance = 1e-7;
startPt = [0; 10; -0.65; 10];
[t, y] = ode45(@(t, y) funa(t, y, params), [0 10], startPt, options);
deltas = [];
ddeltas = [];
rs = [];
for i = 1:size(y)(1)
  deltas(i) = deltaFunc(y(i, :), params);
  ddeltas(i) = dotDeltaFunc(y(i, :), params);
  rs(i) = rFunc(y(i, :), params);
end

figure 1;
plot(deltas, ddeltas, '*-r', 'LineWidth', 2);
hold off;
title('Differential Equation');
xlabel('\delta');
ylabel('d\delta/dt');

figure 2;
plot(t, rs, '-b', 'LineWidth', 2);

figure 3;
plot(t, y(:, 2), '-g', 'LineWidth', 2);

