function X = espiralm(n)
odd = 1:2:500;
X = zeros(odd(n));
[xsz,~]= size(X);

for i=n:-1:1
    X(:,[(n+1)-i end-(n-i)])=i;
    X([(n+1)-i end-(n-i)],:)=i;
end
end