// Lab 12. Antipiev
function def=define(a11, a12, a22, a13, a23, a33)
    a12 = a12 / 2
    d = a11*a22-a12*a12
    if d == 0 then
        def = 'parabola'
    elseif d > 0
        def = 'ellipse'
    else
        def = 'hyperbola'
    end
endfunction

function k=eq2toKanon(a,b,c,d,e,f)
// input: a*x^2+2*b*(xy)+c*y^2+2*d*x+2*e*y+f = 0
// output: A*x^2+B*y^2+F=0
    b = b / 2
    d = d / 2
    e = e / 2
    
    dm = det([a b d; b c e; d e f])
    F = dm / a*c-b*b
    B = (b + sqrt(b*b-4*a)) / 2
    A = a / B
    // there is B = (b - sqrt())/2. but its too long
    k = [A B F]
endfunction

function d=dot(a,b,c,d,e,f,mx,my)
    v = eq2toKanon(a,b,c,d,e,f)
    vid = define(a,b,c,d,e,f)
    if vid == 'ellipse' then
        l = mx/(v(1)**2)
        m = my/(v(2)**2)
        t = -10:0.1:10
        x = mx + l.*t
        y = my + m.*t
        plot(x,y)
        xtitle("Ellipse`s tangent")
    end
endfunction

function b = build(a,b,c,d,e,f)
    x = list()
    y = list()
    for i=-10:0.005:10
        for j = -10:0.005:10
            if abs(a*i*i+b*i*j+c*j*j+d*i+e*j+f)<0.01 then
                x($+1) = i
                y($+1) = j
                plot2d(i,j,0)
            end
        end
    end
endfunction

dot(13,18,37,-26,-18,-27, 0, 1.13144)
build(13,18,37,-26,-18,-27)
