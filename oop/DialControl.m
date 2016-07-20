function DialControl
hAx = axes('Units','Pixels',...
    'Visible','off',...
    'Position',[50 50 250 250],...
    'NextPlot','add');


t = linspace(0,2*pi);
XX = cos(t);
YY = sin(t);
hCircle = fill(XX,YY,[0.9 0.9 0.9]);
taux = linspace(pi,0);
xaux = 0.7*cos(taux);
yaux = 0.7*sin(taux);
% hAuxCircle = line(xaux,yaux);
X = 0.1*cos(t)+xaux(3);
Y = 0.1*sin(t)+yaux(3);
hMarker = fill(X,Y,[0.8 0.8 0.7]);
set(hMarker,'EdgeColor',[0.8 0.8 0.7]);
set(hMarker,'ButtonDownFcn',@btdw);

    function btdw(src,~)
        set(src,'FaceColor',get(src,'FaceColor')*0.9);
        set(gcbf,'WindowButtonMotionFcn',@motion);
    end
    function motion(src,~)
        set(src,'WindowButtonUpFcn','set(gcf,''WindowButtonMotionFcn'','''')');
        CP = get(gca,'CurrentPoint');
        CP = CP(1,1:2);
        R = linspace(-1,1);
        k = find(abs(R - CP(1))<0.01, 1);
        try
            set(hMarker,'XData',0.1*cos(t)+xaux(k),...
                'YData',0.1*sin(t)+yaux(k),...
                'ZData',ones(100)/0.1);
        catch
            % pass
        end
    end
    function btup(src,~)
    end
end