// LAB 8

// task 1
phi = 0:0.01:2*%pi
disp(phi)
a = 1.5
t = sqrt(abs(2*a*a.*cos(2*phi)))
polarplot(phi,t)

// task 2
function [x,y]=pol_pdsk(r,phi)
    x = r*cos(phi)
    y = r*sin(phi)
endfunction

function [r,phi]=pdsk_pol(x,y)
    r = sqrt(x*x+y+y)
    phi = asin(y/r)
endfunction

function [x,y,z]=sphere_pdsk(r,phi,t)
    x = r*sin(t)*cos(phi)
    y = r*sin(t)*sin(phi)
    z = r*cos(t)
endfunction

function [r,phi,t]=pdsk_sphere(x,y,z)
    r = sqrt(x*x+y*y+z*z)
    phi = atan(y/x)
    t = acos(z/r)
endfunction

function [x,y,zp]=cyl_pdsk(r,phi,zs)
    x = r*cos(phi)
    y = r*sin(phi)
    zp = zs
endfunction

function [r,phi,zs]=pdsk_cyl(x,y,zp)
    r = sqrt(x*x*+y*y)
    phi = atan(y/x)
    zs = zp
endfunction
