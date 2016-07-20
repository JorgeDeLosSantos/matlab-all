clear all;clc;
A=[1 2 -1;0 1 2;5 1 1];
MC=zeros(size(A)); % Matriz de cofactores
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
ADJ=MC'
