// Lab 13. Polynoms. Antipiev

function res = ownHorner(a,v)
    res =list()
    v = reverse(v) // because poly starts with a0
    res($+1) = v(1)
    for i=2:length(v)
        res($+1) = res(i-1) * a + v(i)
    end
endfunction

function res=fx_vlob(a,v)
    res = 0
    for i=1:length(v)
        res = res + (a**(i-1))*v(i)
    end
endfunction

// function below is in task 2
function new_pol=rozklad_x_a(a,v)
    new_pol = list()
    len = length(v)
    for i=1:len
        v = ownHorner(a,v)
        new_pol($+1) = v(length(v))
    end
endfunction

function newList=reverse(v)
    newList = list()
    for i=length(v):-1:1
        newList($+1) = v(i)
    end
endfunction

// a0+a1*x+a2*x*x+...
v = [2 -1 4 -3 2 5 6 9 8 7 16 4 -15 18 3 5 2 1 0 4 5 1 9 4 -16 3 -8 7 9 9 5 -5 5 4 9 4 14 -17 20 3 8 9 19 15 -5 3 2 1  4 5 2 3 1 2 3 2 1 3 22 2 -4 8 2 0 0 0 0 -1 2 3 1 2 3 1 2 3 2 4 2 -1 2 3 1 -3 2 3 4 2 1 3 4 2 21 23 3 2 3 1 -10 3 1 3 2 8 37 3 5 3 6 68 8 2 9 3 8 1 7 2 4 5 2 1 2 4 2 -3 3 2 3 2 0 3 5 7 2 7 2 8 4 6 9 1 2 9 2 8 2 7 4 7 1 0 2 7 4 2 4 1 2 9 8 7 6 5 4 3 2 1 2 3 4 5 6 7 8 9 8 7 6 5 4 3 2 1 2 3 4 5 6 7 8 9 0 -1 -2 3 4 5 -6 34 2 1 0 3 3 4 1 2 4 8 3 89 3 4 2 4 2 8 6 3 4 1 5 2 6 3 4 6 1 5 2 6 38 9 1 -2 3 4 2 6 2 8 1 9 2 4 5 2 7 2 5 9 2 -5 2 7 9 2 7 0 4 2 7 1 9 2 6 3 0 6 2 9 2]
for i=1:length(v)
    v($+1)=v(i)*v(i)
    v($+1)=-v(i)
end     // ANYWAY TIME = 0 IN BOTH CASES.

a = 2
timer()
vh = ownHorner(a,v)
fa = vh(length(vh))
time = timer()
disp('Horner: time = '+string(time)+' f(a) = '+string(fa))

timer()
vv = fx_vlob(a,v)
fx = vv(length(vv))
time = timer()
disp('Just count: time = '+string(time)+' f(a) = '+string(fx))

function res = Qroots(v)
    res = list()
    p = dividers(v(1))
    q = dividers(v(length(v)))
    rts = list()
    for i=1:length(p)
        for j=1:length(q)
            r = p(i)/q(j) // search for possible roots
            if (~contains(r,rts)) then
                rts($+1) = r
            end
        end
    end

    for i = 1:length(rts) // check possible root
        r = ownHorner(rts(i), v)
        if (r(length(r)) == 0) then
            res($+1) = rts(i)
        end
    end
endfunction


// search for numbers that are dividers of a
function div=dividers(a)
    div = list()
    for i=1:abs(a)
        if int(a/i) == a/i then
            if ~contains(i,div) then
                div($+1) = i
                div($+1) = -i
            end
        end
    end
endfunction

function b=contains(a,v)
    for i=1:length(v)
        if v(i) == a then
            b = %T
            return
        end
    end
    b = %F
endfunction

v = [1 -2 1]    
disp('Roots: '+string(Qroots(v))) // output 1. check yourself

// TASK 4
// return list of numbers with multiplicity at least 2
function b=ifMultipleRoot(v)
    b = list()
    roots_ = Qroots(v)
    disp(roots_)
    for i = 1:length(roots_)
        r1 = ownHorner(roots_(i),v)
        disp('i = '+string(i))
        disp(r1)
        r2 = ownHorner(roots_(i),reverse(r1))
        disp(r2)
        if ((r1(length(r1)) == 0) & (r2(length(r2)) == 0)) then
            b($+1) = roots_(i)
        end
    end
endfunction

v = [16 0 -16 -4 3 1]
disp('Multiply roots: '+string(ifMultipleRoot(v))) // output -2. its ok
