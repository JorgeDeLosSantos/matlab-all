function perfilRev
clearvars('-global');
figure('ToolBar','Figure','NumberTitle','off',...
    'Name','Perfil','Position',[0 0 300 500],...
    'MenuBar','None','WindowButtonDownFcn',@lapizFcn,...
    'Color','w');
centerfig();
dim=get(gcf,'Position');
xL=[0 dim(3)];
yL=[0 dim(4)];
set(gca,'XLim',[0 dim(3)],'YLim',[0 dim(4)],...
    'Position',[0 0 1 1],'Visible','off',...
    'NextPlot','add');
line([dim(3)/2 dim(3)/2],[0 dim(4)],'Linestyle','--');


    function lapizFcn(src,~)
        if strcmp(get(src,'SelectionType'),'normal')
            set(src,'WindowButtonMotionFcn',@mov,...
                'WindowButtonUpFcn',@bprss);
        end
        function mov(src,~)
            global P
            P=[P;get(src,'CurrentPoint')];
            plot(P(:,1),P(:,2),'color','k','linewidth',2);
            axis([xL(1) xL(2) yL(1) yL(2)]);
        end
        function bprss(src,~)
            global P
            set(src,'WindowButtonMotionFcn','');
            figure();
            XX=P(:,1);
            YY=P(:,2);
            if XX(end)>XX(1),XX=XX(end:-1:1),end;
            [xx,yy,zz]=cylinder(XX);
            h=surf(xx,yy,(max(YY)-min(YY))*zz+min(YY));
            set(h,'FaceColor','r');
            shading('flat');
            daspect([1 1 1]);
            axis([-dim(3) dim(3) -dim(3) dim(3) 0 dim(4)]);
            clearvars('-global','P');
        end
    end
end