figure
[X,Y] = meshgrid(0:0.5:5);
Z = cos(X)+sin(Y);
% [DX,DY,DZ]=surfnorm(X,Y,Z);
DX=gradient(Z,0.1);
DY=DX;
DZ=DY;
hold on
% surf(X,Y,Z);
quiver3(X,Y,Z,DX,DY,DZ);
view(3);
hold off
