clear all;clc;
[A,B]=xlsread('database.xlsx','Clientes','A:C');
B(1,:)=[];
Nombre=B(:,1);
RFC=B(:,2);
Direccion=B(:,3);
clearvars B;