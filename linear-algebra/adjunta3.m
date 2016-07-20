function X = adjunta3(A)
% Calcula la adjunta de una matriz de 3x3
% Entrada:
%         A   -   Matriz de 3x3
% Salida:
%         X   -   Matriz adjunta de A
%
% $ Por: Jorge De Los Santos $
% $ Rev. 1.0.0 $ 12/08/14 $
if size(A,1)~=3 || size(A,2)~=3
    error('Introduzca una matriz de 3x3');
end
MC=zeros(size(A));
idx=1:3;
for i=1:size(A,1)
    for j=1:size(A,2)
        idxf=idx(idx~=i);
        idxc=idx(idx~=j);
        cof=A(idxf,idxc);
        if rem(i+j,2)
            MC(i,j)=-det(cof);
        else
            MC(i,j)=det(cof);
        end
    end
end
X=MC';
end