function circ_pol
n=5;  % Número de polígonos dentro del círculo
% Dibujamos el circulo de radio 10 y centrado en (0,0)
t=linspace(0,2*pi);
x=10*cos(t);
y=10*sin(t);
plot(x,y,'r','linewidth',2);
hold on;
% Trazamos los polígonos dentro del círculo
k=1;
while k<=n
    CX=randi([-9,9]); % Coordenada x del polígono 
    CY=randi([-9,9]);  % Coodenada y del polígono
    R=1;
    NL=randi([4,6]); % Dibuja cuadrados, pentágonos y hexágonos.
    if (sqrt(CX^2+CY^2)<9)  % Comprueba si está dentro del círculo
        poligono(NL,R,CX,CY);
        k=k+1;
    end
end
axis square;

    function hh=poligono(N,rr,cx,cy)
        % Traza un polígono de N lados con centro en (cx,xy)
        % e inscrito en un circulo de radio r
        tt = (0:1/N:1)*2*pi;
        xx = rr*sin(tt)+cx;
        yy = rr*cos(tt)+cy;
        hh=plot(xx,yy,'b');
    end
end
