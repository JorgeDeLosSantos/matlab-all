clear all;clc;
nombres={'Ana','Jorge','Javier'};
Ana=[10,7,9];
Jorge=[8,8,10];
Javier=[9,9,8];
bar([Ana;Jorge;Javier]);
set(gca,'XtickLabel',nombres);

% asignaturas={'Álgebra','Geometría','Cálculo','Estática','Química'};
% calificaciones=[9,9.5,10,8.5,8];
% bar(calificaciones,0.4,'r');
% set(gca,'XTickLabel',asignaturas);
% title('Calificaciones');
saveas(gca,'img.png');