function verImg
clearvars('-global')
figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Visualizador de imágenes',...
    'Resize','off',...
    'Position',[200 200 450 350]);
centerfig;

uimenu('Label','Seleccionar carpeta','Callback',@selFcn);

ax=axes('units','pixels',...
    'Position',[25 25 400 300],...
    'Visible','off');

uicontrol('style','push',...
    'String','<<',...
    'Position',[0 165 20 20],...
    'Callback',@cambiar);

uicontrol('style','push',...
    'String','>>',...
    'Position',[430 165 20 20],...
    'Callback',@cambiar);

    function selFcn(src,~)
        global carp Imgs cont
        cont=1;
        carp=uigetdir;
        if isequal(carp,0)
            return;
        end
        Imgs=dir([carp,'/*.jpg']);
        imshow(imread([carp,'/',Imgs(cont).name]));
    end

    function cambiar(src,~)
        global carp cont Imgs
        if (strcmp(get(src,'str'),'>>') && cont<length(Imgs))
            cont=cont+1;
            imshow(imread([carp,'/',Imgs(cont).name]));
        elseif (strcmp(get(src,'str'),'<<') && cont>1)
            cont=cont-1;
            imshow(imread([carp,'/',Imgs(cont).name]));
        end
    end
end