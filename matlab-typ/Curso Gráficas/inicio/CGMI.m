%% Curso Gráficas en MATLAB
f=figure();
N=1;
% Coord. Cart.
clf();
x=linspace(0,10);
hold on;
for i=1:10
    plot(x,i*cos(x),'color',[rand() 0.3 0.3],'linewidth',2);
end
grid();
hold off;
saveas(gca,'img1.png');
pause(N);

% Gráfica de Barras
X=10*rand(1,10);
bar(X,0.8,'r');
saveas(gca,'img2.png');
pause(N);

% Gráfica de pastel
pie(X)
colormap(hsv);
saveas(gca,'img3.png');
pause(N);

% 3D Logo
z=membrane;
surf(z);
colormap(hot);
shading('interp');
saveas(gca,'img4.png');
pause(N);

% Rejilla
[x,y]=meshgrid(1:10);
plot(x,y,y,x,'linewidth',3);
saveas(gca,'img5.png');
pause(N);

% Curva en el espacio
hc=ezplot3('cos(t)','sin(t)','t');
set(hc,'linewidth',3);
saveas(gca,'img6.png');
pause(N);

% Esferas
[x,y,z]=sphere;
surf(x,y,z);
hold on;
surf(x+4,y+3,z-1);
surf(x+4,0.2*y,z+5);
colormap(winter);
daspect([1 1 1]);
hold off;
saveas(gca,'img7.png');
pause(N);

% Subplots
subplot(2,1,1);
plot(rand(10));
subplot(2,1,2);
plot(rand(10));
saveas(gca,'img8.png');
pause(N);

% Plot LOGO
plot(peaks);
set(gca,'Color','k');
pause(N);
saveas(gca,'img9.png');
clf();

% Casa
casa();
saveas(gca,'img10.png');
pause(N);
clf();

% Fractal
Mandelbrot;
pause(N);
saveas(gca,'img11.png');
clf();

% Array Lineas
hold on;
for i=0:5:100
    h=line([0 i],[100-i 0]);
    set(h,'color',rand(1,3),'linewidth',2)
end
hold off;
grid();
axis('square')
saveas(gca,'img12.png');
pause(N);

%     % Pseudo-Color
%     load wind
%     colormap(gray);
%     for i=1:15
%         imagesc(u(:,:,i));
%         pause(0.1);
%     end
