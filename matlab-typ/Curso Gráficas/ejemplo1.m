clear;clc;
x=linspace(0,10,500);
y1=cos(x);
y2=sin(x);
plot(x,y1,x,y2);
legend('cos(x)','sin(x)');
xlabel('Eje X');
ylabel('Eje Y');
title('Mi primera gráfica');
annotation('textbox','units','pixels',...
    'Position',[100 100 100 40],...
    'String','Esto es lo que se muestra');
annotation('textarrow',[0.3 0.2],[0.2 0.2],'String','Flecha');
