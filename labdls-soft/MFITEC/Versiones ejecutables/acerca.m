function acerca
cfondo=[0 0.2 0];
fa=figure('MenuBar','None','NumberTitle','off','Name','Acerca de...','position',...
    [100 100 210 100],'color',cfondo,'resize','off','pointer','hand');
centerfig(fa);

uicontrol('style','push','str','MFITEC v1.0','pos',[10 70 190 20],...
    'fontsize',9,'fontweight','b','foregroundcolor','b','tag','ac');
uicontrol('style','push','str','Por: Jorge De Los Santos','pos',[10 50 190 20],...
    'tag','ac');
uicontrol('style','push','str','E-mail: delossantosmfq@gmail.com','pos',[10 30 190 20],...
    'tag','ac');
uicontrol('style','push','str','<html><a>http://matlab-typ.blogspot.mx/p/mfitec.html</a></html>',...
    'pos',[10 10 190 20],'fontsize',7,'callback',@gotoweb,'foregroundcolor',[0.3 0.3 0.9],...
    'tag','ac');

A(1:30,1:200,1)=uint8(255);
A(1:30,1:200,2)=uint8(255);
A(1:30,1:200,3)=uint8(255);
set(findobj('tag','ac'),'cdata',A);

    function gotoweb(src,event)
         web('http://matlab-typ.blogspot.mx/p/mfitec.html','-browser');
    end
end