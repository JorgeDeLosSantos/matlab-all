function anim_3D
close all;clear all;clc
t=linspace(0,3,200);
Ne=4;
alpha=randi([0,180],1,Ne)*pi/180;
beta=randi([0,180],1,Ne)*pi/180;
g=9.81;
v0=5;
for k=1:length(alpha)
    X(:,k)=v0*cos(alpha(k))*cos(beta(k))*t;
    Y(:,k)=v0*cos(alpha(k))*sin(beta(k))*t;
    Z(:,k)=v0*sin(alpha(k))*t-(1/2*g*t.^2);
end
%%
xlabel('x');
ylabel('y');
zlabel('z');
hold on
for i=1:length(t);
    cla
    for j=1:Ne
        esfera(X(i,j),Y(i,j),Z(i,j),0.2);
    end
    view([40 90 40]);
    daspect([1 1 1])
    axis([min(X(:))-1 max(X(:))+1 min(Y(:))-1 max(Y(:))+1 min(Z(:))-1 max(Z(:))+1]);
    pause(0.01);
end
msg=msgbox('Fin');
pause(0.5);
delete(msg);

    function esfera(px,py,pz,r)
        [x,y,z] = sphere;
        surf(r*x+px,r*y+py,r*z+pz);
    end

end