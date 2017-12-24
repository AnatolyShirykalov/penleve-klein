function [value,isterminal,direction] = event_1(t,y)
  value = y(2)*y(4);
  isterminal = 1;
  direction = 0;