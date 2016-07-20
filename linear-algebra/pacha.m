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
while it>c
    x=x0;
    y=y0;
    f1=eval(z);
    f2=eval(w);
    dx1=eval(d1);
    dy1=eval(d2);
    dx2=eval(d3);
    dy2=eval(d4);
    xr=x0-(((f1*dy2)-(f2*dy1))/((dx1*dy2)-(dy1*dx2)));
    yr=y0-(((f2*dx1)-(f1*dx2))/((dx1*dy2)-(dy1*dx2)));        
    it=it+1;
    x0=xr;
    y0=yr;
end
fprintf ('\n%d, %d, %d, %d, %d, %d \n',f1, f2, dx1, dy1, dx2, dy2) 