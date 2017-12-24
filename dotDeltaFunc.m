function ret = dotDeltaFunc(x, params)
  ret = (x(2) - x(4)) * (x(1) - x(3))/(1 + deltaFunc(x, params));
end