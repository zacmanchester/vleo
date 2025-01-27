function [Cd] = FlatPlateCd(a,S,sigma)

Cd = (1/S^2)*((S/sqrt(pi))*(4*sin(a)*sin(a) + 2*sigma*cos(2*a))*exp(-S*S*sin(a)*sin(a))...
    + sin(a)*(1 + 2*S*S + (1-sigma)*(1-2*S*S*cos(2*a))));

end

