function rotarLinea
h=plot(1:300);
set(gcf,'WindowButtonDownFcn',@downf);
dim=get(gcf,'Position');
xlim([0 dim(3)])
ylim([0 dim(4)])

    function downf(src,~)
        PO = get(h,'YData');
        if strcmp(get(gco,'type'),'line')
            set(src,'WindowButtonMotionFcn',{@mov,PO},...
                'WindowButtonUpFcn',@upf);
        end
    end
    function mov(src,~, PO)
        XX = get(h,'XData');
        YY = get(h,'YData');
        CP = get(src,'CurrentPoint');
        set(h,'YData',PO+CP(2));
    end
    function upf(src,~)
        set(src,'WindowButtonMotionFcn','');
    end
end