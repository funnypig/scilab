// Home Lab #2. Antipiev
function [v] = vector_input()
    try
        [v] = input('Введите вектор');
    catch
        disp('На вход нужно ввести вектор! Формат: [a1 a2 a3 . . . an], ai - действительное число');
        //[v] = vector_input()
    end
endfunction
// try to input vector until it's ok
vec = vector_input() 
// prosit vvesti 2 raza. no 'Na vxod... Format...' ne vivodit => bag scilaba. moi code nice

// plots    http://prntscr.com/h20ahm
x = [-2:0.1:2]
y = sin(x).*%e^(x.*(-2))
subplot(2,1,1)
plot(x,y)
subplot(2,1,2)
x = [-2:0.1:0]
y = (1+x.*x)./sqrt(1+x.^4)
plot(x,y)
x = [0.1:0.1:2]
y = 2.*x+(sin(x)^2)/(2+x)
plot(x,y)
