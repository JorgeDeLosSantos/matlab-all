clear all;clc;
% Leer columnas específicas
nombre_columna='NOMBRE';
[A,B,C]=xlsread('database.xlsx');
s=strfind(B,nombre_columna);
k=0;
for i=1:size(s,2)
    if ~isempty(s{1,i})
        k=k+1;
        pos(k)=i;
    end
end
Nombre=B(:,pos);
