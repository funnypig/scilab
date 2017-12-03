// Lab 12. Antipiev
function b=ellipsoid(a,b,c)
    t = linspace(0,%pi,100)
    p = linspace(0,2*%pi,100)
    deff("[x,y,z]=fx(p,t)", ["x=a.*cos(p).*sin(t)";
                             "y=b.*sin(p).*sin(t)";
                             "z=c.*cos(t)"])
    [Xf,Yf,Zf] = eval3dp(fx,p,t)
    plot3d(Xf,Yf,Zf)
    xtitle('Ellipsoid')
endfunction

function b=odn_hyper(a,b,c)
    p = linspace(0,2*%pi,100)
    u = linspace(-2,2,100)
    deff("[x,y,z]=fx(p,u)", ["x=a.*cos(p).*cosh(u)";
                             "y=b.*sin(p).*cosh(u)";
                             "z=c.*sinh(u)"])
    [Xf,Yf,Zf] = eval3dp(fx,p,u)
    plot3d(Xf,Yf,Zf)
    xtitle('single-celled hyperboloid')
endfunction


function b=dvo_hyper(a,b,c)
    p = linspace(0,2*%pi,100)
    u = linspace(-10,10,100)
    deff("[x,y,z]=fx(p,u)", ["x=a.*cos(p).*sinh(u)";
                             "y=b.*sin(p).*sinh(u)";
                             "z=c.*sinh(u)"])
    [Xf,Yf,Zf] = eval3dp(fx,p,u)
    plot3d(Xf,Yf,Zf)
    xtitle('two-cavity hyperboloid')
endfunction

function b=el_par(p,q)
    u = linspace(-10,10,100)
    v = linspace(-10,10,100)
    deff("[x,y,z]=fx(u,v)", ["x=u";
                             "y=v";
                             "z=u^2/(2*p)+v^2/(2*q)"])
    [Xf,Yf,Zf] = eval3dp(fx,u,v)
    plot3d(Xf,Yf,Zf)
    xtitle('elliptical paraboloid')
    b = 0 // i dont know why. but there is error thrown
endfunction

function b=hyp_par(p,q)
    u = linspace(-10,10,100)
    v = linspace(-10,10,100)
    deff("[x,y,z]=fx(u,v)", ["x=u";
                             "y=v";
                             "z=u^2/(2*p)-v^2/(2*q)"])
    [Xf,Yf,Zf] = eval3dp(fx,u,v)
    plot3d(Xf,Yf,Zf)
    xtitle('hyperbolic paraboloid')
    b = 0
endfunction

subplot(3,2,1)
ellipsoid(2,3,2)
subplot(3,2,2)
odn_hyper(2,2,2)
subplot(3,2,3)
dvo_hyper(2,3,5)
subplot(3,2,4)
el_par(2,2)
subplot(3,2,5)
hyp_par(2,2)
