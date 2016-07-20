function secuenciaED
b(n+1)=0;
a(n)=0;
for i=1:n
    if i<n
        a(i)=input(sprintf('Valor de a%d',i));
        b(i)=input(sprintf('Valor de b%d',i-1));
    else
        b(i)=input(sprintf('Valor de b%d',i-1));
    end 
    B(i)=
end