function zdot = AtmosphericDragWedge(z, r_e, logdenfit)

%Constants
density = 8.0; %g/cm^3
length = 30; %cm
width = 20; %cm
thickness = 5.0; %cm

half_angle = atan((thickness/2)/length);

side_area = length*(thickness/4)/1e4;
face_area = sqrt(length^2 + (thickness/2)^2)/1e4;

mass = density*length*(thickness/4)*width/1000; %kg

sigma = 1.0; %steel?
%sigma = 0.3: %borosilicate glass?

Cd_face = FlatPlateCd(half_angle,9.5,sigma); 
Cd_side = FlatPlateCd(0,9.5,sigma);

%Calculate Altitude
r = z(1:3);
alt = norm(r) - r_e;

%Calculate Atmospheric Density
rho = AtmosphericDensity(alt,logdenfit);

%Calculate Acceleration
v = z(4:6);
w_e = [0 0 2*pi/86164]';
vrel = v - cross(w_e, r);
a = -(0.5/mass)*(1e3*rho)*(Cd_face*2*face_area + Cd_side*2*side_area)*norm(v)*v; %factor of 1000 is to convert length scale to km



%Return state derivative
zdot = [v; a];

end

