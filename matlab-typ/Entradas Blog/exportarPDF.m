clear all;clc;
ezplot('x*cos(x)',[0 10]);
%print(gcf,'-dpdf','mipdf.pdf');

% ancho = 15;
% alto = 10;
% figure('Units','Centimeters',...
%     'Position',[0 0 ancho alto],...
%     'PaperUnits','Centimeters',...
%     'PaperPosition',[0 0 ancho alto],...
%     'PaperSize',[ancho alto]);
% 
% ezplot('x*cos(x)',[0 10]);
% xlabel('Eje X');
% ylabel('Eje Y');
% title('Mi gráfica');
% nombre_archivo='grafica';
% print(gcf,'-dpdf',nombre_archivo);
% close(gcf);
% winopen([nombre_archivo,'.pdf']);
