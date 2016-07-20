fprintf('\n calculo de las raices por el metodo de newton-raphson multivariable \n')
f1=input('dame la primera funcion: ','s');
f2=input('dame la segunda funcion: ','s');
x1=input('dame el valor de x: ');
y1=input('dame el valor de y: ');
a=input('dame la derivada de la primera funcion con respecto a x: ','s');
b=input('dame la derivada de la primera funcion con respecto a y: ','s');
c=input('dame la derivada de la segunda funcion con respecto a x: ','s');
d=input('dame la derivada de la segunda funcion con respecto a y: ','s');
e=input('dame el valor minimo de la distancia: ');
ea=1;
it=1;
x=x1;
y=y1;
fprintf('\n     it        x1             x2             y1             y2             |x2-x1|    \n');
while ea>e
    x=x1;
    y=y1;
    n=eval(f1);
    o=eval(f2);
    p=eval(a);
    q=eval(b);
    r=eval(c);
    s=eval(d);
    x2=x1-(((n*s)-(o*q))/((p*s)-(q*r)));
    y2=y1-(((o*p)-(n*r))/((p*s)-(q*r)));
    ea=sqrt((x2-x1)^2+(y2-y1)^2);
    fprintf('\n     %3i     %3.6f        %3.6f        %3.6f        %3.6f        %3.6f    \n',it,x1,x2,y1,y2,ea);
    x1=x2;
    y1=y2;
    it=it+1;
end

    fprintf('\n\n\n La raiz exacta en x es: %3.6f' , x2);
    fprintf('\n La raiz exacta en y es: %3.6f\n' , y2);
    
   