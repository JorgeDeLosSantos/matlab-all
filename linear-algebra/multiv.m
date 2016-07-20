clear all;
clc;
fprintf('C�lculo de ra�ces por el metodo de Newton-Raphson multivariable\n\n');
z=input('Introduce la funcion f1: ', 's');
w=input('Introduce la funcion f2: ', 's');
d1=input('Introduce la derivada parcial df1/dx: ','s');
d2=input('Introduce la derivada parcial df1/dy: ','s');
d3=input('Introduce la derivada parcial df2/dx: ','s');
d4=input('Introduce la derivada parcial df2/dy: ','s');
x0=input('Asigna el valor inicial para la variable x: ');
y0=input('Asigna el valor inicial para la variable y: ');
e=input('Indica el n�mero de iteraciones a realizar: ');
c=0;
ea=100;
fprintf('\n\n Iteraci�n no.       xi          xi+1          yi          yi+1\n');
while c>e;
    x=x0;
    y=y0;
    f1=eval(z);
    f2=eval(w);
    dx1=eval(d1);
    dy1=eval(d2);
    dx2=eval(d3);
    dy2=eval(d4);
    x1=x0-(((f1*dy2)-(f2*dy1))/((dx1*dy2)-(dy1*dx2)));
    y1=y0-(((f2*dx1)-(f1*dx2))/((dx1*dy2)-(dy1*dx2)));
    ea=sqrt ((x1-x0)^2+(y1-y0)^2);
    fprintf ('\n\n\n      %d            %1.5f             %g           %1.5f            %1.5f\n\n\n', it, x0, x1, y0, y1);
    x0=x1;%Valor anterior
    y0=y1;%Valor anterior
    it=it+1;%Contador de iteraciones
end
format short
fprintf('\nLa ra�z encontrada para x hasta %g iteraci�n es: %g\n',e,x1);
fprintf('\n\n\n\nLa ra�z encontrada para y hasta %d iteraci�n es: %1.5f\n\n\n',e,y1);
fprintf('\n\n Integrantes del Equipo: \n\n Cabrera Couti�o Eduardo \n De los Santos Lara Pedro Jorge \n M�ndez Lara Jos� Gustavo \n Mendoza de la Torre Oswaldo \n Molina Espinosa Mario Alfredo \n Ni�o V�zquez Kevin Alejandro \n')