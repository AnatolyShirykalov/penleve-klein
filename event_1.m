function [value,isterminal,direction] = event_1(t,y)
  # if one of speeds is sero
  value = max(abs([y(2), y(4)]));
  # then terminate computation
  isterminal = 1;
  # the next does not matter here. But we must return something
  direction = 0;