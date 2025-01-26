function rho = AtmosphericDensity(h)

%Data is from SMAD tables for density vs. altitude
%Density is kg/m^3

% h = [100 150 200 250 300 350 400 450 500]'; %Altitude in km.
% rho_min = [4.61e-7 1.65e-9 1.78e-10 3.35e-11 8.19e-12 2.34e-12 7.32e-13 2.47e-13 8.98e-14]';
% rho_avg = [4.79e-7 1.81e-9 2.53e-10 6.24e-11 1.95e-11 6.98e-12 2.72e-12 1.13e-12 4.89e-13]';
% rho_max = [5.10e-7 2.04e-9 3.52e-10 1.06e-10 3.96e-11 1.68e-11 7.55e-12 3.61e-12 1.80e-12]';

%Fits to SMAD data (for h in meters)
%rho = 9.201e-05*exp(-5.301e-05*h); %min
%rho = 5.987e-05*exp(-4.836e-05*h); %avg
%rho = 4.393e-05*exp(-4.467e-05*h); %max


%Density in kg/m^3, altitude in km
%rho = 0.033546668235535*exp(-0.111567475042664*h);
rho = 1.256346042915674e-04*exp(-0.074831012308469*h) + 1.207115343455723e-08*exp(-0.023138414635857*h);

end

