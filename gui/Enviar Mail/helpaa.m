clear;clc;
a=['Hola buen d�a' 10 'HOLA'];

m1='HOLA';
m2='HP';

N=horzcat('[*',m1,'*',' 10 ',' ** ',' 10 ','*',m2,'*]');
A=strrep(N,'*',sprintf('\'''));