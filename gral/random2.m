function X = random2(dim,k1,k2)
X=rand(dim);
X(X(:)>0.5)=k1;
X(X(:)<0.5 & X(:)~=k1)=k2;
end
    