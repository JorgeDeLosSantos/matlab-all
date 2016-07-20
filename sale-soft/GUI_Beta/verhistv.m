function verhistv
f = figure('Numbertitle','off','Name','Historial de ventas','menubar','none','Position',[200 200 600 530]);
whitebg(f,[0.2 0.3 0.2])
formato='%s%s%s%s';
delimiter={'/','/'};
fid=fopen('database/hist/hventas.dat','r');
A=textscan(fid,formato,'delimiter',delimiter,'Multipledelimsasone',1);
fclose(fid);

for i=1:4
    for j=1:size(A{1},1)
        datos(i,j)=A{i}(j);
    end
end
datos=datos';

cnames = {'Folio','Cliente','Venta','Fecha'};
cancho={50 280 95 95};
cformato={'numeric' 'char' 'char' 'char'};
htabla= uitable('Parent',f,'Data',datos,'ColumnName',cnames,'Columnwidth',cancho,'ColumnFormat',cformato,'Position',[20 50 560 460]);
export=uicontrol('style','pushbutton','string','Ver datos en Excel','position',[240 10 120 30],'callback',@exportar);

    function exportar(hObject,eventdata)
        datos=get(htabla,'Data');
        save('database/excel/toexcel.mat','datos');
        xlswrite('database/excel/info.xlsx',datos,1,'A2');
        winopen('database/excel/info.xlsx');
    end

end