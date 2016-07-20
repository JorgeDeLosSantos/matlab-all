function g18_VisorImagenes
f = figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Visor Imágenes',...
    'Position',[0 0 600 400]);
centerfig(f);

hMA = uimenu('Label','Archivo');
uimenu(hMA,'Label','Abrir','Callback',@abrir_fcn);
uimenu(hMA,'Label','Cerrar','Callback','close(gcf)');

ax = axes('Position',[0 0 1 1],'Visible','off');

    function abrir_fcn(~,~)
        [filename, pathname] = uigetfile({'*.png';'*.jpg';'*.tiff'}, 'Seleccione una imagen');
        if isequal(filename,0) || isequal(pathname,0)
            return;
        else
            X = imread(fullfile(pathname, filename));
        end
        imshow(X);
        axis('image');
    end
end