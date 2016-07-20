function g11_DemoMenu
f = figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Demo Men�',...
    'Position',[0 0 300 200]);
centerfig(f);

% Men� archivo
menu_archivo = uimenu(f,'Label','Archivo');
uimenu(menu_archivo,'Label','Abrir',...
    'Accelerator','A',...
    'Callback',@abrir_fcn);
uimenu(menu_archivo,'Label','Salir',...
    'Callback','close(gcf)');

% Men� herramientas
menu_herramientas = uimenu(f,'Label','Herramientas');
uimenu(menu_herramientas,'Label','Opci�n 1');
hOp2 = uimenu(menu_herramientas,'Label','Opci�n 2',...
    'Separator','on');
uimenu(hOp2,'Label','Opci�n 2.1'); % Sub-men�s 
uimenu(hOp2,'Label','Opci�n 2.2');
uimenu(hOp2,'Label','Opci�n 2.3');
uimenu(menu_herramientas,'Label','Opci�n 3',...
    'Separator','on');

% Men� ayuda
menu_ayuda = uimenu(f,'Label','Ayuda');
uimenu(menu_ayuda,'Label','Ayuda',...
    'Callback',@ayuda_fcn);
uimenu(menu_ayuda,'Label','Acerca de...',...
    'Callback',@acerca_fcn);

    function abrir_fcn(~,~)
        [filename, pathname] = uigetfile('*.*', 'Seleccione un archivo');
        if isequal(filename,0) || isequal(pathname,0)
            % Si presiona "Cancelar" se aborta la ejecuci�n en este punto.
            return;
        else
            archivo = fullfile(pathname, filename); % Ruta absoluta del
                                                    % archivo
            try
                % Abrir archivo en el programa por 'default'
                open(archivo);
            catch %#ok<CTCH>
                errordlg('Archivo no encontrado');
            end
        end
    end

    function ayuda_fcn(~,~)
        helpdlg({'Esto es la secci�n de ayuda <bla bla bla bla>.',
            'Desde luego que los bla podr�an remplazarse por algo',
            'm�s descriptivo, o bien por un enlace a un archivo',
            'de ayuda externo.'});
    end

    function acerca_fcn(~,~)
        helpdlg({'Demo Menu 0.0.1','','MATLAB TYP'});
    end
end