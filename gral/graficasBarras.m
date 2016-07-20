clear; clc;
nombres={'Jorge','Ana','Pablo','Diana','David'};
notas=[10 9 8 10 9];
ancho_barras=0.1;
h=bar(notas);
title('Notas de Alumnos');
ylabel('NOTAS');
xlabel('ALUMNOS');
set(gca,'XTickLabel',nombres);
set(h,'FaceColor','b','EdgeColor','g',...
    'LineWidth',4);