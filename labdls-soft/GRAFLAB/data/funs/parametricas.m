function parametricas
% $ Por: Jorge De Los Santos $
% $ Rev. 1.0 $ 07/07/14 $
%
figure('MenuBar','none','NumberTitle','off',...
    'Name','GRAFLAB - Ecuaciones paramétricas',...
    'Position',[300 300 600 350],'resize','off');
centerfig();

ax=axes('Units','pixels','Position',[30 25 420 300]);
plot(NaN);

p=uipanel(gcf,'units','pixels','Position',[470 20 120 310],...
    'BackgroundColor',get(gcf,'color')*0.9);

uicontrol(p,'style','text','String','Ecuaciones',...
    'Position',[10 280 100 20],...
    'BackgroundColor',get(p,'BackgroundColor'));

uicontrol(p,'style','text','String','x(t)',...
    'Position',[2 255 25 20],'FontSize',10,...
    'BackgroundColor',get(p,'BackgroundColor'));
hx=uicontrol(p,'style','edit','String','',...
    'Position',[30 255 80 20]);

uicontrol(p,'style','text','String','y(t)',...
    'Position',[2 220 30 20],'FontSize',10,...
    'BackgroundColor',get(p,'BackgroundColor'));
hy=uicontrol(p,'style','edit','String','',...
    'Position',[30 220 80 20]);

uicontrol(p,'style','text','String','Intervalo',...
    'Position',[10 180 100 20],...
    'BackgroundColor',get(p,'BackgroundColor'));

uicontrol(p,'style','text','String','a',...
    'Position',[20 150 20 20],'FontSize',10,...
    'Backgroundcolor',get(p,'BackgroundColor'));
ha=uicontrol(p,'style','edit','String','',...
    'Position',[45 150 50 20]);

uicontrol(p,'style','text','String','b',...
    'Position',[20 120 20 20],'FontSize',10,...
    'Backgroundcolor',get(p,'BackgroundColor'));
hb=uicontrol(p,'style','edit','String','',...
    'Position',[45 120 50 20]);

uicontrol(p,'style','push','String','Graficar',...
    'Position',[20 60 80 22],'FontSize',10,...
    'FontWeight','b','Callback',@graficar);

    function graficar(~,~)
        xt=get(hx,'String');
        yt=get(hy,'String');
        t1=str2double(get(ha,'String'));
        t2=str2double(get(hb,'String'));
        ezplot(xt,yt,[t1 t2]);
    end
end