function zdot = AtmosphericDrag(r_e, t, z, logdenfit)

%Constants
density = 8.0; %g/cm^3
length = 30; %cm
width = 30; %cm
thickness = 2.0; %cm
mass = density*length*width*thickness/1000; %kg
edge_area = width*(thickness)/1e4; %m^2
face_area = length*width/1e4;
area = cosd(0.5)*edge_area + sind(0.5)*face_area;

Cd_n = 2.2; %2.2;
Cd_t = 0.1;

%Calculate Altitude
r = z(1:3);
alt = norm(r) - r_e;

%Calculate Atmospheric Density
rho = AtmosphericDensity(alt,logdenfit);

%Calculate Acceleration
v = z(4:6);
w_e = [0 0 2*pi/86164]';
vrel = v - cross(w_e, r);
a = -(0.5/mass)*(1e3*rho)*(Cd_n*edge_area + Cd_t*face_area)*norm(v)*v; %factor of 1000 is to convert length scale to km



%Return state derivative
zdot = [v; a];

end

