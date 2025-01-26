function zdot = AtmosphericDrag(r_e, t, z)

%Constants
density = 8.0; %g/cm^3
length = 100; %cm
width = 100; %cm
thickness = 1.0; %cm
mass = density*length*width*thickness/1000; %kg
edge_area = width*(thickness)/1e4; %m^2
face_area = length*width/1e4;
area = cosd(1.0)*edge_area + sind(1.0)*face_area;

Cd = 2.2;

%Calculate Altitude
r = z(1:3);
alt = norm(r) - r_e;

%Calculate Atmospheric Density
rho = AtmosphericDensity(alt);

%Calculate Acceleration
v = z(4:6);
w_e = [0 0 2*pi/86164]';
vrel = v - cross(w_e, r);
a = -.5*(area/mass)*(1e3*rho)*Cd*norm(v)*v; %factor of 1000 is to convert length scale to km



%Return state derivative
zdot = [v; a];

end

