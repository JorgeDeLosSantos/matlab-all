function cono(p0,r,h,C)
% p0=[0 0 -3];r=2;h=5;C=[1 0 1];
set(gca,'NextPlot','add');
t=linspace(0,2*pi,100);
x=r*cos(t)+p0(1);
y=r*sin(t)+p0(2);
z=p0(3)*ones(1,length(t));
fill3(x,y,z,C,'EdgeColor',C*0.5);
k=[r 0];
[X,Y,Z]=cylinder(k);
surf(X+p0(1),Y+p0(2),h*Z+p0(3),'FaceColor',C,'EdgeColor',C*0.5);
axis([-5 5 -5 5 -5 5]);
view(3);
end