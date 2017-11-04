// LAB #3
// i. antipiev GL HF

// check user's vector
function b=cV(sol, v)
    if ((sol./v) == ones(1,3)) then
        b = %T;
    else
        b = %F;
    end
endfunction

disp('2x+y+3z=10\nx+y+z=6\nx+3y+2z=13'); // kak sdelat' perenos?
s1 = [2 1 1];
s2 = [1 1 3];
s3 = [3 1 2];
s = [10 6 13];
// metod Kramera
// x = deltaX / delta i t.d.
d = det([s1;s2;s3]);
x = det([s;s2;s3])/d;
y = det([s1;s;s3])/d;
z = det([s1;s2;s])/d;
disp("Solution: x = "+ string(x)+" y = "+ string(y)+" z = "+ string(z));
// user's playing
while %T
    try
        enter = input('Insert _ to: 0 - exit 1 - enter your vector 2 - show the solution 3 - show determinate');
        td = int(enter)
        if (td == 0) then
            disp('Goodbye!');
            exit;
        elseif (td == 1) then
            v = input('Input vector like [x y z]')
            if cV([x y z], v) then
                disp('Correct!')
                // function returns True if the vectors are equal
                // it works nice in console
                // but it doesn't print correct here
                // if u know how to fix it tell me pls
            else 
                disp('Wrong!')
            end
        elseif (td == 2) then
            disp("Solution: x = "+ string(x)+" y = "+ string(y)+" z = "+ string(z));
        else
            disp('det ='+string(d));
        end
    catch
        continue;
    end
end
// OUTPUT