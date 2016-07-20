function h = circulo(x0,y0,r,color)
t = linspace(0,2*pi);
x = r*cos(t) + x0;
y = r*sin(t) + y0;
h = fill(x,y,color);
end