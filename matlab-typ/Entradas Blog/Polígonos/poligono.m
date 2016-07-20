function h=poligono(N,r,cx,cy)
% Traza un polígono de N lados
t = (0:1/N:1)*2*pi;
x = r*sin(t)+cx;
y = r*cos(t)+cy;
h=plot(x,y,'r');
axis square;
end