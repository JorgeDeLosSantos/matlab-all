fondo=[0.78 0.9 0.8];
f=figure('MenuBar','None','NumberTitle','off','Name','Tic Tac Toe','position',[200 200 600 400],'resize','off',...
    'color',fondo);

panel=uipanel(f,'units','pixels','position',[10 10 380 380]);
axp=axes('Parent',panel,'units','normalized','position',[0 0 1 1]);
set(axp,'xtick',[],'ytick',[],'visible','off');

%% Nuevo Juego y Puntos
bnuevo=uicontrol('style','push','String','Nuevo Juego','position',[450 350 100 25],'FontSize',10,'FontWeight','bold',...
    'callback',@nuevo);

uicontrol('style','text','String','Jugador 1','position',[420 280 60 25],'backgroundcolor',fondo,'FontSize',9,...
    'FontWeight','bold');
PJ1=uicontrol('style','text','String','0','position',[500 290 40 25],'backgroundcolor',[1 1 1],'FontSize',14,...
    'FontWeight','bold');

uicontrol('style','text','String','Jugador 2','position',[420 240 60 25],'backgroundcolor',fondo,'FontSize',9,...
    'FontWeight','bold');
PJ2=uicontrol('style','text','String','0','position',[500 250 40 25],'backgroundcolor',[1 1 1],'FontSize',14,...
    'FontWeight','bold');

%% Casillas del gato
num=20;
for i=1:num
    for j=1:num
        C(i,j)=uicontrol(panel,'style','push','String','','BackGroundColor',[1 1 1],'FontSize',10,'callback',{@juego,i,j},...
            'units','normalized','position',[1/num*(i-1) 1/num*(j-1) 1/num 1/num]);
    end
end