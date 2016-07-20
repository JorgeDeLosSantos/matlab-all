clear all;clc;
load clientes;
Nombre=char(Nombre);
RFC=char(RFC);
Direccion=char(Direccion);
Lugar=char(Lugar);
CP=char(CP);


for i=1:11
    arch=strcat(Nombre(i,:),'.dat');
    %arch=cell2mat(arch);
    datos={Nombre(i,:),RFC(i,:),Direccion(i,:),Lugar(i,:),CP(i,:)};
    ID=fopen(arch,'w');
    for j=1:5
        fprintf(ID,'%s \n',datos{1,j});   
    end
    fclose(ID);
end
