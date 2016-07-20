function orbitar
% Simulación de un sistema planetario idealizado con orbitas circulares
% Descripción de variables:
%   t       -  Vector del parámetro para definir las trayectorias orbitales
%   RO      -  Vector de radios orbitales
%   RP      -  Vector de radios planetarios
%   X,Y     -  Vectores que definen la trayectoria orbital (Paramétrica)
%   p       -  Vector de posición de los planetas
%
%
% $ Por: Jorge De Los Santos $
% $ E-mail: delossantosmfq@gmail.com | matlabtyp@gmail.com $
% $ Web: http://matlab-typ.blogspot.com $
% $ Rev. 1.0.0 $ $ Fecha: 02/03/14 $

figure('MenuBar','Figure','NumberTitle','off',...
    'Name','Sistema Planetario','Resize','off',...
    'Color','k');
set(gca,'Visible','off','Position',[0 0 1 1],...
    'NextPlot','add');
hINI=uicontrol('style','push','String','START',...
    'Units','Normalized','Position',[0.01 0.01 0.1 0.05],...
    'Callback',@iniciar);
hSTP=uicontrol('style','toggle','String','STOP',...
    'Units','Normalized','Position',[0.12 0.01 0.1 0.05]);

    function iniciar(~,~)
        t=linspace(0,2*pi);
        RO=4:2:10;
        RP=rand(1,length(RO));
        for i=1:length(RO)
            X(:,i)=RO(i)*cos(t);
            Y(:,i)=RO(i)*sin(t);
        end
        p = randi([1,50],1,length(RO));
        while 1
            cla;
            for j=1:length(RO)
                esfera(X(p(j),j),Y(p(j),j),0,RP(j),[0 0 1]);
            end
            esfera(0,0,0,2,[1 1 0]);
            plot(X,Y,'w');
            axis([min(X(:)) max(X(:)) min(Y(:)) max(Y(:)) -5 5]);
            view([45 45 30]);
            daspect([1 1 1]);
            pause(0.01);
            comp = find(p>=length(t));
            if ~isempty(comp)
                p(comp)=1;
            end
            p=p+1;
            if get(hSTP,'value'), break,end;
        end
    end

    function he = esfera(px,py,pz,r,cf)
        [x,y,z] = sphere;
        he = surf(r*x+px,r*y+py,r*z+pz,'FaceColor',cf,'EdgeColor',cf);
    end
end

