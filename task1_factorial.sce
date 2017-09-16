// task 1. variant 1. antipiev.
// calculate factorial from 1 to 20
// ask user where he wish to save file
path = input("Введите путь как папке, где сохранить результат","string");
// start writing file. file will be created in path directory
try // user may make mistakes in path
diary(path+'factorial.txt')
fact = 1; // remember calculated factorial
for i=1:20
fact=fact*i;
// write result both in console and file
disp(string('Факториал '+string(i)+' = '+ string(fact)));
end
// finish writing the file
diary(0)
catch
    disp('Что-то пошло не так!');
end
// i didn't found smth about \n
// so there is diary 
