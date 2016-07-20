%  Programa que dibuja un esquema de la planta rectilinea
%  con el que cuenta el Laboratorio de Control del Departamento
%  de Electronica y Telecomunicaciones del CICESE.
 
%  Realizo: Ricardo Cuesta
%  Fecha: 28/01/08
%  Version: 0.1

function dibujomasa(t1)
clf;

axis([-10,10,-10,10])
plot([0,0,5],[2,0,0]) % base
axis equal; axis off;
l1=2; h1=1;
hold on
masa1=plot(0,0);
resorte1=plot(0,0);
amort1=plot(0,0);
amort2=plot(0,0);

for i=1:length(t1)
  p1=t1(i)+1.25;
  pause(0.01) % tiempo entre datos
  delete(masa1);
  delete(resorte1);
  delete(amort1); delete(amort2);

  % masa
  xm=[0,l1,l1,0,0];
  ym=[0,0,h1,h1,0];
  masa1=plot(xm+p1,ym);

  % resorte
  xr=[0,1.5,2,3,4,5,5.5,7];
  yr=[0,0,1,-1,1,-1,0,0];
  resorte1=plot(xr/7*p1,yr/7*2+0.5);

  % amortiguador
  la=p1; lb=2;
  xa1=[0,0,0,2,2];
  ya1=[-1,1,0,0,-2];
  xa2=[0,lb,lb,lb+4,lb,lb,lb+4];
  ya2=[0,0,1,1,1,-1,-1];
  amort1=plot(xa1/2+la,ya1/4+1.5);
  amort2=plot(xa2/3,ya2/4+1.5);
end 