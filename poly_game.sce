// polynom game

// i dont want to deal inputs in scilab
p1 = 15 // input('What is p(1)?')
pn = 22560 // input('What is p(p1+1)?')

cf = list()

n = p1+1
y = pn
while y>0
    i = modulo(y,n)
    cf($+1) = i
    y = int((y-i)/n)
end

//polynom = poly(cf, 'coeff')
disp(cf)  // IT WORKS! MATH WORKS! :)
