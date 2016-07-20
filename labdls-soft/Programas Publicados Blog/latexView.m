function latexView
% Visor de expresiones LaTeX
%
% $ Por: Jorge De Los Santos $
% $ E-mail: delossantosmfq@gmail.com $
% $ Blog: http://matlab-typ.blogspot.mx $
% $ Rev. 1.0.0 $ 07/06/2014 $

figure('MenuBar','none','NumberTitle','off','Name','LaTeX Visor',...
    'Position',[200 200 300 200],'resize','on');
centerfig(gcf);

uicontrol('style','text','str','Inserte una expresión','units','norm',...
    'position',[0.1 0.9 0.8 0.08],'BackGroundColor',get(gcf,'color'),...
    'FontWeight','b');

cad=uicontrol('style','edit','str','','units','normalized',...
    'position',[0.02 0.8 0.87 0.1],'FontSize',9);
uicontrol('style','push','str','OK','units','normalized',...
    'position',[0.90 0.8 0.08 0.1],'callback',@mostrar);

p=uipanel(gcf,'units','normalized','position',[0.02 0.02 0.96 0.75],...
    'BackgroundColor','w');
ax=axes('parent',p,'units','normalized','position',[0 0 1 1],...
    'visible','off');
set(ax,'XLim',[0 1],'YLim',[0 1]);

    function mostrar(~,~)
        cla;
        txt=horzcat('$$',get(cad,'str'),'$$'); % Concatenar expresión
        text(0.5,0.5,txt,'interpreter','latex','FontSize',14,...
            'units','normalized','Horizontal','center');
    end
end