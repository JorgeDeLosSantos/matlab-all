clear;clc;
g1 = hgload('grafica1.fig'); % Cargamos el primer .FIG
g2 = hgload('grafica2.fig'); % Cargamos el segundo .FIG
ax1 = get(g1,'CurrentAxes'); % Obtenemos el axes de la 1ra gráfica
ax2 = get(g2,'CurrentAxes'); % Obtenemos el axes de la 2da gráfica
hL = get(ax2,'Children'); % Obtenemos los "trazos" o "lineas" de la 2da gráfica
copyobj(hL,ax1); % Copiamos las "lineas" anteriores dentro del axes de la primera gráfica
delete(g2); % Borramos la ventana de la 2da. gráfica