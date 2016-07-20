function res=num2letras(cantidad)
% $ Autor: Jorge De Los Santos $
% Ejemplo:  
% >> C=num2letras(2143.45)
% C = 
% DOS MIL CIENTO CUARENTA Y TRES PESOS 45/100 M.N.

if ~isnumeric(cantidad)
    error('Inserte un valor numérico');
elseif cantidad > 10^6-1
    error('Inserte un valor menor a 1000000');
end
uni={'','UN','DOS','TRES','CUATRO','CINCO','SEIS','SIETE','OCHO','NUEVE'};
unisp={'DIEZ','ONCE','DOCE','TRECE','CATORCE','QUINCE','DIECISEIS','DIECISIETE','DIECIOCHO','DIECINUEVE'};
dec={'','DIEZ','VEINTE','TREINTA','CUARENTA','CINCUENTA','SESENTA','SETENTA','OCHENTA','NOVENTA'};
decsp={'VEINTE','VEINTIUN','VEINTIDOS','VEINTITRES','VEINTICUATRO','VEINTICINCO','VEINTISÉIS','VEINTISIETE','VIENTIOCHO','VEINTINUEVE'};
cen={'','CIENTO','DOSCIENTOS','TRESCIENTOS','CUATROCIENTOS','QUINIENTOS','SEISCIENTOS','SETECIENTOS','OCHOCIENTOS','NOVECIENTOS'};
N=floor(cantidad);
S=num2str(N);
L=length(S);
if N<10
    res=getuni(num2str(N));
elseif N>9 & N<100
    if S(L-1)=='1';
        res=horzcat(getdec(num2str(N)),getuni(num2str(N)));
    elseif S(L-1)=='2'
        res=horzcat(getdec(num2str(N)));
    elseif S(L)=='0'
        res=horzcat(getdec(num2str(N)),' ',getuni(num2str(N)));
    else
        res=horzcat(getdec(num2str(N)),' Y ',getuni(num2str(N)));
    end
elseif N>99 & N<1000
    if S(L-1)=='1'
        res=horzcat(getcen(num2str(N)),' ',getdec(num2str(N)),' ',getuni(num2str(N)));
    elseif S(L-1)=='2'
        res=horzcat(getcen(num2str(N)),' ',getdec(num2str(N)));
    elseif S(L-1)=='0' | S(L)=='0'
        res=horzcat(getcen(num2str(N)),' ',getdec(num2str(N)),' ',getuni(num2str(N)));
    else
        res=horzcat(getcen(num2str(N)),' ',getdec(num2str(N)),' Y ',getuni(num2str(N)));
    end
elseif N>999 & N<1000000
     if S(L-1)=='1'
        res=horzcat(getmil(num2str(N)),' MIL ',getcen(num2str(N)),' ',getdec(num2str(N)));
     elseif S(L-1)=='2'
        res=horzcat(getmil(num2str(N)),' MIL ',getcen(num2str(N)),' ',getdec(num2str(N)));
     elseif S(L-1)=='0' | S(L)=='0'
         res=horzcat(getmil(num2str(N)),' MIL ',getcen(num2str(N)),' ',getdec(num2str(N)),' ',getuni(num2str(N)));
     else
        res=horzcat(getmil(num2str(N)),' MIL ',getcen(num2str(N)),' ',getdec(num2str(N)),' Y ',getuni(num2str(N)));
     end
end


    function u=getuni(num)
        if str2num(num)>9 & num(length(num)-1)=='1'
                u='';
        else
            uu=num(length(num));
            u=cell2mat(uni(str2num(uu)+1));
        end
    end
    function d=getdec(num)
        dd=num(length(num)-1);
        ddu=num(length(num));
        if dd=='1'
            d=cell2mat(unisp(str2num(ddu)+1));
        elseif dd=='2'
            d=cell2mat(decsp(str2num(ddu)+1));
        else
            d=cell2mat(dec(str2num(dd)+1));
        end
    end
    function c=getcen(num)
        if str2num(num)==100 || (num(length(num))=='0'&num(length(num)-1)=='0'&num(length(num)-2)=='1'),c='CIEN';
        else
        cc=num(length(num)-2);
        c=cell2mat(cen(str2num(cc)+1));
        end
    end
    function m=getmil(num)
        for i=1:length(num)-3
            B(i)=num(i);
        end
        l=length(B);
        A=str2num(B);
        if A<10
            m=getuni(num2str(A));
        elseif A>9 & A<100
            if B(l-1)=='1';
                m=horzcat(getdec(num2str(A)),getuni(num2str(A)));
            elseif B(l-1)=='2'
                m=horzcat(getdec(num2str(A)));
            elseif B(l)=='0'
                m=horzcat(getdec(num2str(A)),' ',getuni(num2str(A)));
            else
                m=horzcat(getdec(num2str(A)),' Y ',getuni(num2str(A)));
            end
        elseif A>99 & A<1000
            if B(l-1)=='1'
                m=horzcat(getcen(num2str(A)),' ',getdec(num2str(A)));
            elseif B(l-1)=='2'
                m=horzcat(getcen(num2str(A)),' ',getdec(num2str(A)));
            elseif B(l-1)=='0' | B(l)=='0'
                m=horzcat(getcen(num2str(A)),' ',getdec(num2str(A)),' ',getuni(num2str(A)));
            else
                m=horzcat(getcen(num2str(A)),' ',getdec(num2str(A)),' Y ',getuni(num2str(A)));
            end
        end
    end

%% Parte fraccionaria
c=cantidad-floor(cantidad);
c=num2str(roundn(c,-2));
for k=1:100
    s=strcat(num2str(k/100));
    cent=strcat(num2str(k),'/100 M.N.');
    if strcmp(c,s)==1,break,end;
end

res=horzcat(res,' PESOS ',cent); % Conversión final
end