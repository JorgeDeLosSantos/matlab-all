function derivInt
figure('NumberTitle','off','MenuBar','None','Name','Der - Int',...
    'Position',[100 100 250 200],'color',[0.8 0.8 0.8],'resize','off');
centerfig(gcf);

uicontrol('style','text','string','f (x)','position',[20 170 40 20],...
    'fontsize',11,'fontweight','b','backgroundcolor',get(gcf,'color'));
fun=uicontrol('style','edit','string','','position',[70 170 140 20]);

uicontrol('style','text','string','f ''(x)','position',[20 120 40 20],...
    'fontsize',11,'fontweight','b','backgroundcolor',get(gcf,'color'));
deriv=uicontrol('style','text','string','','position',[70 120 140 20],...
    'fontsize',8,'fontweight','b');

uicontrol('style','text','string','F (x)','position',[20 80 40 20],...
    'fontsize',11,'fontweight','b','backgroundcolor',get(gcf,'color'));
integ=uicontrol('style','text','string','','position',[70 80 140 20],...
    'fontsize',8,'fontweight','b');

bot=uicontrol('style','push','string','Calcular',...
    'position',[80 20 90 25],'fontsize',10,'fontweight','b',...
    'callback',@calcular,'ForegroundColor','w');

A(:,:,1)=uint8(randi([1,55],20,85));
A(:,:,2)=uint8(randi([1,50],20,85));
A(:,:,3)=uint8(randi([1,100],20,85));
set(bot,'cdata',A);

% hgsave(gcf,'mifig');

    function calcular(src,event)
        f=get(fun,'String');
        x=sym('x');
        Der=diff(f,x);
        Int=int(f,x);
        set(deriv,'String',char(Der));
        set(integ,'String',char(Int));
    end
end