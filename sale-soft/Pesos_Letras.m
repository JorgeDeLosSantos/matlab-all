clear;clc;
A=num2cell('112');
B=cell2mat(A);
L=length(A);

if L==1
    switch B
        case '1',cad1='uno';
        case '2',cad1='dos'; 
        case '3',cad1='tres';
        case '4',cad1='tres';
        case '5',cad1='tres';
        case '6',cad1='tres';
        case '7',cad1='tres';
        case '8',cad1='tres';
        case '9',cad1='nueve';
        otherwise
            error(' oooh');
    end
end
if L==2
    switch B
        case '10',cad2='diez';
        case '11',cad2='once';
        case '12',cad2='doce';  
        case '13',cad2='trece';
        case '14',cad2='catorce';
        case '15',cad2='quince';
        case '16',cad2='dieceseis';
        case '17',cad2='diecisiete';
        case '18',cad2='dieciocho';
        case '19',cad2='diecinueve';
        otherwise
            cad2='';
    end
end

if L==3
    if B(1)=='1'
        cad3='ciento';
    elseif B(1)=='2'
        cad3='doscientos';
    elseif B(1)=='3'
        cad3='trescientos';
    elseif B(1)=='4'
        cad3='cuatrocientos';
    else
        cad3='';
    end
end


    