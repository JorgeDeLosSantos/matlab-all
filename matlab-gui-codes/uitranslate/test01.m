function test01
% 
% Demo for uitranslate function
% Simple Test

f = figure('MenuBar','none','Name','Multi - Language GUI',...
    'NumberTitle','off','Position',[100 100 250 100],...
    'Resize','off');
centerfig(f);

uimenu(gcf,'Label','Archivo');
uimenu(gcf,'Label','Configuración');
uimenu(gcf,'Label','Ayuda');

uicontrol('style','push',...
    'String','Cambiar idioma',...
    'Position',[10,50,100,20],...
    'Callback',@fun);

    function fun(~,~)
        uitranslate(f,'datos01.dat');
    end

end