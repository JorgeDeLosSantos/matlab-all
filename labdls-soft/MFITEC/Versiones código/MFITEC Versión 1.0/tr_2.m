function tr_2(subtipo)
% MOD 08/12/13
%% Constantes persistentes
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));
%% Caracter�sticas generales
cfondo=[0.85 0.82 0.75];
etsize=8;
%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-TR','position',[500,300,300,300],'color',cfondo);

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
uimenu(f,'Label','Acerca de...','callback','run(''data/mfun/acerca.m'')');

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 200 270],'backgroundcolor',cfondo);

% 1ra col  --------------------------------------------------------
if subtipo~=4
    eQ=uicontrol(pp,'style','text','String','Q','position',[10 220 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dQ=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
    uQ=uicontrol(pp,'style','text','String','m^3/s','position',[150 220 30 20],'backgroundcolor',cfondo);
else
    eH=uicontrol(pp,'style','text','String','H','position',[10 220 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dH=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
    uH=uicontrol(pp,'style','text','String','m','position',[150 220 30 20],'backgroundcolor',cfondo);
end
if subtipo==1 | subtipo==2 | subtipo==3
    eH=uicontrol(pp,'style','text','String','H','position',[10 180 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dH=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
    uH=uicontrol(pp,'style','text','String','m','position',[150 180 30 20],'backgroundcolor',cfondo);
elseif subtipo==4 | subtipo==5
    ePa=uicontrol(pp,'style','text','String','Pa','position',[10 180 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dPa=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
    uPa=uicontrol(pp,'style','text','String','kW','position',[150 180 30 20],'backgroundcolor',cfondo);
end

if subtipo~=3
    eeta=uicontrol(pp,'style','text','String','eta','position',[10 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
    ueta=uicontrol(pp,'style','text','String','','position',[150 140 30 20],'backgroundcolor',cfondo);
else
    ePa=uicontrol(pp,'style','text','String','Pa','position',[10 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dPa=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
    uPa=uicontrol(pp,'style','text','String','kW','position',[150 140 30 20],'backgroundcolor',cfondo);
end

if subtipo==1
    en=uicontrol(pp,'style','text','String','n','position',[10 100 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dn=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    un=uicontrol(pp,'style','text','String','rpm','position',[150 100 30 20],'backgroundcolor',cfondo);
end

% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[60 20 80 25],...
    'callback',{@calcular,subtipo},'fontsize',10,'fontweight','bold');


%% Men� Botones
posb=250;

regresar=uicontrol('style','pushbutton','String','','position',[0 posb 35 35],...
    'callback',@gohome,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/inicio.png'));

tvel=uicontrol('style','pushbutton','String','','position',[0 posb-35 35 35],...
    'callback',@gotrian,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/triangulo.png'));

graphs=uicontrol('style','pushbutton','String','','position',[0 posb-2*35 35 35],...
    'callback',{@gographics,subtipo},'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/grafica.png'));

convuni=uicontrol('style','pushbutton','String','','position',[0 posb-3*35 35 35],...
    'callback',@goconv,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/unidades.png'));

tablasb=uicontrol('style','pushbutton','String','','position',[0 posb-4*35 35 35],...
    'callback',@gotablas,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/tabla.png'));

calcu=uicontrol('style','pushbutton','String','','position',[0 posb-5*35 35 35],...
    'callback',@gocalc,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/calculadora.png'));

helping=uicontrol('style','pushbutton','String','','position',[0 posb-6*35 35 35],...
    'callback',@goayuda,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'));


%% Funciones
    function calcular(~,~,subtipo)
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            if subtipo==1
                H=str2double(get(dH,'String'));
                Q=str2double(get(dQ,'String'));
                n=str2double(get(dn,'String'));
                eta=str2double(get(deta,'String'));
                
                P=Q*rho*g*H;
                Pa=P*eta;
                
                res1=horzcat('P= ',num2str(P/10^3),' kW');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2},2);
                
            elseif subtipo==2
                Q=str2double(get(dQ,'String'));
                H=str2double(get(dH,'String'));
                eta=str2double(get(deta,'String'));
                
                P=Q*rho*g*H;
                Pa=P*eta;
                
                res1=horzcat('P= ',num2str(P/10^3),' kW');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2},2);
                
            elseif subtipo==3
                Q=str2double(get(dQ,'String'));
                Pa=str2double(get(dPa,'String'))*10^3;
                H=str2double(get(dH,'String'));
                
                eta=Pa/(Q*rho*g*H);
                P=Pa/eta;
                
                res1=horzcat('eta= ',num2str(eta*100),' %');
                res2=horzcat('P= ',num2str(P/10^3),' kW');
                
                figresultados({res1,'',res2},2);
                
            elseif subtipo==4
                H=str2double(get(dH,'String'));
                Pa=str2double(get(dPa,'String'))*10^3;
                eta=str2double(get(deta,'String'));
                
                Q=Pa/(rho*g*H*eta);
                P=Q*rho*g*H;
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('P= ',num2str(P/10^3),' kW');
                
                figresultados({res1,'',res2},2);
                
            elseif subtipo==5
                Q=str2double(get(dQ,'String'));
                Pa=str2double(get(dPa,'String'))*10^3;
                eta=str2double(get(deta,'String'));
                
                H=Pa/(Q*rho*g*eta);
                P=Q*rho*g*H;
                
                res1=horzcat('H= ',num2str(H),' m');
                res2=horzcat('P= ',num2str(P/10^3),' kW');
                
                figresultados({res1,'',res2},2);
            end
        end
        
    end

    function gohome(src,event)
        close(gcf);
        run('App_Turbinas_R.m');
    end

    function gotrian(src,event)
        msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
    end

    function gographics(~,~,subtipo)
        if subtipo==1
            H=insertRango('H (m)','1:100');
            Q=str2double(get(dQ,'String'));
            n=str2double(get(dn,'String'));
            eta=str2double(get(deta,'String'));
            
            k=1;
            for eta=0.1:0.1:1
                Pa(:,k)=Q*rho*g*H*eta;
                nota{:,k}=horzcat('\eta=',num2str(eta*100),' %');
                k=k+1;
            end
            grafica2(H,Pa/10^3,'H ( m )','Pa ( kW )',nota);
            
        elseif subtipo==2
            Q=str2double(get(dQ,'String'));
            H=insertRango('H (m)','1:100');
            eta=str2double(get(deta,'String'));
            
            k=1;
            for eta=0.1:0.1:1
                Pa(:,k)=Q*rho*g*H*eta;
                nota{:,k}=horzcat('\eta=',num2str(eta*100),' %');
                k=k+1;
            end
            grafica2(H,Pa/10^3,'H ( m )','Pa ( kW )',nota);
            
        elseif subtipo==3
            Q=insertRango('Q (m^3/s)','1:10');
            Pa=str2double(get(dPa,'String'))*10^3;
            H=str2double(get(dH,'String'));
            k=1;
            for H=10:10:100
                eta(:,k)=Pa./(Q*rho*g*H);
                nota{:,k}=horzcat('H=',num2str(H),' m');
                k=k+1;
            end
            grafica2(Q,eta*100,'Q ( m^3/s )','\eta ( % )',nota);

        elseif subtipo==4
            H=insertRango('H (m)','50:200');
            Pa=str2double(get(dPa,'String'))*10^3;
            eta=str2double(get(deta,'String'));
            
            k=1;
            for eta=0.1:0.1:1
                Q(:,k)=Pa./(rho*g*H*eta);
                nota{:,k}=horzcat('\eta=',num2str(eta*100),' %');
                k=k+1;
            end
            grafica2(H,Q,'H ( m )','Q ( m^3/s )',nota);
            
        elseif subtipo==5
            Q=insertRango('Q (m^3/s)','1:20');
            Pa=str2double(get(dPa,'String'))*10^3;
            eta=str2double(get(deta,'String'));
            
            k=1;
            for eta=0.1:0.1:1
                H(:,k)=Pa./(Q*rho*g*eta);
                nota{:,k}=horzcat('\eta=',num2str(eta*100),' %');
                k=k+1;
            end
            grafica2(Q,H,'Q ( m^3/s )','H ( m )',nota);
            
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