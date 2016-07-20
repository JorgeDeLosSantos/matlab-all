clear all;clc;
x=linspace(0,10);
y=cos(x);
plot(x,y,'g','linewidth',3);
xlabel('Eje X');
ylabel('Eje Y');
title('Mi gráfica');
grid();
set(gcf,'Color','w','MenuBar','None',...
    'Name','Mi ventana','NumberTitle','off');
set(gca,'Color',rand(1,3));