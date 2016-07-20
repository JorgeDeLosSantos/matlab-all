function x=ffactorial(N)
if N<0
    error('Ingrese un entero positivo');
end
k=1;
x=1;
while k<=N
    x=k*x;
    k=k+1;
end
end