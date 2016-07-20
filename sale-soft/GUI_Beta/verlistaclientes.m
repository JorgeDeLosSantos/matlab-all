function verlistaclientes
f = figure('Numbertitle','off','Name','Lista de Clientes','menubar','none','Position',[200 200 800 530]);
whitebg(f,[0.2 0.3 0.2])

a=dir('database/clientes/*.dat');
long=length(a);
for n=1:long
    St=cellstr(a(n).name);
    arch=cell2mat(strcat('database/clientes/',St));
    fid=fopen(arch,'r');
    i=1;
    tline = fgetl(fid);
    while ischar(tline)
        A(i,n)={tline};
        tline = fgetl(fid);
        i=i+1;
    end
    fclose(fid);
end
datos=A';

cnames = {'Nombre','RFC','Direccion','Lugar','Teléfono','C.P.'};
cancho={200 90 200 120 80 50};
cformato={'char' 'char' 'char' 'char' 'char' 'char'};
htabla= uitable('Parent',f,'Data',datos,'ColumnName',cnames,'Columnwidth',cancho,'ColumnFormat',cformato,'Position',[10 50 780 460]);

end