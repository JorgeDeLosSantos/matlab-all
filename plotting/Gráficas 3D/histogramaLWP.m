clear all;clc
Signal=round(rand(80,4)*100); 
Intervalos=[0,14,30,50,70,100];
H=histc(Signal,Intervalos);
bar(H)
set(gca,'XTickLabel',Intervalos)
