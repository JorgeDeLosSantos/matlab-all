function bmc
close all;clear all;clc;
AB=5;
BC=15;
hold on
k=1;
for alpha=0:pi/180:2*pi
    axis([-5 20 -10 15]);
    ABx=[0 AB*cos(alpha)];
    ABy=[0 AB*sin(alpha)];
    BCx=[AB*cos(alpha) AB*cos(alpha)+sqrt(BC^2-(AB*sin(alpha))^2)];
    BCy=[AB*sin(alpha) 0];
    h=plot(ABx,ABy,'r',BCx,BCy,'b');axis('square');
    set(h,'linewidth',2);
    pause(0.005);
    cla;
    M(k,1)=AB*cos(alpha);
    M(k,2)=AB*sin(alpha);
    k=k+1;
    plot(M(:,1),M(:,2),'g.','MarkerSize',1);
end
end