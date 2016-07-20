function d = determinante(X)
idx=1:size(X,1);
for k=1:size(X,1)
    if size(X,1)==1
        d=X;
    else
        idxf=idx(idx~=1);
        idxc=idx(idx~=k);
        d(k)=((-1)^(1+k))*X(1,k)*determinante(X(idxf,idxc));
        d=sum(d);
    end
end
end