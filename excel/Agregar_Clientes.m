clear all;clc;
n=input('Nombre: ','s');
rfc=input('RFC: ','s');
direc=input('Dirección ','s');
ToExp={n,rfc,direc};
[A,B]=xlsread('database.xlsx','Clientes','A:A');
dim=num2str(length(B)+1);
rango=strcat('A',dim,':C',dim);
xlswrite('database.xlsx',ToExp,'Clientes',rango);

