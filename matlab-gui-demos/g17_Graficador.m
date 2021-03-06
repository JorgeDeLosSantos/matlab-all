function g17_Graficador
f = figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Graficador',...
    'Position',[0 0 400 300],...
    'Resize','off');
centerfig(f);

p1 = uipanel('Units','Pixels',...
    'Position',[10 50 380 240]);

ax = axes('Parent',p1);

p2 = uipanel('Units','Pixels',...
    'Position',[10 10 380 35]);

uicontrol(p2,'style','text',...
    'String',' f (x) ',...
    'Units','Normalized',...
    'Position',[0.01 0.2 0.1 0.6],...
    'FontW','b','FontS',10);
hF = uicontrol(p2,'style','edit',...
    'Units','Normalized',...
    'Position',[0.13 0.2 0.6 0.6]);
uicontrol(p2,'style','push',...
    'String','Graficar',....
    'Units','Normalized',...
    'Position',[0.75 0.15 0.22 0.7],...
    'FontSize',10,...
    'Callback',@graficar);

    function graficar(~,~)
        fun = get(hF,'Str');
        x = linspace(0,10);
        if ~strcmp(fun,'')
            y = eval(fun);
        else
            errordlg('Inserte una funci�n');
            return;
        end
        plot(x,y);
    end

end