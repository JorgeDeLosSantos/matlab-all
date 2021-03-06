function g12_HolaMundo
f = figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Hola Mundo',...
    'Position',[0 0 250 150]);
centerfig(f);

hTxt = uicontrol('style','text',...
    'String','',...
    'Position',[50 100 150 30],...
    'FontSize',14);

uicontrol('style','push',...
    'String','Saludar',...
    'Position',[70 40 110 30],...
    'Callback',@saludar_callback,...
    'FontSize',12);

    function saludar_callback(~,~)
        set(hTxt,'String','Hola Mundo',...
            'ForegroundColor',rand(1,3));
    end
    
end