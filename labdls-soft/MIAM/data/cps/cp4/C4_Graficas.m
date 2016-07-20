%% Cap�tulo 4. Gr�ficas
% Ejemplos de gr�ficas en 2D y 3D
%
%% Mi primer gr�fica
x=-2*pi:pi/180:2*pi;
y=x.*cos(x);
plot(x,y);

%% A�adiendo etiquetas, leyenda y t�tulo
x=-2*pi:pi/180:2*pi;
y=x.*cos(x);
plot(x,y);
xlabel('Eje X');
ylabel('Eje Y');
title('Mi primer gr�fica');
legend('f(x)=x*cos(x)');

%% Modificando el color de l�nea
x=-2*pi:pi/180:2*pi;
y=x.*cos(x);
plot(x,y,'r'); % L�nea color roja
xlabel('Eje X');
ylabel('Eje Y');
title('Mi primer gr�fica');
legend('f(x)=x*cos(x)');

%% Modificando el grosor de l�nea
x=-2*pi:pi/180:2*pi;
y=x.*cos(x);
plot(x,y,'c','linewidth',3); % Grosor de l�nea 3
xlabel('Eje X');
ylabel('Eje Y');
title('Mi primer gr�fica');
legend('f(x)=x*cos(x)');

%% Gr�fica de ecuaciones param�tricas
t=linspace(0,2*pi,200);
x=cos(t);
y=sin(t);
plot(x,y,'g');
title('Gr�fica: ecuaciones param�tricas circunferencia');
axis('equal')

%% Gr�fica coordenadas polares
theta=0:pi/180:10*pi;
r=theta;
h=polar(theta,r);
set(h,'linewidth',2);

%% Gr�ficas m�ltiples en un mismo axes
clf;
x=-2*pi:pi/180:2*pi;
y1=x.*cos(x);
y2=x.*sin(x);
y3=0.5*x+2;
hold on
plot(x,y1,'r');
plot(x,y2,'g');
plot(x,y3,'b');
xlabel('Eje X');
ylabel('Eje Y');
title('Gr�ficas m�ltiples');
hold off

%% Anotaciones en gr�ficas
x=-2*pi:pi/180:2*pi;
y1=x.*cos(x);
plot(x,y1,'r');
xlabel('Eje X');
ylabel('Eje Y');
text(-2,4,'Anotaci�n en gr�fica')

