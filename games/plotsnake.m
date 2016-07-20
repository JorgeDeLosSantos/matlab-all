function plotsnake
f=figure('MenuBar','none','NumberTitle','off','Name','Mov Cuad',...
    'position',[400 300 300 300],'resize','off','color',[0.5 0.6 0.3],...
    'KeyPressFcn',@movfun);
%% Panel & Axes
pp=uipanel(f,'units','pixels','position',[5 5 290 290]);
ax=axes('parent',pp,'units','normalized','position',[0 0 1 1]);
set(ax,'xtick',[],'ytick',[]);

annotation('rectangle','units','inches','string','HOLA','position',...
    [0 0 2 3]);

end