function Inicio
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Interfaz de inicio                                           +
% Mod 09/11/13                                                 +
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%% Condiciones de inicio del programa
rho=1000; % Establecer valor de la densidad en 1000 kg/m^3 (Agua en condiciones normales)
save('data/mfun/rho.mat','rho');
clearvars('rho');

%% Desarrollo de la interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC','position',[500,300,300,200],'color',[0.8 0.8 0.9]);

% Icono de la aplicación
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
jframe=get(f,'javaframe');
jIcon=javax.swing.ImageIcon('data/imag/triangulo.png');
jframe.setFigureIcon(jIcon);

ax=axes('Parent',f,'units','normalized','position',[0 0 1 1]);
imshow(imread('data/imag/imagen.png'),'parent',ax);

uicontrol('style','text','String','Para continuar seleccione una opción',...
    'position',[30 120 240 20],'fontsize',9,'fontweight','bold',...
    'backgroundcolor',[0.82 0.82 0.82]);

sel=uicontrol('style','popupmenu','String',{'Bombas Centrífugas','Turbinas de Reacción','Turbinas de Acción'},...
    'position',[70 70 160 30]);

uicontrol('style','pushbutton','String','Continuar >>','position',...
    [100 30 100 30],'backgroundcolor',[0.5 1 0.5],'fontsize',10,'callback',@opcion,...
    'fontweight','bold','tooltipstring','Continuar a la interfaz de cálculos','FontName','Arial');

%% Botón ayuda
posx=(300/2)-35/2;
posy=200-35;
uicontrol('style','pushbutton','String','','position',[posx posy 35 35],'callback','','fontsize',10,...
    'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'),'tooltipstring','Ayuda',...
    'callback',@goayuda);

path(path,'data/mfun'); % Agregar al path las funciones de "mfun" 

%% Funciones
    function opcion(~,~)
        n=get(sel,'Value');
        K=struct2array(load('data/mfun/mostrec.mat'));
        switch n
            case 1
                close(gcf);
                run('App_Bombas.m');
                if K==0
                    recomendacion(1);
                end
            case 2
                close(gcf);
                run('App_Turbinas_R.m');
                if K==0
                    recomendacion(2);
                end
            case 3
                close(gcf);
                run('App_Turbinas_A.m');
                if K==0
                    recomendacion(3);
                end
        end
    end

    function goayuda(~,~)
        winopen('data/docs/Ayuda.pdf');
    end
end