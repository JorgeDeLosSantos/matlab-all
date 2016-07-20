function b_3
% Bombas centrífugas (Tipo 3)
% $ Ref. 1939 $
% $ Rev 1.0 $ 12/11/13 $

%% Constantes persistentes
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));

%% Características generales
cfondo=[0.5 0.8 0.9];
etsize=8;

%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,500,300],'color',cfondo);
centerfig(f);

%% Menú

menu1 = uimenu(f,'Label','Herramientas');
uimenu(menu1,'Label','Conversor de unidades','callback','winopen(''data/mfun/convert.exe'')');
uimenu(menu1,'Label','Tablas','callback','winopen(''data/docs/Tablas.pdf'')');
uimenu(menu1,'Label','Diagrama de Moody','callback','winopen(''data/docs/Moody.pdf'')');
uimenu(menu1,'Label','Presión de saturación del agua (PSV)','callback','run(''data/mfun/presat.m'')');
uimenu(menu1,'Label','Cálculo del coeficiente de fricción','callback','run(''data/mfun/coefFriccionPP.m'')');
sub11=uimenu(menu1,'Label','Ecuaciones de turbomáquinas');
uimenu(sub11,'Label','Ecuaciones Bombas Centrífugas','callback','winopen(''data/docs/EC_BC.pdf'')');
uimenu(sub11,'Label','Ecuaciones Turbinas de reacción','callback','winopen(''data/docs/EC_TR.pdf'')');
uimenu(sub11,'Label','Ecuaciones Turbinas de acción','callback','winopen(''data/docs/EC_TA.pdf'')');
menu2=uimenu(f,'Label','Ayuda');
uimenu(menu2,'Label','Ayuda en PDF','callback','winopen(''data/docs/Ayuda.pdf'')');
% uimenu(menu2,'Label','Video Tutorial','callback','winopen(''data/docs/vid01.mp4'')');
uimenu(f,'Label','Acerca de...','callback','run(''data/mfun/acerca.m'')');

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 270],'backgroundcolor',cfondo);

% 1ra col

ec1=uicontrol(pp,'style','text','String','c1','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dc1=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uc1=uicontrol(pp,'style','text','String','m/s','position',[150 220 30 20],'backgroundcolor',cfondo);

ec2=uicontrol(pp,'style','text','String','c2','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dc2=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
uc2=uicontrol(pp,'style','text','String','m/s','position',[150 180 30 20],'backgroundcolor',cfondo);

eD1=uicontrol(pp,'style','text','String','D1','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD1=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
uD1=uicontrol(pp,'style','text','String','m','position',[150 140 30 20],'backgroundcolor',cfondo);

eD2=uicontrol(pp,'style','text','String','D2','position',[10 100 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD2=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
uD2=uicontrol(pp,'style','text','String','m','position',[150 100 30 20],'backgroundcolor',cfondo);

% 2da Col

ealpha1=uicontrol(pp,'style','text','String','alpha1','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dalpha1=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
ualpha1=uicontrol(pp,'style','text','String','°','position',[350 220 30 20],'backgroundcolor',cfondo);

ealpha2=uicontrol(pp,'style','text','String','alpha2','position',[210 180 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dalpha2=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
ualpha2=uicontrol(pp,'style','text','String','°','position',[350 180 30 20],'backgroundcolor',cfondo);

en=uicontrol(pp,'style','text','String','n','position',[210 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dn=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
un=uicontrol(pp,'style','text','String','rpm','position',[350 140 30 20],'backgroundcolor',cfondo);

% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[160 20 80 25],...
    'callback',@calcular,'fontsize',10,'fontweight','bold');



%% Menú Botones
posb=250;

regresar=uicontrol('style','pushbutton','String','','position',[0 posb 35 35],...
    'callback',@gohome,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/inicio.png'));

tvel=uicontrol('style','pushbutton','String','','position',[0 posb-35 35 35],...
    'callback',@gotrian,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/triangulo.png'));

graphs=uicontrol('style','pushbutton','String','','position',[0 posb-2*35 35 35],...
    'callback',@gographics,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/grafica.png'));

convuni=uicontrol('style','pushbutton','String','','position',[0 posb-3*35 35 35],...
    'callback',@goconv,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/unidades.png'));

tablasb=uicontrol('style','pushbutton','String','','position',[0 posb-4*35 35 35],...
    'callback',@gotablas,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/tabla.png'));

calcu=uicontrol('style','pushbutton','String','','position',[0 posb-5*35 35 35],...
    'callback',@gocalc,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/calculadora.png'));

helping=uicontrol('style','pushbutton','String','','position',[0 posb-6*35 35 35],...
    'callback',@goayuda,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'));


%% Funciones
    function calcular(src,~)
        global u1 u2 c1 c2 alpha1 alpha2
        c1=str2double(get(dc1,'String'));
        c2=str2double(get(dc2,'String'));
        D1=str2double(get(dD1,'String'));
        D2=str2double(get(dD2,'String'));
        alpha1=str2double(get(dalpha1,'String'))*pi/180;
        alpha2=str2double(get(dalpha2,'String'))*pi/180;
        n=str2double(get(dn,'String'));
        
        % Procedimiento ---
        u1=(pi*D1*n)/60;
        u2=(pi*D2*n)/60;
        c1u=c1*cos(alpha1);
        c2u=c2*cos(alpha2);
        Hu=(u2*c2u-u1*c1u)/g;
        
        res1=horzcat('u1= ',num2str(u1),' m/s');
        res2=horzcat('u2= ',num2str(u2),' m/s');
        res3=horzcat('c1u= ',num2str(c1u),' m/s');
        res4=horzcat('c2u= ',num2str(c2u),' m/s');
        res5=horzcat('Hu= ',num2str(Hu),' m');
        
        figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
    end

    function gohome(src,~)
        close(gcf);
        run('App_Bombas.m');
    end

    function gotrian(src,~)
        global u1 u2 c1 c2 alpha1 alpha2
        if isempty(u1)
            warndlg('Datos no proporcionados, verifique.','MFITEC - Error');
        else
            triangulos(u1,c1,alpha1,u2,c2,alpha2);
        end
    end

    function gographics(src,~)
        c1=str2double(get(dc1,'String'));
        c2=str2double(get(dc2,'String'));
        D1=str2double(get(dD1,'String'));
        D2=str2double(get(dD2,'String'));
        alpha1=str2double(get(dalpha1,'String'))*pi/180;
        alpha2=str2double(get(dalpha2,'String'))*pi/180;
        n=insertRango('n (rpm)','100:1000');
        
        u1=(pi*D1*n)/60;
        u2=(pi*D2*n)/60;
        c1u=c1*cos(alpha1);
        c2u=c2*cos(alpha2);
        Hu=(u2*c2u-u1*c1u)/g;
        grafica(n,Hu,'n ( rpm )','Hu ( m )','n vs Hu');
        
%         msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
    end

    function goconv(src,~)
        winopen('data/mfun/convert.exe');
    end

    function gotablas(src,~)
        winopen('data/docs/Tablas.pdf');
    end

    function gocalc(src,~)
        winopen('data/mfun/calc.exe');
    end

    function goayuda(src,~)
        winopen('data/docs/Ayuda.pdf');
    end

end
