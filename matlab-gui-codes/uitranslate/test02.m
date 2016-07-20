function test02
%
% NOT FOR USE. IN DEVELOPMENT.
% 

hF = figure('MenuBar','none','Name','Multi - Language',...
    'NumberTitle','off','Position',[100 100 300 200],...
    'Resize','off');
centerfig(hF);

uimenu(hF,'Label','Archivo');
m2=uimenu(hF,'Label','Seleccionar idioma');
uimenu(m2,'Label','Español',...
    'Callback',@seleccIdioma,...
    'Checked','on','tag','id1');
uimenu(m2,'Label','Inglés',...
    'Callback',@seleccIdioma,...
    'Checked','off','tag','id2');
uimenu(hF,'Label','Ayuda');


    function seleccIdioma(src,event)
        filename = 'datos02.dat';
        if strcmp(get(gcbo,'Checked'),'off')
            hid=gcbo;
            if strcmp(get(hid,'tag'),'id1')
                set(hid,'checked','on');
                set(findobj('tag','id2'),'checked','off');
            else
                set(hid,'checked','on');
                set(findobj('tag','id1'),'checked','off');
            end
        end
        uitranslate(hF,filename);
    end

end