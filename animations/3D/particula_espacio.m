function particula_espacio
hold on
v=[0:0.1:10];
plot3(0,0,v,'r-');
plot3(0,v,0,'r-');
plot3(v,0,0,'r-');
axis([-10 10 -10 10 -10 10]);
view([20 20 20]);
daspect([1 1 1]);
set(gca,'NextPlot','ReplaceChildren');
for i=1:10
    cla;
    plot3(0,0,1:i,'r.','MarkerSize',1);
    plot3(0,1:i,0,'r.','MarkerSize',1);
    plot3(1:i,0,0,'r.','MarkerSize',1);
    esfera(0,0,i,0.5);
    esfera(0,i,0,0.5);
    esfera(i,0,0,0.5);
    esfera(0,0,-i,0.5);
    esfera(0,-i,0,0.5);
    esfera(-i,0,0,0.5);
    axis([-10 10 -10 10 -10 10]);
    view([20 20 20]);
    daspect([1 1 1]);
    pause(0.1);
end

    function esfera(px,py,pz,r)
        [x,y,z] = sphere;
        surf(r*x+px,r*y+py,r*z+pz);
    end
end