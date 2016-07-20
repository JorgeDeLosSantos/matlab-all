clear all;clc
h=uicontrol('style','push','str','HOLA',...
    'Enable','on','BackgroundColor','r','Position',[20 20 50 50]);
set(h,'cdata',imread('icono.png'));
ax=axes('Units','Pixels','Position',get(h,'Position'));
plot(1:10)
% imshow(imread('icono.png'));