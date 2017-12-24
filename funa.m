function y = funa(t, x, params)
  r = rFunc(x, params);
  phi = phiFunc(x, params);
  signs = [1, -1];
  
  right = params.mu.*abs(params.Y-signs*r*sin(phi));
  left = params.X - signs*r * cos(phi);
  
  conds = abs(left) <= right;
  ddotXFun = @(sigmas) left - right.* sigmas;
  
  sigma = sign([x(2), x(4)]);
  sigmaS = sign(left);
  
  ddotx = ddotXFun(sigma);
  ddotxS = ddotXFun(sigmaS);
  if abs(x(2)) > params.tolerance && abs(x(4)) > params.tolerance
    y = [x(2), ddotx(1), x(4), ddotx(2)];
  elseif abs(x(4)) > params.tolerance
    if conds(1)
      y = [x(2), 0, x(4), ddotx(2)];
    else
      y = [x(2), ddotxS(1), x(4), ddotx(2)];
    end
  elseif abs(x(2)) > params.tolerance
    if conds(2)
      y = [x(2), ddotx(1), x(4), 0];
    else
      y = [x(2), ddotx(1), x(4), ddotxS(2)];
    end
  else
    if all(conds)
      y = [0, 0, 0, 0];
    elseif conds(2)
      y = [x(2), ddotxS(1), x(4), 0];
    elseif conds(1)
      y = [x(2), 0, x(4), ddotxS(2)];
    else
      y = [x(2), ddotxS(1), x(4), ddotxS(2)];
    end
  end
end
