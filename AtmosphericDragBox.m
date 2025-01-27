function zdot = AtmosphericDragBox(z, r_e, logdenfit)

%Constants
density = 8.0; %g/cm^3
length = 30; %cm
width = 20; %cm
thickness = 3.0; %cm
mass = density*length*width*thickness/1000; %kg
edge_area = width*(thickness)/1e4; %m^2
face_area = length*width/1e4;
side_area = length*thickness/1e4;

Cd_n = FlatPlateCd(pi/2,9.5,1.0); %metal?
Cd_t = FlatPlateCd(0,9.5,0.3); %borosilicate glass?

%Calculate Altitude
r = z(1:3);
alt = norm(r) - r_e;

%Calculate Atmospheric Density
rho = AtmosphericDensity(alt,logdenfit);

%Calculate Acceleration
v = z(4:6);
w_e = [0 0 2*pi/86164]';
vrel = v - cross(w_e, r);
a = -(0.5/mass)*(1e3*rho)*(Cd_n*edge_area + Cd_t*2*face_area + Cd_t*2*side_area)*norm(v)*v; %factor of 1000 is to convert length scale to km



%Return state derivative
zdot = [v; a];

end

