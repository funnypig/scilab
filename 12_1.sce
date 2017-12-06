// Lab 12. Antipiev

 function b=elips(a,b)
     // i dont care about param or canon 
     // i just need a and b and build with param
     t = 0:0.1:2*%pi
     x = a.*cos(t)
     y = b.*sin(t)
     plot(x,y)
     xtitle('Ellipse')
 endfunction
 
 function b=hyperbola(a,b)
     t = -2:0.1:2
     x = -a.*cosh(t)
     y = b.*sinh(t)
     plot(x,y)
     x = a.*cosh(t)
     plot(x,y)
     xtitle('Hyperbola')
 endfunction
 
 function b=parabola(p)
     t = -10:0.1:10
     x = t.*t./(2*p)
     plot(x,t)
     xtitle('Parabola')
 endfunction
 
 subplot(3,1,1)
 elips(3,4)
 subplot(3,1,2)
 hyperbola(2,5)
 subplot(3,1,3)
 parabola(4.5)
