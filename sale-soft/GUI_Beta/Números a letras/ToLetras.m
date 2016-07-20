function PLetra=ToLetras(precio)
n=num2cell(num2str(round(precio)));
dim=length(n);
c=precio-floor(precio);
c=num2str(roundn(c,-2));
for k=1:100
    s=strcat(num2str(k/100));
    cent=strcat(num2str(k),'/100 M.N.');
    if strcmp(c,s)==1,break,end;
end
%% 1D
if dim==1
    uni=cell2mat(n(1));
    switch uni
        case '0',cad1='CERO';
        case '1',cad1='UN';
        case '2',cad1='DOS';
        case '3',cad1='TRES';
        case '4',cad1='CUATRO';
        case '5',cad1='CINCO';
        case '6',cad1='SEIS';
        case '7',cad1='SIETE';
        case '8',cad1='OCHO';
        case '9',cad1='NUEVE';
    end
    PLetra=horzcat(cad1,' PESOS ',cent);
end
%% 2D
if dim==2
    uni=cell2mat(n(2));
    dec=cell2mat(n(1));
    switch uni
        case '0',cad1='';
        case '1',cad1='Y UN';
        case '2',cad1='Y DOS';
        case '3',cad1='Y TRES';
        case '4',cad1='Y CUATRO';
        case '5',cad1='Y CINCO';
        case '6',cad1='Y SEIS';
        case '7',cad1='Y SIETE';
        case '8',cad1='Y OCHO';
        case '9',cad1='Y NUEVE';
    end
    switch dec
        case '0',cad2='';
        case '1',cad2='DIEZ';
        case '2',cad2='VEINTE';
        case '3',cad2='TREINTA';
        case '4',cad2='CUARENTA';
        case '5',cad2='CINCUENTA';
        case '6',cad2='SESENTA';
        case '7',cad2='SETENTA';
        case '8',cad2='OCHENTA';
        case '9',cad2='NOVENTA';
    end
    PLetra=horzcat(cad2,' ',cad1,' PESOS ',cent);
end
%% 3D
if dim==3
    uni=cell2mat(n(3));
    dec=cell2mat(n(2));
    cen=cell2mat(n(1));
    switch uni
        case '0',cad1='';
        case '1',cad1='Y UN';
        case '2',cad1='Y DOS';
        case '3',cad1='Y TRES';
        case '4',cad1='Y CUATRO';
        case '5',cad1='Y CINCO';
        case '6',cad1='Y SEIS';
        case '7',cad1='Y SIETE';
        case '8',cad1='Y OCHO';
        case '9',cad1='Y NUEVE';
    end
    switch dec
        case '0',cad2='';
        case '1',cad2='DIEZ';
        case '2',cad2='VEINTE';
        case '3',cad2='TREINTA';
        case '4',cad2='CUARENTA';
        case '5',cad2='CINCUENTA';
        case '6',cad2='SESENTA';
        case '7',cad2='SETENTA';
        case '8',cad2='OCHENTA';
        case '9',cad2='NOVENTA';
    end
    switch cen
        case '0',cad3='';
        case '1',cad3='CIENTO';
        case '2',cad3='DOSCIENTOS';
        case '3',cad3='TRESCIENTOS';
        case '4',cad3='CUATROCIENTOS';
        case '5',cad3='QUINIENTOS';
        case '6',cad3='SEISCIENTOS';
        case '7',cad3='SETECIENTOS';
        case '8',cad3='OCHOCIENTOS';
        case '9',cad3='NOVECIENTOS';
    end
    PLetra=horzcat(cad3,' ',cad2,' ',cad1,' PESOS ',cent);
end
%% 4D
if dim==4
    uni=cell2mat(n(4));
    dec=cell2mat(n(3));
    cen=cell2mat(n(2));
    mil=cell2mat(n(1));
    switch uni
        case '0',cad1='';
        case '1',cad1='Y UN';
        case '2',cad1='Y DOS';
        case '3',cad1='Y TRES';
        case '4',cad1='Y CUATRO';
        case '5',cad1='Y CINCO';
        case '6',cad1='Y SEIS';
        case '7',cad1='Y SIETE';
        case '8',cad1='Y OCHO';
        case '9',cad1='Y NUEVE';
    end
    switch dec
        case '0',cad2='';
        case '1',cad2='DIEZ';
        case '2',cad2='VEINTE';
        case '3',cad2='TREINTA';
        case '4',cad2='CUARENTA';
        case '5',cad2='CINCUENTA';
        case '6',cad2='SESENTA';
        case '7',cad2='SETENTA';
        case '8',cad2='OCHENTA';
        case '9',cad2='NOVENTA';
    end
    switch cen
        case '0',cad3='';
        case '1',cad3='CIENTO';
        case '2',cad3='DOSCIENTOS';
        case '3',cad3='TRESCIENTOS';
        case '4',cad3='CUATROCIENTOS';
        case '5',cad3='QUINIENTOS';
        case '6',cad3='SEISCIENTOS';
        case '7',cad3='SETECIENTOS';
        case '8',cad3='OCHOCIENTOS';
        case '9',cad3='NOVECIENTOS';
    end
    switch mil
        case '0',cad4='';
        case '1',cad4='MIL';
        case '2',cad4='DOS MIL';
        case '3',cad4='TRES MIL';
        case '4',cad4='CUATRO MIL';
        case '5',cad4='CINCO MIL'
        case '6',cad4='SEIS MIL';
        case '7',cad4='SIETE MIL';
        case '8',cad4='OCHO MIL';
        case '9',cad4='NUEVE MIL';
    end
    PLetra=horzcat(cad4,' ',cad3,' ',cad2,' ',cad1,' PESOS ',cent);
end

%% Correcciones
if dim>1 & strcmp(n(dim-1),'1')==1 & strcmp(n(dim),'0')==0
     switch cell2mat(n(dim))
        case '1',cade1='ONCE';
        case '2',cade1='DOCE';
        case '3',cade1='TRECE';
        case '4',cade1='CATORCE';
        case '5',cade1='QUINCE';
        case '6',cade1='DIECISEIS';
        case '7',cade1='DIECISIETE';
        case '8',cade1='DIECIOCHO';
        case '9',cade1='DIECINUEVE';
    end
    switch dim
        case 2
            PLetra=horzcat(cade1,' PESOS ',cent);
        case 3
            PLetra=horzcat(cad3,' ',cade1,' PESOS ',cent);
        case 4
            PLetra=horzcat(cad4,' ',cad3,' ',cade1,' PESOS ',cent);
    end
end
if precio==100,PLetra=horzcat('CIEN',' PESOS ',cent);
if dim>2 & strcmp(n(dim-2),'1')==1 & strcmp(n(dim-1),'0')==1 & strcmp(n(dim),'0')==0
     switch cell2mat(n(dim))
        case '1',cade2='UN';
        case '2',cade2='DOS';
        case '3',cade2='TRES';
        case '4',cade2='CUATRO';
        case '5',cade2='CINCO';
        case '6',cade2='SEIS';
        case '7',cade2='SIETE';
        case '8',cade2='OCHO';
        case '9',cade2='NUEVE';
     end
     switch dim
        case 3
            PLetra=horzcat(cad3,' ',cade2,' PESOS ',cent);
        case 4
            PLetra=horzcat(cad4,' ',cad3,' ',cade2,' PESOS ',cent);
     end
end

end



