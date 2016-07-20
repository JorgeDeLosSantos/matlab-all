function M = fdesord(X)
[m,n]=size(X);
M=zeros(size(X),'uint8');
for i=1:m
    for j=1:n
        f=randi(m);
        c=randi(n);
        M(i,j,1)=X(f,c,randi(3));
    end
end
end