function g05_DemoAxes
f = figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Ejemplo GUI',...
    'Position',[0 0 500 400],...
    'Color','w');
centerfig(f);

% Axes
hAx1 = axes('Position',[0.1 0.10 0.8 0.35]);
hAx2 = axes('Position',[0.1 0.55 0.8 0.35]);

% Vectores 
x = linspace(0,10);
f = sin(x);
g = cos(x);

% Trazo de las gráficas en los axes correspondientes
plot(hAx1,x,f,'r');
plot(hAx2,x,g,'k');
end