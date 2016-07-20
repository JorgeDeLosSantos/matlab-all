function XX=lfilt(X,dl,k)
[m,n]=size(X);
XX=X;
for i=1:dl:m
    XX(i,:)=X(i,:)+k;
end
end