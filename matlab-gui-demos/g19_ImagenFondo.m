function g19_ImagenFondo
f = figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Imagen fondo',...
    'Position',[0 0 400 300]);
centerfig(f);

fdim = get(f,'Position'); % Obtenemos la posición y tamaño de la ventana
ancho = fdim(3); 
alto = fdim(4);

ax_fondo = axes('Position',[0 0 1 1]);
X = imread('saturn.png');
X = imresize(X,[alto ancho]);
imshow(X,'Parent',ax_fondo);

axg = axes();
Y = rand(10); % Algunos valores aleatorios
plot(axg,Y); 

uicontrol('style','push',...
    'String','Ocultar axes',...
    'Position',[1 1 100 20],...
    'Callback',@bt_callback);

    function bt_callback(src,~)
        if strcmp(get(axg,'Visible'),'on')
            set(axg,'Visible','off');
            set(src,'String','Mostrar axes');
        else
            set(axg,'Visible','on');
            set(src,'String','Ocultar axes');
        end
    end
end