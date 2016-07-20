function addprodserv

f=figure('NumberTitle','off','MenuBar','none','Name','Agregar producto/servicio','position',...
    [200 200 400 150],'CloseRequestFcn',@cerrar);

etdesc=uicontrol('style','text','String','DESCRIPCIÓN: ','position',[10 120 70 20]);
etprecio=uicontrol('style','text','String','PRECIO: ','position',[10 80 70 20]);

desc=uicontrol('style','edit','String','','position',[90 120 300 20]);
prec=uicontrol('style','edit','String','','position',[90 80 300 20]);

regist=uicontrol('style','pushbutton','String','Agregar','callback',@agregar,...
    'position',[160 35 80 30]);

    function agregar(hObject,eventdata)
        descrip=get(desc,'string');
        precio=get(prec,'string');
        if strcmp(descrip,'')==1 | strcmp(precio,'')==1
            warndlg('Rellene los campos faltantes...','Error');
        else
            datos={descrip,precio};
            arch=strcat(descrip,'.dat');
            ID=fopen(arch,'w');
            for i=1:2
                fprintf(ID,'%s \n',datos{:,i});
            end
            fclose(ID);
            msgbox('Agregado con éxito...','Datos');
            set(desc,'string','');
            set(prec,'string','');
        end
    end

    function cerrar(src,evnt)
        delete(src);
    end

end