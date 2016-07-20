function ex4 
figure('MenuBar','none','NumberTitle','off',...
    'Name','GUI 4','Resize','off',...
    'Position',[0 0 200 150],'color',[0.7 0.7 0.7]);
centerfig();

uicontrol('style','text','String','f (x)',...
    'Position',[2 115 30 20],...
    'BackgroundColor',get(gcf,'color'));
hfx=uicontrol('style','edit','String','',...
    'Position',[35 115 150 20]);

uicontrol('style','text','String','f ''(x)',...
    'Position',[2 75 30 20],...
    'BackgroundColor',get(gcf,'color'));
hdfx=uicontrol('style','text','String','',...
    'Position',[35 75 150 20],...
    'BackgroundColor',get(gcf,'color')*0.8);

uicontrol('style','push','String','Derivar',...
    'Position',[60 25 80 20],...
    'Callback',@func,'FontWeight','b');

    function func(src,event)
        f=sym(get(hfx,'str'));
        dfx=diff(f,sym('x'));
        set(hdfx,'str',char(dfx));
    end
end