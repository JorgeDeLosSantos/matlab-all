%Método de regla falsa                                                                          UdeG ** 
clear; 
clc; 
fprintf('\nCalculo de la raíz de una ecuacion por método de la regla falsa\n\n'); 
y=input('Dame la función : ','s'); 
xl=input('Dame el intervalo inferior : '); 
xu=input('Dame el intervalo superior : '); 
e=input('Dame el porciento del error : '); 
xi=0; %Valor para error aproximado(val anterior)
ea=100; 
c=0; %Contador iteraciones 
x=xl; %Valor para la funcion
a=eval(y);
x=xu; 
b=eval(y); 
cc=a*b; 
if cc>0 %Comprobacion si existe cambio de signo en el intervalo
    fprintf('\n\nLos intervalos que ha ingresado para hacer el calculo de la raiz\n\n'); 
    fprintf('\nde la ecuacion no son los adecuados por no existir una raíz entre \n\n'); 
    fprintf('\nestos, Ejecute de nuevo el programa, por favor.\n\n'); 
    break 
end 
while ea>e %Mientras el error del proceso es mayor que el error propuesto 
    x=xl;
    fxl=eval(y);
    x=xu;
    fxu=eval(y);
    xr=xu-(fxu*(xl-xu))/((fxl)-(fxu));  
    x=xr; 
    yr=eval(y); 
    ea=abs((xr-xi)/xr)*100; 
    z=fxl*yr; 
    if z<0 
        xu=xr; 
    end
    if z>0
        xl=xr; 
    end
    if z==0
        fprintf('\n\n\n\nLa raíz exacta es: %g',xr) 
        fprintf('\n\nNumero de iteraciones: %g',c); 
        break 
    end
    xi=xr;%Valor anterior
    c=c+1; %Contador de iteraciones
end 
if ea<e
    format long
    fprintf('\n\n\n\nLa raíz exacta es: %g',xr) 
    fprintf('\n\nNumero de iteraciones: %g\n',c); 
end 
