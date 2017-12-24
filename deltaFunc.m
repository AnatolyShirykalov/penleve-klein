function ret = deltaFunc(x, params)
  ret = sqrt((x(1) - x(3))^2 + params.d^2) - params.l;
end