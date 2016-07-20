clear;clc;
% a='hola';
% b='22';
% c='temperatura';
% 
% A={a,b,c}
% 
% ar=fopen('datos.dat','w');
% for i=1:3
%     fprintf(ar,'%s \n',A{:,i});
% end
% fclose(ar);

A={'hola'};
b={'mundo'};

n=strcat(A,b);

cell2mat(n)