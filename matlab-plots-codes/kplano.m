function kplano(k,xyz)
% k=2;xyz='x';
% k    -  Valor constante
% xyz  -  'x','y','z'
% Ejemplo:
%           >> kplano(3,'x');
%
xl = get(gca,'xlim');
yl = get(gca,'ylim');
zl = get(gca,'zlim');
dd = 1;
if xyz=='x'
    [yy,zz]=meshgrid(yl(1):dd:yl(2),zl(1):dd:zl(2));
    xx = k*ones(size(yy));
    surf(xx,yy,zz);
elseif xyz=='y'
    [xx,zz]=meshgrid(xl(1):dd:xl(2),zl(1):dd:zl(2));
    yy = k*ones(size(xx));
    surf(xx,yy,zz);
elseif xyz=='z'
    [xx,yy]=meshgrid(xl(1):dd:xl(2),yl(1):dd:yl(2));
    zz = k*ones(size(xx));
    surf(xx,yy,zz);
end
view(3);
% % xlabel('x');ylabel('y');
end