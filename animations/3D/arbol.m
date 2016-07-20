function arbol(p0,H)
set(gca,'NextPlot','add');
h1=cilindro(p0(1),p0(2),p0(3),H/20,H/2);
set(h1,'FaceColor',[0.6 0.3 0],'EdgeColor',[0.6 0.3 0]);
h2=esfera(p0(1),p0(2),p0(3)+3*H/4,3*H/8);
set(h2,'FaceColor','g','EdgeColor','g');
% axis([0 10 0 10 0 10]);
daspect([1 1 1]);
view(3);
    function he = esfera(px,py,pz,r)
        [x,y,z] = sphere;
        he = surf(r*x+px,r*y+py,r*z+pz);
    end
    function hc = cilindro(px,py,pz,r,h)
        [x,y,z]=cylinder;
        hc = surf(r*x+px,r*y+py,h*z+pz);
    end
end