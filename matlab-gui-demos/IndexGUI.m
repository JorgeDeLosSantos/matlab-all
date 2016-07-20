function IndexGUI
figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','GUIs',...
    'Position',[0 0 350 200]);
centerfig();

% ========  MENU =========
hM = uimenu(gcf,'Label','Ayuda');
uimenu(hM,'Label','Ayuda','Callback','winopen(''html/Contenido.html'')');
uimenu(hM,'Label','Acerca de...','Callback',@acerca);
% ========================

GUIS=dir('g*.m');
GUIS = struct2cell(GUIS);
GUIS = GUIS(1,:); % Extraer nombres

hLB = uicontrol('style','listbox',...
    'Units','Normalized',...
    'String',GUIS,...
    'Position',[0.01 0.2 0.98 0.76]);

uicontrol('style','push',...
    'Units','Normalized',...
    'String','Ver descripción',...
    'Position',[0.02 0.03 0.28 0.12],...
    'Callback',@ver_descrip,...
    'ForeG','b');
uicontrol('style','push',...
    'Units','Normalized',...
    'String','Ver código',...
    'Position',[0.36 0.03 0.28 0.12],...
    'Callback',@ver_codigo,...
    'ForeG','b');
uicontrol('style','push',...
    'Units','Normalized',...
    'String','Abrir',...
    'Position',[0.7 0.03 0.28 0.12],...
    'Callback',@abrir_gui,...
    'ForeG','b');

    function ver_descrip(~,~)
        strs = get(hLB,'String');
        k = get(hLB,'Value');
        h=waitbar(0,'Generando documentación');
        doc(strs{k});
        waitbar(1,h);
        delete(h);
    end

    function ver_codigo(~,~)
        strs = get(hLB,'String');
        k = get(hLB,'Value');
        edit(strs{k});
    end

    function abrir_gui(~,~)
        strs = get(hLB,'String');
        k = get(hLB,'Value');
        try 
            run(strs{k});
        catch %#ok<CTCH>
            errordlg('Archivo no encontrado');
        end
    end

    function acerca(~,~)
        msg_str = {'Versión: 0.0.1','','(c) 2014   -  MATLAB TYP'};
        helpdlg(msg_str,'Acerca de...');
    end

end