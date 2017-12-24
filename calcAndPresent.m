% returns trajectory t, [x1, x1', x2, x2'] and delta, delta', R
% drows one row (3 plots) in figure
function [t, y, deltas, ddeltas, rs] = calcAndPresent(params, interval, startPoint, options, subplotNumber)
  % calculate trajectory t, [x1, x1', x2, x2']
  [t, y] = ode45(@(t, y) vectorField(t, y, params), interval, startPoint, options);
  
  % calculate data for pictures
  deltas = [];
  ddeltas = [];
  rs = [];
  for i = 1:size(y)(1)
    deltas(i) = deltaFunc(y(i, :), params);
    ddeltas(i) = dotDeltaFunc(y(i, :), params);
    rs(i) = rFunc(y(i, :), params);
  end
  
  % drawing pictures
  subplot(2, 3, subplotNumber);
  plot(deltas, ddeltas, '*-r', 'LineWidth', 2);
  hold off;
  title('d\delta/dt');
  xlabel('\delta');
  ylabel('d\delta/dt');
  grid on;

  subplot(2, 3, subplotNumber + 1);
  plot(t, rs, '-b', 'LineWidth', 2);
  title('R');
  xlabel('t');
  ylabel('R');
  grid on;

  subplot(2, 3, subplotNumber + 2);
  plot(t, y(:, 2), '-g', 'LineWidth', 2);
  title('v_1');
  xlabel('t');
  ylabel('v_1');
  grid on;

end
