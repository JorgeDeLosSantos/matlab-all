function M = fpixel(X,k)
[m,n,~]=size(X);
NX = zeros(size(X));
%k = 20;
for i=1:k:m-k
    for j=1:k:n-k
        NX(i:i+k-1,j:j+k-1,1)=mean(mean(X(i:i+k-1,j:j+k-1,1)));
        NX(i:i+k-1,j:j+k-1,2)=mean(mean(X(i:i+k-1,j:j+k-1,2)));
        NX(i:i+k-1,j:j+k-1,3)=mean(mean(X(i:i+k-1,j:j+k-1,3)));
    end
end
M = uint8(NX);
end