a=input ('dime un número=   ');
b=input ('dime otro número=  ');
p=input ('¿Que deseas hacer? sumar=1, restar=2, multiplicar=3, dividir=4, todas las anteriores=5   :     ');
suma=a+b;
resta=a-b;
multiplicacion=a*b;
division=a/b;
if p==1;
    fprintf ('suma= %d + %d = %d \n', a, b, suma);
end
if p==2;
    fprintf ('resta= %d - %d = %d \n', a, b, resta);
end
if p==3;
    fprintf ('multiplicacion= %d * %d = %d \n', a, b, multiplicacion);
end
if p==4;
   fprintf ('division= %1.2f / %1.2f = %1.2f \n', a, b, division);
end
if p==5;
    fprintf ('suma= %d + %d = %d \n', a, b, suma);
    fprintf ('resta= %d - %d = %d \n', a, b, resta);
    fprintf ('multiplicacion= %d * %d = %d \n', a, b, multiplicacion);
    fprintf ('division= %1.2f / %1.2f = %1.2f \n', a, b, division);
end