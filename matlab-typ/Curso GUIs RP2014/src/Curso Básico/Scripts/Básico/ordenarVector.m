% Ordena los elementos de un vector en forma ascendente
clear all;clc;
v=[4 3 10 -1 -1 8 12];
vo=zeros(size(v));
for k=1:length(v)
    [vo(k),i]=min(v);
    v(i)=[];
end
disp(vo);
