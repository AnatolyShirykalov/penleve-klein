function y = funa(t, x, params)
  r = rFunc(x, params);
  phi = phiFunc(x, params);
  sigma = sign([x(2), x(4)]);
  signs = [1, -1];
  ddotx = params.X - r * cos(phi) - params.mu.*abs(params.Y-signs*r*sin(phi)).* sigma;
  y = [x(2), ddotx(1), x(4), ddotx(2)];
end
