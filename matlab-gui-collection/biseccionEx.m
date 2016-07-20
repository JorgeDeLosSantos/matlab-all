clear all;clc;
f=inline(input('Ingrese una funci�n: ','s'));
xa=input('xa:  ');
xb=input('xb:  ');
nit=input('N�mero de iteraciones: ');
n=0; % Contador de iteraciones
if f(xa)*f(xb)>0
    error('Seleccione otro intervalo');
end
while n <= nit 
    xr=(xa+xb)/2; % Aproximaci�n de la ra�z
    fxa=f(xa);
    fxr=f(xr);
    comp=fxa*fxr; % Comprobaci�n de cambio de signo
    if comp<0
        xb=xr;
    elseif comp>0
        xa=xr;
    else
        break;
    end
    n=n+1;
end
fprintf('Raiz aproximada: %.6f \n',xr);
