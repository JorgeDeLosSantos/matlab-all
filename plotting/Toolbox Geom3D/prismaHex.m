function prismaHex(p0,r,h,C)
% p0=[1 1 5];r=1;h=4;C=[0 0 1];
set(gca,'NextPlot','add');
t=[1,1];
[x,y,z]=cylinder(t,6);
surf(r*x+p0(1),r*y+p0(2),h*z+p0(3),'FaceColor',C)
base(p0,r,h,C);
view(3);
    function base(p0b,rb,hb,cb)
        tb=linspace(0,2*pi,7);
        xb=rb*cos(tb)+p0b(1);
        yb=rb*sin(tb)+p0b(2);
        zb=ones(1,length(tb));
        fill3(xb,yb,p0b(3)*zb,cb);
        fill3(xb,yb,p0b(3)*zb+hb,cb);
    end
end