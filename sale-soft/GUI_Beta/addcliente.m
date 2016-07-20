function addcliente

f=figure('NumberTitle','off','MenuBar','none','Name','Agregar cliente','position',...
    [200 200 400 300],'CloseRequestFcn',@cerrar);
whitebg(f,[0.2 0.3 0.2])

et_nombre=uicontrol('style','text','String','NOMBRE: ','position',[10 270 70 20]);
et_rfc=uicontrol('style','text','String','RFC: ','position',[10 230 70 20]);
et_direccion=uicontrol('style','text','String','DIRECCIÓN: ','position',[10 190 70 20]);
et_lugar=uicontrol('style','text','String','LUGAR: ','position',[10 150 70 20]);
et_telefono=uicontrol('style','text','String','TELÉFONO: ','position',[10 110 70 20]);
et_cp=uicontrol('style','text','String','CP: ','position',[10 70 70 20]);

snombre=uicontrol('style','edit','String','','position',[90 270 300 20]);
srfc=uicontrol('style','edit','String','','position',[90 230 300 20]);
sdireccion=uicontrol('style','edit','String','','position',[90 190 300 20]);
slugar=uicontrol('style','edit','String','','position',[90 150 300 20]);
stelefono=uicontrol('style','edit','String','','position',[90 110 300 20]);
scp=uicontrol('style','edit','String','','position',[90 70 300 20]);

regist=uicontrol('style','pushbutton','String','Agregar','fontweight','bold','callback',@agregar,...
    'position',[160 20 80 30]);

    function agregar(hObject,eventdata)
        nombre=get(snombre,'string');
        rfc=get(srfc,'string');
        direccion=get(sdireccion,'string');
        lugar=get(slugar,'string');
        telefono=get(stelefono,'string');
        cp=get(scp,'string');
        if strcmp(nombre,'')==1 | strcmp(rfc,'')==1
            warndlg('Rellene los campos faltantes...','Error');
        else
            datos={nombre,rfc,direccion,lugar,telefono,cp};
            arch=strcat('database/clientes/',nombre,'.dat');
            ID=fopen(arch,'w');
            for i=1:6
                fprintf(ID,'%s\n',datos{:,i});
            end
            fclose(ID);
            msgbox('Agregado con éxito...','Datos');
        end
    end

    function cerrar(src,evnt)
        delete(src);
    end

end