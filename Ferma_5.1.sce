function result=pseudoPrime(n,a)
    for i=1:n-1
        a = modulo(a*a,n)
    end
    if modulo(a-1,n) == 0 then
        result = %T
    else
        result = %F
    end
endfunction

function result=ifPrime(n)
    fin = sqrt(n)
    if n == 2 then
        result = %T
        return
    end
    for i=2:n-1
        if modulo(n,i) == 0 then
            result = %F
            return
        end
        if i>fin then
            result = %T
        end
    end
    result = %T
endfunction

function num = genNum()
    n = modulo(int(rand()*100+1),6) // number up to 10^6
    num = int(rand()*10)
    if num == 0 then
        num = 10**n
    else
        num = num*(10**n)
    end
    num = num + int(rand()*(10**n-1))
endfunction

c = 0
for i=1:10**2
    if pseudoPrime(i,2) then
        c=c+1
    end
    if i == 100 then
        disp('Количество псевдопростых (база 2) до 10^2 = '+string(c)) // = 7
    end
    if i == 1000 then
        disp('Количество псевдопростых (база 2) до 10^3 = '+string(c)) // = 11
    end
end
disp('Количество псевдопростых (база 2) до 10^6 = '+string(c)) // = лень ждать

primeCount = 0
testFerma = 0
for i=1:10**3
    c = 0
    k = genNum()
    if ifPrime(k) then
        primeCount = primeCount + 1
    end
    if pseudoPrime(k,int(rand()*100)) then
        c = c+1
    end
    if pseudoPrime(k,int(rand()*100)) then
        c = c+1
    end
    if pseudoPrime(k,int(rand()*100)) then
        c = c+1
    end
    if c == 3 then
        testFerma = testFerma + 1
    end
end
disp(string(primeCount)+' простых чисел') // to 10^3 -> 227 простых чисел
disp(string(testFerma)+' чисел прошли тест Ферма по трем случайным базам') 
// to 10^3 64 чисел прошли тест Ферма по трем случайным базам
