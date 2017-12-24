# event_1 is to stop computing at equilibrium
options = odeset('Events', @event_1, 'RelTol', 1e-10, 'AbsTol', 1e-10);


params.d = 0.8;
params.l =  1;
params.X = [3.6, 0];
params.Y = [0.8, -2.4];
params.mu = [0.525, 2.85];
params.k = 1;
params.nu = 1;
params.epsilon = 0.08;

# to compare speeds with zero
params.tolerance = 1e-7;


startPt = [0; 10; -0.65; 10];

# points of time where we want to compute trajectory.
# [0, 0.01, 0.02, 0.03 ... 9.99, 10.00]
timePts = [0:0.01:10];

# delta(0) = 0.03
calcAndPresent(params, timePts, startPt, options, 1);

# delta(0) = 0.12
startPt(3) = -0.73;
[t, y, deltas, ddeltas, rs] = calcAndPresent(params, timePts, startPt, options, 4);
