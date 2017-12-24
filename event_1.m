function [value,isterminal,direction] = event_1(t,y)
  value = max(abs(y));
  isterminal = 1;
  direction = 0;