function export2excel
%% Exportar datos de venta

h=waitbar(0,'Exportando datos a Excel, espere un momento...');
formato='%s%s%s%s';
delimiter={'/','/'};
fid=fopen('database/hist/hventas.dat','r');
waitbar(0.1);
A=textscan(fid,formato,'delimiter',delimiter,'Multipledelimsasone',1);
fclose(fid);
waitbar(0.2);
for i=1:4
    for j=1:size(A{1},1)
        datos(i,j)=A{i}(j);
    end
    waitbar(0.3);
end
datos=datos';
waitbar(0.4);
xlswrite('database/excel/info.xlsx',datos,1,'A2');
waitbar(0.5);
%% Exportar datos de clientes
a=dir('database/prodserv/*.dat');
waitbar(0.6);
long=length(a);
for n=1:long
    arch=a(n).name;
    narch=strcat('database/prodserv/',arch);
    ID3=fopen(narch,'r');
    i=1;
    tline = fgetl(ID3);
    while ischar(tline)
        A(i)={tline};
        tline = fgetl(ID3);
        i=i+1;
    end
    fclose(ID3);
    Prod(n,:)=A;
    waitbar(0.7);
end
waitbar(0.8);
waitbar(0.9);
xlswrite('database/excel/info.xlsx',Prod,3,'A2');
    
winopen('database/excel/info.xlsx');        
waitbar(1);
delete(h);
end