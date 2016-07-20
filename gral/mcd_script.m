clear;clc;
a=input('Primer número: ');
b=input('Segundo número: ');
while a>0
    t=a;
    a=rem(b,a);
    b=t;
end
fprintf('\nMCD= %g\n',b);