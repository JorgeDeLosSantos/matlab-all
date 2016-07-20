function varargout = inecgraf(I,R)
% Grafica una desigualdad (inecuación) en un rango
% especificado.
%
% Argumentos de entrada:
%            I    -   Inecuación
%            R    -   Rango en el cual se trazará la
%                     gráfica.
%
% Argumentos de salida:
%            h    -   Si se especifica un argumento
%                     salida, la función devuelve un
%                     array de handles que le permite
%                     modificar las propiedades de la
%                     gráfica de salida. (Véase ejemplos).
%
% Ejemplos:
%           >> inecgraf('x.^2+y.^2<10',[-5 5]);
%           >> h = inecgraf('y<x+3',[0 10]);
%           >> set(h,'color','r','MarkerSize',5);
%
% $ Por: Jorge De Los Santos $
% $ Rev. 1.0 $ Fecha: 06/05/14 $

set(gca,'NextPlot','add');
axis([R(1) R(2) R(1) R(2)]);
dd=(R(2)-R(1))/50;
[x,y]=meshgrid(R(1):dd:R(2));
[f,c]=find(eval(I));
h=zeros(1,length(f));
for i=1:length(f)
        h(i)=plot(x(f(i),c(i)),y(f(i),c(i)),'b*','MarkerSize',2);
end
if nargout==1
    varargout{1}=h;
end
end
