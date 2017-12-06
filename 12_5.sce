function b=sphere(r)
    t = linspace(0,%pi,100)
    p = linspace(0,2*%pi,100)
    deff("[x,y,z]=fx(p,t)", ["x=r.*cos(p).*sin(t)";
                             "y=r.*sin(p).*sin(t)";
                             "z=r.*cos(t)"])
    [Xf,Yf,Zf] = eval3dp(fx,p,t)
    plot3d(Xf,Yf,Zf)
    xtitle('Sphere')
    b = 0
endfunction

function b=normal(x0,y0,z0,r)
    t = linspace(-10,10,100)
    deff("[x,y,z]=fx(t,t)", ["x=x0+2*x0/r^2.*t";
                             "y=y0+2*y0/r^2.*t";
                             "z=z0+2*z0/r^2.*t"])
    [Xf,Yf,Zf] = eval3dp(fx,t,t)
    plot3d(Xf,Yf,Zf)
    b = 0
endfunction

function b=dot(x0,y0,z0,r)
    t = linspace(-20,20,100)
    q = linspace(-20,20,100)
    a = 2*x0/r^2
    bb = 2*y0/r^2
    c = 2*z0/r^2
    deff("[x,y,z]=fx(t,q)", ["x=x0+(-bb-c).*t";
                             "y=y0+a.*t";
                             "z=z0+a.*t"])
    [Xf,Yf,Zf] = eval3dp(fx,t,q)
    plot3d(Xf,Yf,Zf)
    b = 0
endfunction

sphere(10)
normal(0,-10,0,10)
dot(0,-10,0,10)
