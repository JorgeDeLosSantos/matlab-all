function fuegos_art
close all;clear all;clc
figure('MenuBar','none');
t=linspace(0,2,100);
beta= [-180:30:180]*pi/180;%randi([0,180],1,Ne)*pi/180;
alpha=45*ones(1,length(beta))*pi/180;%randi([0,180],1,Ne)*pi/180;
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
for i=-5:0.1:0
    cla
    esfera(0,0,i,0.5);
    view([40 90 40]);
    daspect([1 1 1])
    axis([min(min(X))-1 max(max(X))+1 min(min(Y))-1 max(max(Y))+1 min(min(Z))-1 max(max(Z))+1]);
    pause(0.01);
end

for i=1:length(t);
    cla
    for j=1:length(alpha)
        esfera(X(i,j),Y(i,j),Z(i,j),0.1);
        plot3(X(1:i,j),Y(1:i,j),Z(1:i,j),'r.');
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
