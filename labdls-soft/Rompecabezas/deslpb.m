function deslpb
figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Deslizar',...
    'Position',[200 200 300 300],...
    'ButtonDownFcn',@fcn);
centerfig;

bt=uicontrol('style','push','pos',[20 20 20 20]);

    function fcn(src,event)
        A=get(src,'CurrentPoint');
        set(bt,'Pos',[A(1) A(2) 20 20]);
    end

end