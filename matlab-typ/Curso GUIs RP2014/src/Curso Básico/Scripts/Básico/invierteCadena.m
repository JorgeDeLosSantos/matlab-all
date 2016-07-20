% Invierte el orden de una frase / palabra insertada
clear all;clc;
cad=input('Ingrese una cadena de texto: ','s');
cadinv=cad(end:-1:1);
fprintf('%s \n',cadinv);