function miniAgenda

figure('MenuBar','none','NumberTitle','off',...
    'Name','Mini Agenda','Position',[200 200 250 150],...
    'resize','off');
centerfig;

menucolor = [0.7 0.7 0.75];


uicontrol('style','text','str','Mini Agenda LAB DLS',...
    'pos',[10 100 230 40],'FontSize',10,'FontWeight','b',...
    'BackgroundColor',get(gcf,'color'));

uicontrol('style','push','str','Nuevo contacto','pos',[1 70 100 25],...
    'BackgroundColor',menucolor,'callback',@nuevoFcn);

uicontrol('style','push','str','Ver contactos','pos',[1 45 100 25],...
    'BackgroundColor',menucolor,'callback',@verFcn);

uicontrol('style','push','str','Buscar contacto','pos',[1 20 100 25],...
    'BackgroundColor',menucolor,'callback',@buscarFcn);

uicontrol('style','push','str','Borrar contacto','pos',[150 70 100 25],...
    'BackgroundColor',menucolor,'callback',@borrarFcn);

uicontrol('style','push','str','Acerca de...','pos',[150 45 100 25],...
    'BackgroundColor',menucolor,'callback',@acercaFcn);


    function nuevoFcn(~,~)
        if ~isdir('data')
            mkdir('data');
        end
        
        prompt = {'Nombre','Apellidos','Teléfono','E-mail'};
        titulo = 'Datos de contacto';
        numl = 1;
        def = {'','','','',''};
        datos = inputdlg(prompt,titulo,numl,def);
        
        % Guardar datos
        if ~isempty(datos)
            nomb_arch = horzcat('data/',datos{1},' ',datos{2},'.mat');
            save(nomb_arch,'datos');
        end
        
    end

    function verFcn(~,~)
        contact = dir('data/*.mat');
        for i=1:length(contact)
            A{i}=strrep(contact(i).name,'.mat','');
            %A(i)=load(horzcat('data/',contact(i).name));
        end
        
        fLista = figure('MenuBar','none','NumberTitle','off',...
            'Name','Lista de Contactos','Position',[300 300 450 200],...
            'resize','off');
        uicontrol(fLista,'style','listbox','str',A,...
            'pos',[10 10 150 180],'callback',@listaFcn);
        panel=uipanel(fLista,'units','pixels',...
            'Position',[180 10 260 180]);
        
        uicontrol(panel,'style','text','str','NOMBRE: ',...
            'pos',[10 140 65 20],'tag','et');
        d(1)=uicontrol(panel,'style','text','str','',...
            'pos',[85 140 120 20]);
        
        uicontrol(panel,'style','text','str','APELLIDOS: ',...
            'pos',[10 100 65 20],'tag','et');
        d(2)=uicontrol(panel,'style','text','str','',...
            'pos',[85 100 120 20]);
        
        uicontrol(panel,'style','text','str','TELÉFONO: ',...
            'pos',[10 60 65 20],'tag','et');
        d(3)=uicontrol(panel,'style','text','str','',...
            'pos',[85 60 120 20]);
        
        uicontrol(panel,'style','text','str','E-MAIL: ',...
            'pos',[10 20 65 20],'tag','et');
        d(4)=uicontrol(panel,'style','text','str','',...
            'pos',[85 20 120 20]);
        
        
        set(findobj('tag','et'),'FontWeight','b','Horizontal','left');
        set(d,'ForegroundColor','b','Horizontal','left');
        
        function listaFcn(src,~)
            k=get(src,'value');
            M=get(src,'str');
            archivo = horzcat('data/',M{k},'.mat');
            
            D = load(archivo);
            D=D.datos;
            set(d(1),'str',D{1});
            set(d(2),'str',D{2});
            set(d(3),'str',D{3});
            set(d(4),'str',D{4});
        end
    end

    function buscarFcn(~,~)
        cadBusca = inputdlg('Nombre de contacto','Buscar...',1,{''});
        M = dir('data/*.mat');
        for k=1:length(M)
            if strfind(M(k).name,cell2mat(cadBusca))
                disp(k);
            end
        end
    end

    function borrarFcn(~,~)
        contact = dir('data/*.mat');
        for i=1:length(contact)
            A{i}=strrep(contact(i).name,'.mat','');
            %A(i)=load(horzcat('data/',contact(i).name));
        end
        
        fB = figure('MenuBar','none','NumberTitle','off',...
            'Name','Borrar','Position',[300 300 170 200],...
            'resize','off');
        uicontrol(fB,'style','text','str','Seleccione el contacto',...
            'pos',[10 180 150 15],'FontWeight','b','BackGround',get(fB,'color'));
        
        listaContactos=uicontrol(fB,'style','listbox','str',A,...
            'pos',[10 40 150 130]);
        
        uicontrol(fB,'style','push','str','Borrar','pos',[50 10 70 20],...
            'callback',@borra);
        
        function borra(~,~)
            n=get(listaContactos,'value');
            archivo = horzcat('data/',contact(n).name);
            delete(archivo);
            delete(fB);
            borrarFcn();
        end
    end

    function acercaFcn(~,~)
        desc = {'Por: Jorge De Los Santos  ','E-mail: matlab-typ@gmail.com'};
        h = msgbox(desc,'About');
        set(h,'pos',get(h,'pos')+[0 0 10 0],'color',[1 1 1]);
        A=get(h,'children');
        texto=get(A(1),'children');
        set(texto,'FontSize',10,'FontWeight','b','FontName','Arial Narrow',...
            'horizontal','left');
    end
end


