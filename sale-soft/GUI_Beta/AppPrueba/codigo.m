function codigo
f1=figure('Numbertitle','off','Name','Password','menubar','none','Position',[200 200 300 200],...
    'closerequestfcn',@cerrar);

texto=uicontrol('style','text','string','Password','position',[100 150 100 20]);
pswt=uicontrol('style','edit','string','','position',[50 100 200 20]);
btn=uicontrol('style','pushbutton','string','Go','position',[100 50 100 20],...
    'callback',@verificar);

    function verificar(hObject,eventdata)
        a=get(pswt,'String');
        if strcmp(a,'123')
            close(f1);
        else
            msgbox('Incorrecto');
            close all;
        end
    end

    function cerrar(src,event)
        delete(src);
        close all;
    end

end