function addpropietario

f=figure('NumberTitle','off','MenuBar','none','Name','Datos del Propietario','position',...
    [200 200 400 200],'CloseRequestFcn',@cerrar);
whitebg(f,[0.4 0.8 0.2]);

etnombre=uicontrol('style','text','String','NOMBRE: ','position',[10 160 60 20]);
etrfc=uicontrol('style','text','String','RFC: ','position',[10 120 60 20]);
etcurp=uicontrol('style','text','String','CURP: ','position',[10 80 60 20]);

nombre=uicontrol('style','edit','String','','position',[80 160 300 20]);
rfc=uicontrol('style','edit','String','','position',[80 120 300 20]);
curp=uicontrol('style','edit','String','','position',[80 80 300 20]);

regist=uicontrol('style','pushbutton','String','Registrar','callback',@registrar,...
    'backgroundcolor',[0.8 0.8 0.8],'fontweight','bold','position',[150 30 100 30]);

    function registrar(hObject,eventdata)
        Nombre=get(nombre,'string');
        RFC=get(rfc,'string');
        CURP=get(curp,'String');
        if strcmp(Nombre,'')==1 | strcmp(RFC,'')==1 | strcmp(CURP,'')==1
            warndlg('Rellene los campos faltantes...','Error');
        else
            save('programdata/datosprop.mat','Nombre','RFC','CURP');
            clearvars Nombre RFC CURP
            msgbox('Datos registrados con éxito','Datos');
        end
    end

    function cerrar(src,evnt)
       selection = questdlg('¿Desea salir?',...
          'Salir',...
          'Sí','No','No'); 
       switch selection 
          case 'Sí',
             delete(gcf)
          case 'No'
            return; 
       end
    end

end