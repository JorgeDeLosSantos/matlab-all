function X = swapcols(A,n1,n2)
X = A;
X(:,n1) = A(:,n2);
X(:,n2) = A(:,n1);
end