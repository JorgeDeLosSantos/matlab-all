function graflab
figure('MenuBar','none','NumberTitle','off',...
    'Name','GRAFLAB 1.0','resize','off',...
    'Position',[200 200 400 300],'Color','w');
centerfig(gcf);
inicio();

p2d=uipanel(gcf,'units','pixels','Position',[10 10 180 270]);
p3d=uipanel(gcf,'units','pixels','Position',[210 10 180 270]);
uicontrol(gcf,'style','text','String','Gr�ficas en 2D',...
    'position',[50 281 100 15],'FontSize',8,...
    'FontWeight','b','BackgroundColor','w');
uicontrol(gcf,'style','text','String','Gr�ficas en 3D',...
    'Position',[250 281 100 15],'FontSize',8,...
    'FontWeight','b','BackgroundColor','w');

%% Gr�ficas en 2D
uicontrol(p2d,'style','push','Position',[10 235 160 25],...
    'String','Coordenadas rectangulares',...
    'Callback','run(''data/funs/coordRect.m'')');

uicontrol(p2d,'style','push','Position',[10 205 160 25],...
    'String','Coordenadas polares',...
    'Callback','run(''data/funs/coordPol.m'')');

uicontrol(p2d,'style','push','Position',[10 175 160 25],...
    'String','Param�tricas',...
    'Callback','run(''data/funs/parametricas.m'')');

uicontrol(p2d,'style','push','Position',[10 145 160 25],...
    'String','Pol�gonos',...
    'Callback','run(''data/funs/poligonos.m'')');

set(findobj('parent',p2d),'FontSize',8);

%% Gr�ficas en 3D
uicontrol(p3d,'style','push','Position',[10 235 160 25],...
    'String','Superficies',...
    'Callback','run(''data/funs/superficies.m'')');

uicontrol(p3d,'style','push','Position',[10 205 160 25],...
    'String','Curvas param�tricas','Callback',@curvparam);

uicontrol(p3d,'style','push','Position',[10 175 160 25],...
    'String','Curvas de nivel','Callback',@curvniv);

uicontrol(p3d,'style','push','Position',[10 145 160 25],...
    'String','Esferas','Callback',@esferas);

uicontrol(p3d,'style','push','Position',[10 115 160 25],...
    'String','Cilindros','Callback',@cilindros);

uicontrol(p3d,'style','push','Position',[10 85 160 25],...
    'String','Planos','Callback',@planos);

set(findobj('parent',p3d),'FontSize',8);


    function inicio()
        disp('Iniciando...');
    end
end