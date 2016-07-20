close all;clear all;clc;
A=importdata('datos/DF.dat');
Temperatura=A.data(:,:);
Fecha=A.textdata;
S=datenum(Fecha);
bar(S,Temperatura)
datetick('x','mmm-yyyy');
ylabel('Temperatura °C');

% clear all;clc;
% T=importdata('datos.txt'); % Importar datos del archivo datos.txt
% ToC=(T(:,2)-32)*(5/9); % Convertir a °C la columna de temperaturas
% plot(T(:,1),ToC,'r','linewidth',2); % Gráficar Tiempo vs Temperatura media
% xlabel('Año'); % Etiquetas
% ylabel('Temperatura media global (°C)');
% datacursormode on  % Activa el modo interactivo de datos en la gráfica