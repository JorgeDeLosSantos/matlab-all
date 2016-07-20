function g06_DemoPopUpMenu
f = figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Ejemplo GUI',...
    'Position',[0 0 200 100]);
centerfig(f);

lista = {'Rojo','Verde','Azul','Negro','Blanco'};
uicontrol('style','popup',...
    'String',lista,...
    'Units','Normalized',...
    'Position',[0.1 0.1 0.8 0.8],...
    'Callback',@select_clr);
    

% Función que define la respuesta al seleccionar cualquier opción
% del popup-menu.
    function select_clr(src,~)
        all_str = get(src,'String'); % Obtener el cell array de strings.
        k = get(src,'Value'); % Valor numérico de la opción seleccionada.
        switch all_str{k}
            case 'Rojo', color = 'r'; 
            case 'Verde', color = 'g';
            case 'Azul', color = 'b';
            case 'Negro', color= 'k';
            case 'Blanco', color= 'w';
            otherwise, color = get(f,'Color');
        end
        set(f,'Color',color); % Modificar la propiedad color de la ventana
                              % acorde al seleccionado.
    end
end