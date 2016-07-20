function tiroParabolico
% Calcula la distancia horizontal y la altura máxima
% alcanzada en un movimiento de tiro parabólico,
% teniendo como datos de entrada la velocidad inicial y
% el ángulo de tiro.
%
% $ Por: Jorge De Los Santos $
% $ E-mail: delossantosmfq@gmail.com $
% $ Blog: http://matlab-typ.blogspot.mx $
% $ Rev. 1.0.0 $ 07/06/2014 $

figure('MenuBar','none','NumberTitle','off','Name','Tiro parabólico',...
    'position',[200 200 600 300],'resize','off');
centerfig(gcf);

p=uipanel(gcf,'units','pixels','position',[10 10 180 280]);
cf=get(p,'BackgroundColor');

axes('parent',gcf,'units','pixels','position',[240 35 340 250]);

% Datos de entrada
uicontrol(p,'style','text','str','Datos de entrada',...
    'pos',[32 255 120 20]);

uicontrol(p,'style','push','str','<html>v<sub>0</sub></html>',...
    'pos',[10 230 30 25],'tag','mod');
dv0=uicontrol(p,'style','edit','str','8','pos',[40 230 100 20]);
uicontrol(p,'style','text','str','m/s','pos',[143 230 20 20]);

uicontrol(p,'style','push','str','<html>&theta</html>',...
    'pos',[10 200 30 25],'tag','mod');
dtheta=uicontrol(p,'style','edit','str','30','pos',[40 200 100 20]);
uicontrol(p,'style','text','str','°','pos',[140 200 20 20]);

% Resultados
uicontrol(p,'style','text','str','Resultados',...
    'pos',[32 160 120 20]);

uicontrol(p,'style','push','str','<html>d</html>',...
    'pos',[10 135 30 25],'tag','mod');
dd=uicontrol(p,'style','text','str','','pos',[40 135 100 20],...
    'BackgroundColor',[0.8 0.9 0.8],'ForegroundColor','b',...
    'FontSize',9,'FontWeight','b');
uicontrol(p,'style','text','str','m','pos',[140 135 20 20]);

uicontrol(p,'style','push','str','<html>h<sub>max</sub></html>',...
    'pos',[5 105 30 25],'tag','mod');
dhmax=uicontrol(p,'style','text','str','','pos',[40 105 100 20],...
    'BackgroundColor',[0.8 0.9 0.8],'ForegroundColor','b',...
    'FontSize',9,'FontWeight','b');
uicontrol(p,'style','text','str','m','pos',[140 105 20 20]);

C(1:35,1:30,1)=uint8(cf(1)*255); % Permite ocultar los bordes de 
C(1:35,1:30,2)=uint8(cf(2)*255); % los botones utilizados como 
C(1:35,1:30,3)=uint8(cf(3)*255); % labels.
set(findobj('tag','mod'),'cdata',C);

uicontrol(p,'style','push','str','Calcular','pos',[40 60 100 22],...
    'callback',@calcularFcn,'fontsize',10,'backgroundcolor',[0.7 0.9 0.9]);
uicontrol(p,'style','push','str','Ver animación','pos',[40 38 100 22],...
    'callback',@animFcn,'fontsize',10,'backgroundcolor',[0.7 0.9 0.9]);
uicontrol(p,'style','push','str','Nuevo cálculo','pos',[40 16 100 22],...
    'callback',@nuevoFcn,'fontsize',10,'backgroundcolor',[0.7 0.9 0.9]);

    function calcularFcn(~,~)
        v0=str2double(get(dv0,'str'));
        theta=str2double(get(dtheta,'str'))*pi/180;
        g=9.81;
        
        d=(v0^2*sin(2*theta))/g;
        hmax=((v0^2)*(sin(theta))^2)/(2*g);
        
        t=linspace(0,(2*v0*sin(theta))/g,200);
        x=v0*cos(theta)*t;
        y=v0*sin(theta)*t-(0.5*g*t.^2);
        hold on
        plot(x,y,'r');
        xlim([0 ((v0^2*sin(2*theta))/g)*1.05]);
        ylim([0 (v0^2*(sin(theta))^2/(2*g))*1.05]);
        set(dd,'str',d);
        set(dhmax,'str',hmax);
    end

    function animFcn(~,~)
        % Simula una animación de tiro parabólico
        cla;
        v0=str2double(get(dv0,'str'));
        theta=str2double(get(dtheta,'str'))*pi/180;
        g=9.81;
        t=linspace(0,(2*v0*sin(theta))/g,200);
        x=v0*cos(theta)*t;
        y=v0*sin(theta)*t-(0.5*g*t.^2);
        xlim([0 ((v0^2*sin(2*theta)/g))*1.05]);
        ylim([0 (v0^2*(sin(theta))^2/(2*g))*1.05]);
        i=1;
        while i<length(t)
            hold on
            plot(x(i),y(i),'o');
            drawnow;
            i=i+1;
        end
    end

    function nuevoFcn(~,~)
        % Limpia la entrada de datos y el axes
        cla;
        set(findobj('style','edit'),'str','');
        set(dhmax,'str','');
        set(dd,'str','');
    end
end