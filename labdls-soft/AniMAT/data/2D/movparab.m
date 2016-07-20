close all;clear all;clc;
v0=12;
theta=30*pi/180;
g=9.81;
t=linspace(0,(2*v0*sin(theta))/g,200);
x=v0*cos(theta)*t;
y=v0*sin(theta)*t-(0.5*g*t.^2);
xlim([0 ((v0^2*sin(2*theta)/g))*1.05]);
ylim([0 (v0^2*(sin(theta))^2/(2*g))*1.05]);
xlabel('X');
ylabel('Y');
i=1;
while i<length(t)
    cla;
    hold on
    plot(x(i),y(i),'o','MarkerFaceColor','r','MarkerEdgeColor','r');
    plot(x(1:i),y(1:i),'k');
    drawnow;
    pause(0.01);
    i=i+1;
end