function hc = caja(P,dimx,dimy,dimz,C)
% Dibuja caja, especificando el punto inicial y sus dimensiones.
% Descripción de argumentos de entrada:
%       P     -   Punto inicial de la caja (vector de 3 elementos)
%       dimx  -   Longitud en dirección x
%       dimy  -   Longitud en dirección y 
%       dimz  -   Longitud en dirección z
%       C     -   Color, puede ser un vector RGB.
% Ejemplo:
%       >> hc = caja([0 0 0],2,3,4,[1 1 0]);
%       
if nargin==4 % Si no se especifica un color
    C=rand(1,4);
end
set(gca,'NextPlot','add');
M= [0 0 0;
    0 1 0;
    0 1 1;
    0 0 1;
    1 0 0;
    1 1 0;
    1 1 1;
    1 0 1];
K= [1 5 6 2;
    3 4 8 7;
    5 6 7 8;
    1 2 3 4;
    2 3 7 6;
    1 4 8 5];
X(4)=0;
Y(4)=0;
Z(4)=0;
hc(6)=0;
for n=1:6
    for i=1:4
        X(i)=M(K(n,i),1)*dimx+P(1);
        Y(i)=M(K(n,i),2)*dimy+P(2);
        Z(i)=M(K(n,i),3)*dimz+P(3);
    end
    hc(n) = fill3(X,Y,Z,C);
end
view(3);
end