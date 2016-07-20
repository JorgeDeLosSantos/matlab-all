function verEjes(dim,ha)
% dim -  2 para 2D & 3 para 3D
% ha  -  handles del elemento axes,  por defecto "gca"
if nargin<1
    dim=2;
    ha=gca;
elseif nargin==1
    ha=gca;
end
if dim==2
    xl = get(ha,'xlim');
    yl = get(ha,'ylim');
    line([xl(1) xl(2)],[0 0],'linewidth',2,'Color','k');
    line([0 0],[yl(1) yl(2)],'linewidth',2,'Color','k');
elseif dim==3
    xl = get(ha,'xlim');
    yl = get(ha,'ylim');
    zl = get(ha,'zlim');
    hlin(1)=line([xl(1) xl(2)],[0 0],[0 0]);
    hlin(2)=line([0 0],[yl(1) yl(2)],[0 0]);
    hlin(3)=line([0 0],[0 0],[zl(1) zl(2)]);
    set(hlin,'linewidth',2,'Color','k');
    view(3);
end
end