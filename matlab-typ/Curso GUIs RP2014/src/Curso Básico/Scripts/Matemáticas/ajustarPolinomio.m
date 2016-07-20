% Ajusta un polinomio de 2do grado a la funcion y=x*sin(x)
% en el intervalo [0 pi/2]
clear all;clc;
x=0:pi/90:pi/2;
y=x.*sin(x);
p=polyfit(x,y,2);
plot(x,y,'ro',x,polyval(p,x),'b');
legend('Datos','Polinomio ajustado');
try
    pretty(simplify(poly2sym(p)));
catch e
    disp(e.message);
end