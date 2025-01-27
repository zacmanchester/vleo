altskm = [125; 150; 175; 200; 225; 250; 275];
altsm = altskm*1000;
flags = ones(1,23);
flags(9) = -1;
[f107a,f107,aph] = fluxSolarAndGeomagnetic(2025,1,0,'aerospaceweatherdata20241112.mat');
[T, rho] = atmosnrlmsise00(altsm, 0, 0, 2025, 1, 0, f107a, f107, aph, flags, 'Oxygen');
density = rho(:,6);
logden = log(density);

%% Fit:
[xData, yData] = prepareCurveData( altskm, logden );

% Set up fittype and options.
ft = fittype( 'poly3' );

% Fit model to data.
[logdenfit, gof] = fit( xData, yData, ft );