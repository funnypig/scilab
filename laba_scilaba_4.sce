// HomeWork 4. (c)ANTIPIEV
// output attached in the end
// Good Luck!

// 1. searching for primes in this block
timer();
fin = 1000000; // 10^6
[nums] = ones(2,fin);
p = 2;
while (p<=fin)
    t = p+p;
    tt = p*p;
    if (nums(p)==1) then
        while (t<=fin), nums(t) = 0; t=t+p;end; // t += p ???
    end
    p=p+1; // p++ ???
end
// make an array of primes
prims = [];
for i=2:fin
// add primes to array
    if (nums(i)==1) then
        prims($+1) = i;
    end
end
time = timer()
disp('Простые числа от 2 до 10^6 найдены за '+string(time));

// 2. twins primes
timer();
twins_count = 0
for i = 1:length(prims)-1
    if (prims(i) >= fin) then
        break
    end
    if (prims(i+1)-prims(i) == 2) then
        twins_count=twins_count+1;
    end
end
time = timer();
disp(string(twins_count)+' простых чисел близнецов от 2 до 10^6 было найдено за '+string(time));

// 3. count primes for all n = 2:10^6
timer()
potn = list()
cp = 1
cur_v = 0
prim = prims;
prim($+1)=1000001; // fix index out of range in the next loop
for i = 1 : fin/10
    if (i == prim(cp)) then
        cp=cp+1
        potn($+1) = cp-1
    else
        potn($+1) = cp-1
    end
end
time = timer()
disp('Количество простых чисел (pi(n)) от 1 до 10^6 найдено за '+string(time))

// 4. plots
timer()
x = [1:fin];
subplot(2,1,1);
plot(x,potn);
xtitle('pi(n)');
subplot(2,1,2);
y = x./log(x)
plot(x,y);
xtitle('n/ln(n)')
time = timer()
disp('Графики функций pi(n) и n/ln(n) построились за '+string(time))

// 
function ch = check357(n)
    if (n - int(n/3)*3 == 0)  then
        if (n - int(n/5)*5 == 0) then
            if (n - int(n/7)*7 == 0)  then
                ch = %T
            else
                ch = %F
            end
        else
            ch = %F
        end
    else 
        ch = %F
    end
endfunction
function num = generateNumber()
    num = int(rand()*10)
    if (num == 0) then
        num = 1
    end
    num = num*10^9
    for j=1:8
        num=num+int(rand()*10)*10^j
    end
    if (num - int(num/2)*2 == 0) then
        num = num+1
    end
    maxv = 10**10;
    while (~check357(num)) // it shouldnt be divided by 3 5 and 7
        num = num + 2
        if (num > maxv) then
            num = 1000000007;
            break;
        end;
    end
endfunction
// return True if the number is prime or False if it isn't
// вторая версия. сократил в 2 раза время проверки, отказавшись от четных чисел. сразу не догадался
// приведенный в конце вывод вряд ли будет изменен.
function b=ifPrime(n)
    b = %T;
    fin = int(sqrt(n))
    if modulo(n,2)==0 then
        b = %F
        return
    end
    for i=3:2:fin
        // p mod i == 0. про модуль я узнал позднее. написано было раньше. не стану уже трогать тут и далее.
        if (n - i * int(n / i) == 0) then
            b = %F;
            break;
        end
    end 
endfunction

// 5. 
timer()
fin = 10000000; // 10^7
// generate numbers and check if they are prime
timer()
prime_count = 0
for i=1:fin
    num = int(rand()*10)
    if (num == 0) then
        num = 1
    end
    num = num*fin
    for j=1:9
        num=num+int(rand()*10)*10^j
    end
    if (ifPrime(num)) then
        prime_count = prime_count+1;
    end
end
time = timer()
disp('5. Генерирование чисел и проверка на простоту заняли '+string(time))
disp('5. '+string(prime_count/(fin/100))+'% чисел из 10^7 оказались простыми')

// 6.
timer()
prime_count = 0
for i=1:fin
    num = generateNumber();
    if (ifPrime(num)) then
        prime_count = prime_count+1;
    end
end
time = timer()
disp('6. Генерирование чисел и проверка на простоту заняли '+string(time))
disp('6. '+string(prime_count/(fin/100))+'% чисел (не делящихся на 2,3,5,7,11) из 10^7 оказались простыми')

// 7.
timer()
lth = length(prims)
p = 0
q = 0
ready = %F
for i=2:lth
    for j=2:lth
        if (2**i + 1 == 3*j)
            p = i;
            q = j;
            ready = %T
        end
    end
    if (ready) then break end
end
time = timer()
disp('2^p + 1 = 3q, при p = '+string(p)+', q = '+string(q))
disp('Время выполнения 7 пункта: '+string(time));

// 8. 
timer()
path = 'E:\0University\SciLab\lab_4\'
pi = read(path+'pi_modified.txt',-1,1);
pil = length(pi);
found_pi_ind = 0;
found_pi = 0;
for i=1:pil
    a = pi(i+1)*10**9+pi(i+2)*10**8+pi(i+3)*10**7+pi(i+4)*10**6+pi(i+5)*10**5;
    a = a+ pi(i+6)*10**4+pi(i+7)*1000+pi(i+8)*100+pi(i+9)*10+pi(i+10);
    if (ifPrime(a)) then
        found_pi_ind = i;
        found_pi = a;
        break
    end
end

e = read(path+'e_modified.txt',-1,1);
el = length(pi);
found_e_ind = 0;
found_e = 0;
for i=1:el
    a = e(i+1)*10**9+e(i+2)*10**8+e(i+3)*10**7+e(i+4)*10**6+e(i+5)*10**5;
    a = a+ e(i+6)*10**4+e(i+7)*1000+e(i+8)*100+e(i+9)*10+e(i+10);
    if (ifPrime(a)) then
        found_e_ind = i;
        found_e = a;
        break
    end
end

time = timer()
disp('Последовательности простых 10-значных чисел в числе Pi и E найдена за: '+string(time));
disp('Pi: '+string(found_pi)+', начинается с '+string(found_pi_ind)+' знака');
disp('E: '+string(found_e)+', начинается с '+string(found_e_ind)+' знака');


// OUTPUT:
/*

--> exec('E:\0University\SciLab\laba_scilaba_4.sce', -1)

 Простые числа от 2 до 10^6 найдены за 10.296875

 8169 простых чисел близнецов от 2 до 10^6 было найдено за 0.375

 Количество простых чисел (pi(n)) от 1 до 10^6 найдено за 1.046875

 Графики функций pi(n) и n/ln(n) построились за 0.84375
Предупреждение : переопределение функции: generateNumber          . Чтобы это сообщение не появлялось, используйте funcprot(0)

 5. Генерирование чисел и проверка на простоту заняли 1653.9531

 5. 0% чисел из 10^7 оказались простыми (0)

 6. Генерирование чисел и проверка на простоту заняли 6923.875

 6. 0% чисел (не делящихся на 2,3,5,7,11) из 10^7 оказались простыми (0)

 2^p + 1 = 3q, при p = 3, q = 3

 Время выполнения 7 пункта: 0.25

 Последовательности простых 10-значных чисел в числе Pi и E найдена за: 0.90625

 Pi: 5.927D+09, начинается с 4 знака

 E: 7.427D+09, начинается с 99 знака

*/
