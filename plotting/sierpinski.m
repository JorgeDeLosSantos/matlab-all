function sierpinski(a,b,c,nivel)
persistent niv0
niv0=nivel;
hold on;
waitbar(nivel/niv0,'Espere un momento...');
plot(a(1),a(2),'.');
plot(b(1),b(2),'.');
plot(c(1),c(2),'.');
if nivel>0
    p1=[(a(1)+c(1))/2 (a(2)+c(2))/2];
    p2=[(a(1)+b(1))/2 (a(2)+b(2))/2];
    p3=[(c(1)+b(1))/2 (c(2)+b(2))/2];
    sierpinski(a,p2,p1,nivel-1);
    sierpinski(p1,p3,c,nivel-1);
    sierpinski(p2,b,p3,nivel-1);
end
end