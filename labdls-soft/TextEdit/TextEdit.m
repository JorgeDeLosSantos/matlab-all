function TextEdit
% Editor de texto sin formato
% 
%    
%    ##################################
%
%    EN REVISIÓN    
%
%    ##################################
%
%
% $ Por: Jorge De Los Santos $
% $ E-mail: delossantosmfq@gmail.com $
% $ Blog: http://matlab-typ.blogspot.mx $
% $ Rev. 0.0.1 $ 02/08/2014 $

global ARCHIVO;
ARCHIVO='';
hF=figure('MenuBar','none','NumberTitle','off',...
    'Name','TextEdit','Resize','on',...
    'Position',[0 0 600 400],'Color','w');
centerfig();

% Menú Archivo
hMA=uimenu(hF,'Label','Archivo');
uimenu(hMA,'Label','Abrir','Callback',@abrir);
uimenu(hMA,'Label','Guardar','Callback',@guardar);
uimenu(hMA,'Label','Salir','Callback',@salir);

% Menú Edición
hME=uimenu(hF,'Label','Edición');
uimenu(hME,'Label','Copiar','Callback',@copiar);
uimenu(hME,'Label','Pegar','Callback',@pegar);
uimenu(hME,'Label','Borrar','Callback',@borrar);
uimenu(hME,'Label','Color de fuente','Callback',@colorFuente);
uimenu(hME,'Label','Modificar fuente','Callback',@modificarFuente);
h_AT=uimenu(hME,'Label','Alinear texto');
uimenu(h_AT,'Label','Izquierda','Callback',@alinear);
uimenu(h_AT,'Label','Derecha','Callback',@alinear);
uimenu(h_AT,'Label','Centrado','Callback',@alinear);

% Menú Run
hMH=uimenu(hF,'Label','Herramientas');
uimenu(hMH,'Label','Run as Python','Callback',@runpy)
uimenu(hMH,'Label','Run as Java','Callback',@runjava)
uimenu(hMH,'Label','Run as C++','Callback',@runcpp)

% Menú Seleccionar tema
hMT=uimenu(hF,'Label','Seleccionar tema');
uimenu(hMT,'Label','Blue','Callback',@tema);
uimenu(hMT,'Label','Classic','Callback',@tema);
uimenu(hMT,'Label','Cool','Callback',@tema);
uimenu(hMT,'Label','Dark','Callback',@tema);
uimenu(hMT,'Label','Silver','Callback',@tema);

% Menú Seleccionar idioma (Future Release)

% Menú Ayuda
hMA=uimenu(hF,'Label','Ayuda');
uimenu(hMA,'Label','Ayuda','Callback',@ayuda);
uimenu(hMA,'Label','Acerca de...','Callback',@acercade);

% Editor 
hTxt=uicontrol('style','edit','String','',...
    'Units','Normalized','Position',[0 0 1 1],...
    'BackgroundColor','w','Horizontal','left',...
    'Max',1000,'FontSize',10,'FontName','Arial');

% =========================== FUNCIONES ================================

% Abre un archivo sin formato *.txt 
    function abrir(~,~)
        [arch,ruta] = uigetfile('*.txt', 'Seleccione un archivo de texto');
        if isequal(arch,0) || isequal(ruta,0)
            return; % Cancelar
        else
            fid=fullfile(ruta,arch);
            txt=fileread(fid);
            set(hTxt,'String',txt);
        end
        ARCHIVO=fid; % Para "ejecutar" código
    end

% Guarda el contenido actual en un archivo *.txt
    function guardar(~,~)
        txt=get(hTxt,'String');
        [arch, ruta] = uiputfile('*.txt', 'Guardar');
        if isequal(arch,0) || isequal(ruta,0)
            return;
        else
            fid=fopen(fullfile(ruta,arch),'wt');
            for i=1:size(txt,1)
                fprintf(fid,'%s\n',txt(i,:));
            end
            fclose(fid);
        end
    end

% Cierra la interfaz (aplicación)
    function salir(~,~)
        close(gcf);
    end

% Copia el contenido seleccionado al "portapapeles"
    function copiar(~,~)
        % Uso de la clase java.awt.Robot para simular
        % la introducción de una combinación de teclas.
        import java.awt.Robot;
        import java.awt.event.KeyEvent;
        rb=Robot();
        rb.keyPress(KeyEvent.VK_CONTROL);
        rb.keyPress(KeyEvent.VK_C);
        rb.keyRelease(KeyEvent.VK_CONTROL);
        rb.keyRelease(KeyEvent.VK_C);
        clear('rb');
    end

% Pega el texto contenido en el "portapapeles"
    function pegar(~,~)
        % Uso de la clase java.awt.Robot para simular
        % la introducción de una combinación de teclas.
        import java.awt.Robot;
        import java.awt.event.KeyEvent;
        rb=Robot();
        rb.keyPress(KeyEvent.VK_CONTROL);
        rb.keyPress(KeyEvent.VK_V);
        rb.keyRelease(KeyEvent.VK_CONTROL);
        rb.keyRelease(KeyEvent.VK_V);
        clear('rb');
    end

%  Borra todo el contenido
    function borrar(~,~)
        set(hTxt,'String','');
    end

% Selecciona el color de fuente utilizada
    function colorFuente(~,~)
        clr=uisetcolor([1 1 1]);
        set(hTxt,'ForegroundColor',clr);
    end

% Modifica el tamaño, estilo y tipo de fuente
    function modificarFuente(~,~)
        fmod=uisetfont();
        if ~isequal(fmod,0)
            set(hTxt,'FontName',fmod.FontName,...
                'FontSize',fmod.FontSize,...
                'FontWeight',fmod.FontWeight,...
                'FontAngle',fmod.FontAngle);
        else
            return;
        end
    end

% Alinea el texto (izquierda, derecha, centrado)
    function alinear(src,~)
        alin=get(src,'Label');
        MPOS={'Izquierda','Left';
            'Derecha','Right';
            'Centrado','Center'};
        k=strfind(MPOS(:,1),alin);
        k=cellfun(@isempty,k);
        set(hTxt,'Horizontal',MPOS{find(~k),2});
    end

% Run MATLAB file
    function runpy(~,~)
        %global ARCHIVO
        [~,m,n]=fileparts(ARCHIVO);
        system(['python ',[m,n],'&']);
    end

    function runjava(~,~)
        disp('Compilando...');
        name_ = ARCHIVO(1:end-5);
        % name_
        try
            system(['javac ',ARCHIVO,'&']);
            system(['java ',name_,'&']);
        catch
            disp('Imposible correr esto... OPSS');
        end
        disp('Finalizado');
    end

    function runcpp(~,~)
    end

% Modifica el "tema" de TextEdit
    function tema(src,~)
        tipo=get(src,'Label');
        MTEM={'Blue',[0.2 0.2 0.95],[1 1 1];
            'Classic',[1 1 1],[0 0 1];
            'Cool',[0.9 0.5 0.9],[1 1 0];
            'Dark',[0 0 0],[1 1 1];
            'Silver',[0.6 0.6 0.6],[1 1 1]};
        k=strfind(MTEM(:,1),tipo);
        k=cellfun(@isempty,k);
        set(hTxt,'BackgroundColor',MTEM{find(~k),2});
        set(hTxt,'ForegroundColor',MTEM{find(~k),3});
    end

% Abre la ayuda del programa
    function ayuda(~,~)
        h_FA=figure('MenuBar','None','Name','Ayuda',...
            'NumberTitle','off','Position',[0 0 250 150],...
            'color',[0.2 0.2 0.2],'Resize','off');
        centerfig(h_FA);
        txt=['TextEdit es un editor de texto sin formato desarrollado ' ...
            'como parte del proyecto MATLAB TYP. ' ...
            'El menú Edición le permite modificar el color' ...
            ' y características de la fuente utilizada, ' ...
            'además de poder copiar, pegar y borrar un contenido. ' ...
            'El menú Archivo le permite abrir y guardar archivos en ' ...
            'formato *.txt para posteriores ediciones'];
        axes('Parent',h_FA,'Position',[0 0 1 1],...
            'XLim',[0 1],'YLim',[0 1],'Visible','off');
        annotation('textbox',[0 0 1 1],'String',txt,...
            'FontName','Arial Narrow','Color','w','FontSize',10,...
            'FontWeight','b');
    end

% Acerca de...
    function acercade(~,~)
        figure('MenuBar','none','NumberTitle','off',...
            'Name','Acerca de...','Resize','off',...
            'Position',[0 0 200 100],'color','w');
        centerfig();
        devel='Por: Jorge De Los Santos';
        e_mail='E-mail: delossantosmfq@gmail.com';
        blog='Blog: http://matlab-typ.blogspot.mx';
        nvrs='TextEdit 0.0.1';
        uicontrol('style','text','String',devel,...
            'Units','Normalized','Position',[0.1 0.80 0.8 0.15],...
            'FontName','Arial Narrow','FontSize',10,...
            'ForegroundColor',ones(1,3)*0.2);
        uicontrol('style','text','String',{e_mail,blog},...
            'Units','Normalized','Position',[0.1 0.45 0.8 0.3],...
            'FontName','Arial Narrow','FontSize',9,...
            'ForegroundColor',ones(1,3)/2);
        uicontrol('style','text','String',nvrs,...
            'Units','Normalized','Position',[0.1 0.15 0.8 0.1],...
            'FontName','Courier','FontSize',10,'FontWeight','b',...
            'ForegroundColor',[0 0 0.5]);
        set(findobj('style','text'),'BackgroundColor','w');
    end
end