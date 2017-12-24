% vector field
function y = vectorField(t, x, params)
  r = rFunc(x, params); % R
  phi = phiFunc(x, params);
  signs = [1, -1]; % to choose + or 0 in formulas
  
  % parts of (2.7) and (2.8) inequalities (and also parts of (2.2) and (2.3))
  right = params.mu.*abs(params.Y-signs*r*sin(phi));
  left = params.X - signs*r * cos(phi);
  
  % (2.7), (2.8)
  conds = abs(left) <= right;
  
  % calculator of (2.2) and (2.3)
  ddotXFun = @(sigmas) left - right.* sigmas;
  
  % sigmas for regular and degenerate cases
  sigma = sign([x(2), x(4)]);
  sigmaS = sign(left);
  
  % (2.2) and (2.3) for regular and degenerate cases
  % It is not the vector field
  ddotx = ddotXFun(sigma);
  ddotxS = ddotXFun(sigmaS);
  
  if abs(x(2)) > params.tolerance && abs(x(4)) > params.tolerance
    y = [x(2), ddotx(1), x(4), ddotx(2)];     % case 1
  elseif abs(x(4)) > params.tolerance
    if conds(1)
      y = [x(2), 0, x(4), ddotx(2)];          % case 2.a
    else
      y = [x(2), ddotxS(1), x(4), ddotx(2)];  % case 2.b
    end
  elseif abs(x(2)) > params.tolerance
    if conds(2)
      y = [x(2), ddotx(1), x(4), 0];          % case 3.a
    else
      y = [x(2), ddotx(1), x(4), ddotxS(2)];  % case 3.b
    end
  else
    if all(conds)
      y = [0, 0, 0, 0];                       % case 4.a
    elseif conds(2)
      y = [x(2), ddotxS(1), x(4), 0];         % case 4.b
    elseif conds(1)
      y = [x(2), 0, x(4), ddotxS(2)];         % case 4.c
    else
      y = [x(2), ddotxS(1), x(4), ddotxS(2)]; % case 4.d
    end
  end
end
