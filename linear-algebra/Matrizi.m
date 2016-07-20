clear; 
clc; 
fprintf('Dame la matriz a la que le quieres calcular la inversa\n') 
f=input('cuantas filas:  '); 
c=input('cuantas columnas:'  ); 
  
 
for k=1:c 
  for j=1:f 
 fprintf('fila %x ',j)   
    fprintf('columna %x',k) 
    r=input('\nAsigne el valor:   '); 
    a(j,k)=r; 
    j=j+1; 
  end 
  k=k+1; 
end 
a 
b=a; 
 
fprintf('Dame la matriz identidad del mismo grado que la matriz anterio\n\n') 
for k=k:c*2 
  for j=1:f 
    fprintf('fila %x ',j)   
    fprintf('columna %x',k) 
    r=input('\nAsigne el valor:   '); 
    a(j,k)=r; 
    j=j+1; 
  end 
  k=k+1; 
end 
a 
  
for k=1:c 
  a(k,:)=a(k,:)/a(k,k); 
    for j=k+1:f 
    a(j,:)=a(j,:)-a(k,:)*a(j,k); 
    j=j+1; 
    a 
  end 
  k=k+1; 
  a 
end 


for k=f:-1:2 
  for j=k-1:-1:1 
    a(j,:)=a(j,:)-a(k,:)*a(j,k); 
    j=j-1; 
    a 
  end 
  k=k-1; 
  a 
end 
 
fprintf('calculo la inversa para comprobar directo con matlab\n') 
c=inv(b); 
c 
fprintf '\n Integrantes del equipo:\n\n Eduardo Coutiño Cabrera \n Pedro Jorge De Los Santos Lara \n José Gustavo Méndez Lara \n Oswaldo Mendoza De la Torre \n Mario Alfredo Molina Espinosa \n Kevin Alejandro Niño Vázquez \n'