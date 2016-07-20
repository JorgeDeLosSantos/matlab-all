for i=1:100
    for j=1:100
        if isprime(i)==1
            A(i,j)=1;
        else
            A(i,j)=0;
        end
    end
end
imshow(A);