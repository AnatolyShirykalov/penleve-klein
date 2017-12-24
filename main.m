options = odeset('Events',@event_1, 'RelTol',10^(-10),'AbsTol',10^(-10));
params.d = 0.8;
params.l =  1;
params.X = [3.6, 0];
params.Y = [0.8, -2.4];
params.mu = [0.525, 2.85];
params.k = 1;
params.nu = 1;
params.epsilon = 0.01;
startPt = [0; 10; -0.65; 10];
[t, y] = ode45(@(t, y) funa(t, y, params), [0 20], startPt, options);
deltas = [];
ddeltas = [];
for i = 1:size(y)(1)
  deltas(i) = deltaFunc(y(i, :), params);
  ddeltas(i) = dotDeltaFunc(y(i, :), params);
end

plot(deltas, ddeltas, 'r', 'LineWidth', 2);
title('Differential Equation');
xlabel('\delta');
ylabel('d\delta/dt');