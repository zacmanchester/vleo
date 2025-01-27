%Constants
mu_e = 398600; %1000*km^3/hr^2
r_e = 6371;
cutoff_alt = 125;

%Define Initial Orbit
r0 = [250+r_e; 0; 0];
r0norm = norm(r0);
v0norm = sqrt(mu_e/r0norm);
v0 = [0; 0; v0norm];

z_0 = [r0; v0];

%Call integrator
options = odeset('AbsTol', 1e-9, 'RelTol', 1e-9, 'Events', @(t,x) StopEvent(r_e, cutoff_alt, t, x));
[t, z] = ode45(@(t,x) OrbitODE(mu_e, r_e, [], t, x), [0 60*60*24*365], z_0, options);

alt = (sqrt(z(:,1).^2+z(:,2).^2+z(:,3).^2)-r_e); %in km
plot(t/(60*60*24),alt);
xlabel('Time (days)');
ylabel('Altitude (km)');