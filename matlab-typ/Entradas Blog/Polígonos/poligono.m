function h=poligono(N,r,cx,cy)
% Traza un pol�gono de N lados
t = (0:1/N:1)*2*pi;
x = r*sin(t)+cx;
y = r*cos(t)+cy;
h=plot(x,y,'r');
axis square;
end