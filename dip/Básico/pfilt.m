function XX=pfilt(X,k)
[m,n]=size(X);
i=1;
XX=X;
while i<k
    f=randi([1 m-10]);
    c=randi([1 n-10]);
    XX(f,c)=X(f+10,c+10);
    i=i+1;
end
end