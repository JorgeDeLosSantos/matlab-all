function vistaprevia
global vdescripcion vcantidad vpuni vimporte vcont
f = figure('Numbertitle','off','Name','Vista previa de venta','menubar','none','Position',[150 150 700 500]);
whitebg(f,[0.2 0.3 0.2])

if ~isempty(vdescripcion)

for i=1:vcont-1
    a{i}=cur2str(vpuni{i});
    b{i}=cur2str(vimporte{i});
end

datos=[vcantidad(:,:)',vdescripcion(:,:)',a',b'];

cnames = {'Cantidad','Descripción','Precio Unitario','Importe'};
cancho={100 310 110 120};
cformato={'char' 'char' 'char' 'char'};
htabla= uitable('Parent',f,'Data',datos,'ColumnName',cnames,'Columnwidth',cancho,'ColumnFormat',cformato,'Position',[10 100 680 390]);

suma=sum(cell2mat(vimporte));
s_tot=cur2str(suma);
txt=uicontrol(f,'style','text','String','Total: ','position',[200 50 100 20]);
total=uicontrol(f,'style','text','String',s_tot,'position',[320 50 100 20]);

else
   msgbox('Datos no disponibles');
end

end