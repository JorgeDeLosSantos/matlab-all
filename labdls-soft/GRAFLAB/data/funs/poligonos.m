function poligonos
% $ Por: Jorge De Los Santos $
% $ Rev. 1.0 $ 07/07/14 $
%
figure('MenuBar','none','NumberTitle','off',...
    'Name','GRAFLAB - Polígonos',...
    'Position',[300 300 500 400],'resize','off');
centerfig();

ax=axes('Units','pixels','Position',[30 70 440 320]);
plot(NaN);

p=uipanel(gcf,'units','pixels','Position',[30 8 440 40],...
    'BackgroundColor',get(gcf,'color')*0.9);

uicontrol(p,'style','text','String','Número de lados',...
    'Position',[5 8 100 20],'FontSize',8,...
    'BackgroundColor',get(p,'BackgroundColor'));
hnl=uicontrol(p,'style','edit','String','',...
    'Position',[105 10 100 20]);

uicontrol(p,'style','text','String','Radio',...
    'Position',[210 8 45 20],'FontSize',8,...
    'Backgroundcolor',get(p,'BackgroundColor'));
hr=uicontrol(p,'style','edit','String','',...
    'Position',[255 10 40 20]);


uicontrol(p,'style','push','String','Graficar',...
    'Position',[330 9 80 22],'FontSize',10,...
    'FontWeight','b','Callback',@graficar);

    function graficar(~,~)
        N=str2double(get(hnl,'String'));
        r=str2double(get(hr,'String'));
        t = (0:1/N:1)*2*pi;
        x = r*sin(t);
        y = r*cos(t);
        h=plot(x,y,'r');
        axis square;
    end
end