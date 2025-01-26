function zdot = SphericalGravity(mu, t, z)

r = z(1:3);

d = sqrt(r'*r);

a = -r*mu/(d^3);

zdot = [z(4:6); a];

end

