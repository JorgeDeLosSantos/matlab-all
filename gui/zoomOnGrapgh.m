function zoomOnGrapgh
figure('WindowButtonDownFcn',@func);
plot(rand(10));
    function func(src,~)
        if strcmp(get(src,'SelectionType'),'normal')
            get(src,'CurrentPoint')
            xL=get(gca,'XLim');
            yL=get(gca,'YLim');
            set(gca,'XLim',xL/2,'YLim',yL/2);
        elseif strcmp(get(src,'SelectionType'),'open')
            xL=get(gca,'XLim');
            yL=get(gca,'YLim');
            set(gca,'XLim',1.1*xL,'YLim',1.1*yL);
        end
    end
end