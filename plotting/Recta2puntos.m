function Recta2puntos
f=figure('NumberTitle','off','MenuBar','none','position',[300 200 400 400],...
    'color','w','Name','Mini Pizarra');
centerfig(f);
hold on
i=1;
while 1
    set(gca,'xlim',[-10 10],'ylim',[-10 10],'visible','off',...
        'position',[0 0 1 1]);
    [x(i),y(i)]=ginput(1);
    if strcmp(get(gcf,'SelectionType'),'open')
        break;
    end
    plot(x(i),y(i),'r*');
    plot(x,y,'linewidth',2);
    i=i+1;
end
end