function ret = rFunc(x, params)
  ret = params.k * params.epsilon^(-2)*deltaFunc(x, params) + params.nu * params.epsilon^(-1) * dotDeltaFunc(x, params);
end