function ta_1
% REF 221
% @ DLS
% Mod 11/11/13

%% Constantes persistentes
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));
%% Caracter�sticas generales
cfondo=[0.5 0.8 0.7];
etsize=8;
%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-TA','position',[500,300,500,300],'color',cfondo);
centerfig(f);
%% Men�

menu1 = uimenu(f,'Label','Herramientas');
uimenu(menu1,'Label','Conversor de unidades','callback','winopen(''data/mfun/convert.exe'')');
uimenu(menu1,'Label','Tablas','callback','winopen(''data/docs/Tablas.pdf'')');
uimenu(menu1,'Label','Diagrama de Moody','callback','winopen(''data/docs/Moody.pdf'')');
sub11=uimenu(menu1,'Label','Ecuaciones de turbom�quinas');
uimenu(sub11,'Label','Ecuaciones Bombas Centr�fugas','callback','winopen(''data/docs/EC_BC.pdf'')');
uimenu(sub11,'Label','Ecuaciones Turbinas de reacci�n','callback','winopen(''data/docs/EC_TR.pdf'')');
uimenu(sub11,'Label','Ecuaciones Turbinas de acci�n','callback','winopen(''data/docs/EC_TA.pdf'')');
menu2=uimenu(f,'Label','Ayuda');
uimenu(menu2,'Label','Ayuda en PDF','callback','winopen(''data/docs/Ayuda.pdf'')');
% uimenu(menu2,'Label','Video Tutorial','callback','winopen(''data/docs/vid01.mp4'')');
uimenu(f,'Label','Acerca de...','callback','run(''acerca.m'')');


%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 270],'backgroundcolor',cfondo);

% 1ra col  --------------------------------------------------------

eD=uicontrol(pp,'style','text','String','D','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uD=uicontrol(pp,'style','text','String','m','position',[150 220 30 20],'backgroundcolor',cfondo);

ed=uicontrol(pp,'style','text','String','d','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dd=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
ud=uicontrol(pp,'style','text','String','m','position',[150 180 30 20],'backgroundcolor',cfondo);

eH=uicontrol(pp,'style','text','String','H','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dH=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
uH=uicontrol(pp,'style','text','String','m','position',[150 140 30 20],'backgroundcolor',cfondo);

ebeta2=uicontrol(pp,'style','text','String','beta2','position',[10 100 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta2=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
ubeta2=uicontrol(pp,'style','text','String','�','position',[150 100 30 20],'backgroundcolor',cfondo);



% 2da Col

eKc=uicontrol(pp,'style','text','String','Kc','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKc=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
uKc=uicontrol(pp,'style','text','String','','position',[350 220 30 20],'backgroundcolor',cfondo);

eKu=uicontrol(pp,'style','text','String','Ku','position',[210 180 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKu=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
uKu=uicontrol(pp,'style','text','String','','position',[350 180 30 20],'backgroundcolor',cfondo);

eKw=uicontrol(pp,'style','text','String','Kw','position',[210 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKw=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
uKw=uicontrol(pp,'style','text','String','','position',[350 140 30 20],'backgroundcolor',cfondo);

eeta_m=uicontrol(pp,'style','text','String','eta_m','position',[210 100 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
deta_m=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
ueta_m=uicontrol(pp,'style','text','String','','position',[350 100 30 20],'backgroundcolor',cfondo);

% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 20 80 25],...
    'callback',@calcular,'fontsize',10,'fontweight','bold');


%% Men� Botones
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
    function calcular(src,event)
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            D=str2double(get(dD,'String'));
            d=str2double(get(dd,'String'));
            H=str2double(get(dH,'String'));
            beta2=str2double(get(dbeta2,'String'))*pi/180;  % Radianes
            Kc=str2double(get(dKc,'String'));
            Ku=str2double(get(dKu,'String'));
            Kw=str2double(get(dKw,'String'));
            eta_m=str2double(get(deta_m,'String'));
            
            c1=Kc*sqrt(2*g*H);
            u=Ku*sqrt(2*g*H);
            w1=c1-u;
            w1u=w1;
            w2=Kw*w1;
            w2u=-w2*cos(beta2);
            Q=(pi*d^2*c1)/4;
            F=Q*rho*(w1u-w2u);
            Pi=F*u;
            Hu=Pi/(Q*rho*g);
            eta_h=Hu/H;
            eta=eta_m*eta_h;
            n=(60*u)/(pi*D);
            
            res1=horzcat('F= ',num2str(F),' N');
            res2=horzcat('Hu= ',num2str(Hu),' m');
            res3=horzcat('Pi= ',num2str(Pi/10^3),' kW');
            res4=horzcat('eta_h= ',num2str(eta_h*100),' %');
            res5=horzcat('n= ',num2str(n),' rpm');
            res6=horzcat('Q= ',num2str(Q*1000),' l/s');
            res7=horzcat('eta= ',num2str(eta*100),' %');
            
            figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6,'',res7},7);
        end
    end

    function gohome(src,event)
        close(gcf);
        run('App_Bombas.m');
    end

    function gotrian(src,event)
        msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
    end

    function gographics(src,event)
        %Proc Gral
        D=str2double(get(dD,'String'));
        d=str2double(get(dd,'String'));
        H=str2double(get(dH,'String'));
        beta2=str2double(get(dbeta2,'String'))*pi/180;  % Radianes
        Kc=str2double(get(dKc,'String'));
        Ku=str2double(get(dKu,'String'));
        Kw=str2double(get(dKw,'String'));
        eta_m=str2double(get(deta_m,'String'));
        
        c1=Kc*sqrt(2*g*H);
        u=Ku*sqrt(2*g*H);
        w1=c1-u;
        w1u=w1;
        w2=Kw*w1;
        w2u=-w2*cos(beta2);
        Q=(pi*d^2*c1)/4;
        F=Q*rho*(w1u-w2u);
        Pi=F*u;
        Hu=Pi/(Q*rho*g);
        eta_h=Hu/H;
        eta=eta_m*eta_h;
        n=(60*u)/(pi*D);
        
        sgraph = questdlg('�Qu� desea graficar?', ...
            'Men� Gr�ficas Disponibles', ...
            'H - Q','H - n','H - Pi','H - Q');
        switch sgraph
            case 'H - Q'
                H=insertRango('H (m)','10:200');
                c1=Kc*sqrt(2*g*H);
                Q=(pi*d^2*c1)/4;
                grafica(H,Q*10^3,'H (m)','Q (l/s)','H vs Q');
            case 'H - n'
                H=insertRango('H (m)','10:200');
                u=Ku*sqrt(2*g*H);
                n=(60*u)/(pi*D);
                grafica(H,n,'H (m)','n (rpm)','H vs n');
            case 'H - Pi'
                H=insertRango('H (m)','10:200');
                c1=Kc*sqrt(2*g*H);
                u=Ku*sqrt(2*g*H);
                w1=c1-u;
                w1u=w1;
                w2=Kw*w1;
                w2u=-w2*cos(beta2);
                Q=(pi*d^2*c1)/4;
                F=Q*rho.*(w1u-w2u);
                Pi=F.*u;
                grafica(H,Pi/10^3,'H (m)','Pi (kW)','H vs Pi');
        end
        %         msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
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