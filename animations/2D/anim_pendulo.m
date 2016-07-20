function anim_pendulo
% @Jorge De Los Santos
f=figure('NumberTitle','off','name','Péndulo simple','MenuBar','none','color',[1 1 1]);
g=9.81; %Constante de aceleración de la gravedad
L=1; % Longitud
%% Solver de la ED
[t,y]=ode45(@psimple,[0 4*pi*sqrt(L/g)],[0 pi/4]); 
% Condición inicial -> theta=pi/4
x1=cos(y(:,2)); 
y1=sin(y(:,2));
t_anim=length(t);
vx=[0 0];
vy=[0 0];
mx=0.04*cos(0:0.1:2*pi); 
my=0.04*sin(0:0.1:2*pi);
hold on
plot([-0.2 0.2],[0 0],'k','linewidth',6); %Dibuja el "soporte" del péndulo
m=fill(my,mx,[1 0 0]); % Dibuja círculo.
h=plot(vy,vx,'linewidth',2); % Dibuja la línea de longitud del péndulo.
%% Animación 
for i=1:t_anim
    axis([-1.1 1.1 -1.6 0]);
    set(h,'xdata',[0 y1(i)],'ydata',[0 -x1(i)]);
    set(m,'xdata',my+y1(i),'ydata',mx-x1(i));
    plot(y1(i),-x1(i),'-mo','Markersize',1);
    set(gca,'visible','off','NextPlot','add');
    drawnow;pause(0.1);
end

%% Sistema de Ecuaciones diferenciales del péndulo simple
    function dy=psimple(t,y)
        g=9.81;
        L=1;
        dy=zeros(2,1);
        dy(1)=y(2); % Sistema de Ecuaciones diferenciales
        dy(2)=-(g/L)*sin(y(1)); % de primer orden 
    end

end
