function g16_ConversorLongitudes
f = figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Conversor longitudes',...
    'Position',[0 0 300 120]);
centerfig(f);

unidades = {'m','km','cm'};

uicontrol('style','text',...
    'String','Entrada',...
    'Position',[10 80 60 20]);
hVE = uicontrol('style','edit',...
    'String','',...
    'Position',[80 80 140 20]);
hUE = uicontrol('style','popup',...
    'String',unidades,...
    'Position',[230 80 60 20]);


uicontrol('style','text',...
    'String','Salida',...
    'Position',[10 30 60 20]);
hVS = uicontrol('style','edit',...
    'String','',...
    'Position',[80 30 140 20],...
    'ForegroundColor','b');
uicontrol('style','popup',...
    'String',unidades,...
    'Position',[230 30 60 20],...
    'Callback',@convertir);


set(findobj('style','text'),'BackG',get(f,'Color'),...
    'FontSize',10,'FontW','b');


    function convertir(src,~)
        strs_ent = get(hUE,'String');
        strs_sal = get(src,'String');
        k_ent = get(hUE,'Value');
        k_sal = get(src,'Value');
        N = get(hVE,'String');
        
        uni_ent = strs_ent{k_ent};
        uni_sal = strs_sal{k_sal};
        tipo_conv = [uni_ent,'-',uni_sal];
        
        KCONV = {'m-km', 0.001;
                 'm-cm', 100;
                 'm-mm', 1000;
                 'km-m', 1000;
                 'km-cm',1e5;
                 'km-mm',1e6;
                 'cm-km',1e-5;
                 'cm-m', 0.01;
                 'cm-mm',10;
                 'mm-cm',0.1;
                 'mm-m',0.001;
                 'mm-km',1e-6};
        
        if strcmp(uni_ent,uni_sal)
            set(hVS,'String',N);
        else
            N = str2double(N);
            for i=1:length(KCONV)
                if strcmp(KCONV{i,1},tipo_conv)
                    set(hVS,'String',N*KCONV{i,2});
                end
            end
        end
    end

end