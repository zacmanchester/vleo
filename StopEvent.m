function [value,isterminal,direction] = StopEvent(r_e, cutoff, t, z)

alt = sqrt(z(1).^2+z(2).^2+z(3).^2)-r_e;

value = alt - cutoff;

isterminal = 1;
direction = 0;

end

