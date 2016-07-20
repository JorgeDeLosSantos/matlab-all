%function buscarWeb
clear all;clc;
buscar=input('Inserte su búsqueda: ','s');
buscar=strrep(buscar,' ','+');
dirWeb=['https://www.google.com.mx/#q=',buscar];
web(dirWeb,'-browser');
%end