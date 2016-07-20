function pestanna
figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Pestaña',...
    'Resize','off',...
    'Position',[200 200 400 300]);
centerfig;

p1=uipanel(gcf,'units','pixels','Position',[10 10 380 280],...
    'BackgroundColor',[0.8 0.8 0.8]);
p2=uipanel(gcf,'units','pixels','Position',[10 10 380 280],...
    'BackgroundColor',[0.8 0.8 0.8]);

% Botones cambiar pestaña
uicontrol('style','push',...
    'str','Pestaña 1',...
    'Position',[10 270 80 20],...
    'Callback',@secc1,'BackgroundColor',get(p1,'BackgroundColor'),...
    'Tag','pest');
uicontrol('style','push',...
    'str','Pestaña 2',...
    'Position',[90 270 80 20],...
    'Callback',@secc2,'BackgroundColor',get(p2,'BackgroundColor'),...
    'Tag','pest');

% Panel 1 - contenido
uicontrol(p1,'style','push','str','P1 botón','pos',[20 20 100 20]);

% Panel 2 - contenido
uicontrol(p2,'style','push','str','P2 botón','pos',[20 20 100 20]);


    function secc1(src,event)
        set(findobj('tag','pest'),'FontWeight','normal');
        set(src,'FontWeight','b');
        set(p2,'visible','off');
        set(p1,'visible','on');
        p = get(src,'pos');
        cp2 = get(p1,'BackgroundColor');
        C(1:p(4),1:p(3),1)=ones(p(4),p(3))*cp2(1);
        C(1:p(4),1:p(3),2)=ones(p(4),p(3))*cp2(2);
        C(1:p(4),1:p(3),3)=ones(p(4),p(3))*cp2(3);
        set(src,'CData',C);
    end

    function secc2(src,event)
        set(findobj('tag','pest'),'FontWeight','normal');
        set(src,'FontWeight','b');
        set(p1,'visible','off');
        set(p2,'visible','on');
        p = get(src,'pos');
        cp2 = get(p2,'BackgroundColor');
        C(1:p(4),1:p(3),1)=ones(p(4),p(3))*cp2(1);
        C(1:p(4),1:p(3),2)=ones(p(4),p(3))*cp2(2);
        C(1:p(4),1:p(3),3)=ones(p(4),p(3))*cp2(3);
        set(src,'CData',C);
    end

end