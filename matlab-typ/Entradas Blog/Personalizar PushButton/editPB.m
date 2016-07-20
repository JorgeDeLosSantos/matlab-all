function editPB
figure('MenuBar','none','NumberTitle','off',...
    'Name','Personalizar Push Button',...
    'Resize','off','Position',[200 200 300 200]);
centerfig;

str='<html>Primera línea <br> Segunda línea</html>';
% set(hPB,'String',str);
M=['str','hhh'];
uicontrol('style','push',sprintf('%s',M))

% h=uicontrol('style','push','str',str,...
%     'Position',[50 70 120 50],'FontSize',10);

end