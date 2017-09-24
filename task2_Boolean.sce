// task 2. variant 1. antipiev
// solve boolean sample
path = input('Введите путь как папке, где сохранить результат','string');
try
    diary(path+'Boolean.txt');
    disp('A or B');
    a = %T;
    b = %T;
    disp("A = 1 B = 1    A or B = "+string(a|b));
    a = %T, b = %F
    disp('A = 1 B = 0    A or B = '+ string(a|b));
    a = %F, b = %T
    disp('A = 0 B = 1    A or B = '+ string(a|b));
    a = %F, b = %F
    disp('A = 0 B = 0    A or B = '+ string(a|b));
    diary(0);
catch
    disp('ERROR!');
end
