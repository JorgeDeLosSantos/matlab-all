clear;clc;
a=input('Primer n�mero: ');
b=input('Segundo n�mero: ');
while a>0
    t=a;
    a=rem(b,a);
    b=t;
end
fprintf('\nMCD= %g\n',b);