function x = mifact(N)
if N<0
    error('Ingrese un entero positivo');
end
if N==0
    x=1;
else
    x=N*mifact(N-1);
end
end