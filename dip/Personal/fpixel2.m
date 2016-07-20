function M=qfilt(X,k)
[m,n]=size(X);
for i=1:k:m-k
    for j=1:k:n-k
        S=X(i:i+k-1,j:j+k-1);
        M(i:i+k-1,j:j+k-1)=mean(S(:));
    end
end
M=uint8(M);
end