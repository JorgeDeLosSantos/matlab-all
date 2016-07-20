clear all;clc
P1=[2,2,0];
P2=[4,4,2];
P3=[6,8,8];
hold on;
line([0 P1(1)],[0 P1(2)],[0 P1(3)]); % Del origen a P1
line([P1(1) P2(1)],[P1(2) P2(2)],[P1(3) P2(3)]);  % De P1 a P2
line([P2(1) P3(1)],[P2(2) P3(2)],[P2(3) P3(3)]); % De P2 a P3

% Para los ejes coordenados 
L=1; % longitud de las líneas
% Punto 1
line([P1(1) P1(1)+L],[P1(2) P1(2)],[P1(3) P1(3)],'color','k','linewidth',2);
line([P1(1) P1(1)],[P1(2) P1(2)+L],[P1(3) P1(3)],'color','k','linewidth',2);
line([P1(1) P1(1)],[P1(2) P1(2)],[P1(3) P1(3)+L],'color','k','linewidth',2);

view(3)