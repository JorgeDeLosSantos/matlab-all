clear all;clc;
y=dsolve('D2y+2*Dy+2*y=0','Dy(0)=1','y(0)=0');
t=0:0.5:20;
Y=subs(y,'t',t); 
M=[t',Y']; % Matriz solución
plot(M(:,1),M(:,2));