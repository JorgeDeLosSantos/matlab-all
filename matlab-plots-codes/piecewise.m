function h=piecewise(F,I,x)
% Grafica una función definida a trozos
% Argumentos de entrada:
%          F  -  Cell array de funciones
%          I  -  Cell array de condiciones/intervalos
%          x  -  Intervalo en el cual se grafica
% Ejemplo:
%          >> F={'-x','x'};
%          >> I={'x<0','x>0'};
%          >> x=-5:0.1:5;
%          >> piecewise(F,I,x);
% La función devuelve como salida los handles de cada
% una de las gráficas, con el cual podrá modificar las
% propiedades como el color, estilo, etc.
%
% $ Por: Jorge De Los Santos $
% $ E-mail: delossantosmfq@gmail.com $
% $ Rev. 1.0.0 $ $ Fecha: 02/05/2014 $

if length(F)~=length(I)
    error('Argumentos de entrada inválidos');
end
set(gca,'NextPlot','add');
for i=1:length(F)
    xe=x(eval(I{i}));
    h(i)=plot(xe,subs(F{i},'x',xe));
end
end