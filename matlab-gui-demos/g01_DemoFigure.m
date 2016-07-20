function g01_DemoFigure
% g01_DemoFigure.m
% 
% 
%
%
%
% -----------------------------------
%       Rev 0.0.1  |  04/11/2014
%       Por: Jorge De Los Santos
%   E-mail: delossantosmfq@gmail.com
% -----------------------------------
f = figure('MenuBar','none',... % Oculta la barra de menú
    'NumberTitle','off',... % Elimina la numeración por defecto
    'Name','Ejemplo GUI',... % Nombre/Título de la GUI
    'Position',[0 0 300 200]); % Posición y tamaño de la GUI
centerfig(f); % Centra la GUI en la pantalla

% Configurar la propiedad color (aleatorio)
set(f,'Color',rand(1,3));
% Recuerde que el color puede ser un modificador en forma
% de caracter ('r','g','b','k',...), o bien un vector de 
% 3 elementos en el intervalo 0 a 1, que especifican el
% color en formato o modelo RGB. 

end