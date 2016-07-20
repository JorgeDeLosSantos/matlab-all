function g02_DemoStaticText
% g02_DemoStaticText.m
% 
% 
%
%
f = figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Ejemplo GUI',...
    'Position',[0 0 300 200]);
centerfig(f);

uicontrol('style','text',... % Tipo de control gr�fico
    'String','Este es un Static Text',... % Texto a mostrar
    'Units','Normalized',... % Unidades en que se miden las dimensiones.
    'Position',[0.1 0.40 0.8 0.2],... % Posici�n y tama�o del Static Text
    'FontSize',14,... % Tama�o de fuente
    'FontWeight','bold',... % Estilo de fuente
    'ForegroundColor',rand(1,3)); % Color de fuente
end