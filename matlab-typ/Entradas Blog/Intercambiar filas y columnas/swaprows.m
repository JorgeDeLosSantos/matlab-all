function X = swaprows(A,m1,m2)
X = A;
X(m1,:) = A(m2,:);
X(m2,:) = A(m1,:);
end