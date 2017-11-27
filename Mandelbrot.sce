// Lab 11. Antipiev
// no coments below. everything was done in according to given algorythm
function rgb=defColor(n)
    rgb=[modulo(25*n,256)/256, 
         modulo(5*n,256)/256,
         (256 - modulo(25*n,256))/256]
endfunction

plot2d(0,0,rect=[-2.2,-1.6,1,1.6])
for i = -2.25:0.01:0.875
    for j = -1.5:0.02:1.5
        z = complex(0,0)
        f = %t
        c = complex(i,j)
        n = 50
        for k=1:50
            z = z^2+c
            if abs(z)>2 then
                f = %f
                n = k
                break
            end
        end
        col = defColor(n)
        plot("nn",i,j,'colo',[col(1),col(2),col(3)],'linest','none','marker','.','markersize',2)
    end
end
