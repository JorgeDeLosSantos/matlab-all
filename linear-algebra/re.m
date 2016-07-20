clear;
clc;
fprintf('Cálculo de raíces por el metodo de Newton-Raphson multivariable\n\n');
z=input('Introduce la funcion f1: ', 's');
w=input('Introduce la funcion f2: ', 's');
d1=input('Introduce la derivada parcial df1/dx: ','s');
d2=input('Introduce la derivada parcial df1/dy: ','s');
d3=input('Introduce la derivada parcial df2/dx: ','s');
d4=input('Introduce la derivada parcial df2/dy: ','s');
x0=input('Asigna el valor inicial para la variable x: ');
y0=input('Asigna el valor inicial para la variable y: ');
c=input('Indica el número de iteraciones a realizar: ');
it=0;

disp(' i        x0             x1              y0                 y1 ');
while it>c
    x=x0;
    y=y0;
    f1=eval(z);
    f2=eval(w);
    dx1=eval(d1);
    dy1=eval(d2);
    dx2=eval(d3);
    dy2=eval(d4);
    xr=(f1*dy2)-(f2*dy1);
    xw=(dx1*dy2)-(dy1*dx2);
    xt=xr/xw;
    xq=x0-xt;
    yr=y0-(((f2*dx1)-(f1*dx2))/((dx1*dy2)-(dy1*dx2)));        
    fprintf('\n     %3i     %3.6f        %3.6f        %3.6f        %3.6f        \n',it,x1,xq,y1,yr);
    it=it+1;
   end
x0=xq;
y0=yr;
    fprintf('\n\n\n\nLa raíz encontrada para x hasta %d iteración es: %g',c,xq);
    fprintf('\n\n\n\nLa raíz encontrada para y hasta %d iteración es: %g\n\n',c,yr);

fprintf('\n\n Integrantes del Equipo: \n\n Cabrera Coutiño Eduardo \n De los Santos Lara Pedro Jorge \n Méndez Lara José Gustavo \n Mendoza de la Torre Oswaldo \n Molina Espinosa Mario Alfredo \n Niño Vázquez Kevin Alejandro \n')