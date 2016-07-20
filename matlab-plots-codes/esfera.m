function h = esfera(r,cx,cy,cz)
% cx=1; cy=2 ; cz=-1; r=2;
[x,y,z]=sphere;
h = surf(r*x+cx,r*y+cy,r*z+cz);
axis('square');
end