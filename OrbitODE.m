function zdot = OrbitODE(mu, r, logdenfit, t, z)

    zdot = SphericalGravity(mu, t,z);
    drag = AtmosphericDrag(r, t, z, logdenfit);
    
    zdot(4:6) = zdot(4:6)+drag(4:6);

end

