function b_11(subtipo)
%% Descripción General ------------------------------------------------
% REF Non Reference
% MOD 21/11/13

%% Constantes persistentes --------------------------------------------
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));

%% Características generales ------------------------------------------
cfondo=[0.5 0.8 0.9];
etsize=8;

%% Interfaz -----------------------------------------------------------
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,500,250],'color',cfondo);
centerfig(f);

%% Menú Superior

menu1 = uimenu(f,'Label','Herramientas');
uimenu(menu1,'Label','Conversor de unidades','callback','winopen(''data/mfun/convert.exe'')');
uimenu(menu1,'Label','Tablas','callback','winopen(''data/docs/Tablas.pdf'')');
uimenu(menu1,'Label','Diagrama de Moody','callback','winopen(''data/docs/Moody.pdf'')');
uimenu(menu1,'Label','Presión de saturación del agua (PSV)','callback','run(''presat.m'')');
uimenu(menu1,'Label','Cálculo del coeficiente de fricción','callback','run(''coefFriccionPP.m'')');
sub11=uimenu(menu1,'Label','Ecuaciones de turbomáquinas');
uimenu(sub11,'Label','Ecuaciones Bombas Centrífugas','callback','winopen(''data/docs/EC_BC.pdf'')');
uimenu(sub11,'Label','Ecuaciones Turbinas de reacción','callback','winopen(''data/docs/EC_TR.pdf'')');
uimenu(sub11,'Label','Ecuaciones Turbinas de acción','callback','winopen(''data/docs/EC_TA.pdf'')');
menu2=uimenu(f,'Label','Ayuda');
uimenu(menu2,'Label','Ayuda en PDF','callback','winopen(''data/docs/Ayuda.pdf'')');
% uimenu(menu2,'Label','Video Tutorial','callback','winopen(''data/docs/vid01.mp4'')');
uimenu(f,'Label','Acerca de...','callback','run(''acerca.m'')');

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 225],'backgroundcolor',cfondo);

% 1ra Columna --------------------------------------------------------

eQ=uicontrol(pp,'style','text','String','Q','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dQ=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
uQ=uicontrol(pp,'style','text','String','m^3/s','position',[150 180 30 20],'backgroundcolor',cfondo);

ezA=uicontrol(pp,'style','text','String','zA','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzA=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
uzA=uicontrol(pp,'style','text','String','m','position',[150 140 30 20],'backgroundcolor',cfondo);

ezZ=uicontrol(pp,'style','text','String','zZ','position',[10 100 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzZ=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
uzZ=uicontrol(pp,'style','text','String','m','position',[150 100 30 20],'backgroundcolor',cfondo);

% 2da Columna  -----------------------------------------------------
if subtipo==1 | subtipo==2
    eHrext=uicontrol(pp,'style','text','String','Hrext','position',[210 180 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dHrext=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
    uHrext=uicontrol(pp,'style','text','String','m','position',[350 180 30 20],'backgroundcolor',cfondo);
elseif subtipo==3 | subtipo==4
    eHra=uicontrol(pp,'style','text','String','Hra','position',[210 180 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dHra=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
    uHrext=uicontrol(pp,'style','text','String','m','position',[350 180 30 20],'backgroundcolor',cfondo);
end

if subtipo==1
    eeta=uicontrol(pp,'style','text','String','eta','position',[210 140 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
    ueta=uicontrol(pp,'style','text','String','','position',[350 140 30 20],'backgroundcolor',cfondo);
elseif subtipo==2
    ePa=uicontrol(pp,'style','text','String','Pa','position',[210 140 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dPa=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
    ueta=uicontrol(pp,'style','text','String','kW','position',[350 140 30 20],'backgroundcolor',cfondo);
elseif subtipo==3 | subtipo==4
    eHri=uicontrol(pp,'style','text','String','Hri','position',[210 140 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dHri=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
    uHri=uicontrol(pp,'style','text','String','m','position',[350 140 30 20],'backgroundcolor',cfondo);
end

if subtipo==3
    eeta=uicontrol(pp,'style','text','String','eta','position',[210 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
    ueta=uicontrol(pp,'style','text','String','','position',[350 100 30 20],'backgroundcolor',cfondo);
elseif subtipo==4
    ePa=uicontrol(pp,'style','text','String','Pa','position',[210 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dPa=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
    uPa=uicontrol(pp,'style','text','String','kW','position',[350 100 30 20],'backgroundcolor',cfondo);
end
% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 20 80 25],...
    'callback',{@calcular,subtipo},'fontsize',10,'fontweight','bold');


%% Menú Botones
posb=200;

regresar=uicontrol('style','pushbutton','String','','position',[0 posb 35 35],...
    'callback',@gohome,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/inicio.png'));

graphs=uicontrol('style','pushbutton','String','','position',[0 posb-1*35 35 35],...
    'callback',@gographics,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/grafica.png'));

convuni=uicontrol('style','pushbutton','String','','position',[0 posb-2*35 35 35],...
    'callback',@goconv,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/unidades.png'));

tablasb=uicontrol('style','pushbutton','String','','position',[0 posb-3*35 35 35],...
    'callback',@gotablas,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/tabla.png'));

calcu=uicontrol('style','pushbutton','String','','position',[0 posb-4*35 35 35],...
    'callback',@gocalc,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/calculadora.png'));

helping=uicontrol('style','pushbutton','String','','position',[0 posb-5*35 35 35],...
    'callback',@goayuda,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'));


%% Funciones  --------------------------------------------------------
    function calcular(src,event,subtipo)
        zZ=str2double(get(dzZ,'String'));
        zA=str2double(get(dzA,'String'));
        Q=str2double(get(dQ,'String'));
        
        if subtipo==1
            Hrext=str2double(get(dHrext,'String'));
            eta=str2double(get(deta,'String'));
            
            H=(zZ-zA)+Hrext;
            Pa=(Q*rho*g*H)/eta;
            
            res1=horzcat('H= ',num2str(H),' m');
            res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
            
            figresultados({res1,'',res2},2);
            
        elseif subtipo==2
            Hrext=str2double(get(dHrext,'String'));
            Pa=str2double(get(dPa,'String'))*10^3;
            
            H=(zZ-zA)+Hrext;
            eta=(Q*rho*g*H)/Pa;
            
            res1=horzcat('H= ',num2str(H),' m');
            res2=horzcat('eta= ',num2str(eta*100),' %');
            
            figresultados({res1,'',res2},2);
            
        elseif subtipo==3
            Hra=str2double(get(dHra,'String'));
            Hri=str2double(get(dHri,'String'));
            eta=str2double(get(deta,'String'));
            
            H=(zZ-zA)+Hra+Hri;
            Pa=(Q*rho*g*H)/eta;
            
            res1=horzcat('H= ',num2str(H),' m');
            res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
            
            figresultados({res1,'',res2},2);
            
        elseif subtipo==4
            Hra=str2double(get(dHra,'String'));
            Hri=str2double(get(dHri,'String'));
            Pa=str2double(get(dPa,'String'))*10^3;
            
            H=(zZ-zA)+Hra+Hri;
            eta=(Q*rho*g*H)/Pa;
            
            res1=horzcat('H= ',num2str(H),' m');
            res2=horzcat('eta= ',num2str(eta*100),' %');
            
            figresultados({res1,'',res2},2);
        end
        
    end

    function gohome(src,event)
        close(gcf);
        run('App_Bombas.m');
    end

    function gographics(src,event)
        msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
    end

    function goconv(src,event)
        winopen('data/mfun/convert.exe');
    end

    function gotablas(src,event)
        winopen('data/docs/Tablas.pdf');
    end

    function gocalc(src,event)
        winopen('data/mfun/calc.exe');
    end

    function goayuda(src,event)
        winopen('data/docs/Ayuda.pdf');
    end

end