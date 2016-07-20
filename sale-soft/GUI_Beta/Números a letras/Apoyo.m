clear,clc;
N='10';
uni={'UNO','DOS','TRES','CUATRO','CINCO','SEIS','SIETE','OCHO','NUEVE'};
dec={'DIEZ','VEINTE','TREINTA','CUARENTA','CINCUENTA','SESENTA','SETENTA','OCHENTA','NOVENTA'};
cen={'CIENTO','DOSCIENTOS','TRESCIENTOS','CUATROCIENTOS','QUINIENTOS','SEISCIENTOS','OCHOCIENTOS','NOVECIENTOS'};
u=N(length(N));
d=N(length(N)-1);
c=N(length(N)-2);

U=cell2mat(uni(str2num(u)));
D=cell2mat(dec(str2num(d)));
C=cell2mat(cen(str2num(c)));
A=horzcat(C,' ',D,' ',U)

