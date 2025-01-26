function zdot = OrbitODE(mu, r, t, z)

    zdot = SphericalGravity(mu, t,z);
    drag = AtmosphericDrag(r, t,z);
    
    zdot(4:6) = zdot(4:6)+drag(4:6);

end

