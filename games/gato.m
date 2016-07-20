function gato
%
% $ Por: Jorge De Los Santos $ 
% $ E-mail: matlabtyp@gmail.com $                            . 
% $ Rev 1.0.0 $ $ 18/11/13 $                                                                      .  

questt=questdlg('Escoja el tipo de juego','Seleccionar...','Jugador vs Jugador','Jugador vs PC','Jugador vs Jugador');
switch questt
    case 'Jugador vs Jugador'
        tipo=1;
    case 'Jugador vs PC'
        tipo=2;
end

fondo=[0.78 0.9 0.8];
f=figure('MenuBar','None','NumberTitle','off','Name','Tic Tac Toe','position',[200 200 600 400],'resize','off',...
    'color',fondo);

panel=uipanel(f,'units','pixels','position',[10 10 380 380]);
axp=axes('Parent',panel,'units','normalized','position',[0 0 1 1]);
set(axp,'xtick',[],'ytick',[],'visible','off');

%% Nuevo Juego y Puntos
bnuevo=uicontrol('style','push','String','Nuevo Juego','position',[450 350 100 25],'FontSize',10,'FontWeight','bold',...
    'callback',@nuevo);

LabJ1=uicontrol('style','text','String','Jugador 1','position',[420 280 60 25],'backgroundcolor',fondo,'FontSize',9,...
    'FontWeight','bold');
PJ1=uicontrol('style','text','String','0','position',[500 290 40 25],'backgroundcolor',[1 1 1],'FontSize',14,...
    'FontWeight','bold');

LabJ2=uicontrol('style','text','String','Jugador 2','position',[420 240 60 25],'backgroundcolor',fondo,'FontSize',9,...
    'FontWeight','bold');
PJ2=uicontrol('style','text','String','0','position',[500 250 40 25],'backgroundcolor',[1 1 1],'FontSize',14,...
    'FontWeight','bold');

%% Casillas del gato
for i=1:3
    for j=1:3
        C(i,j)=uicontrol(panel,'style','push','String','','BackGroundColor',[1 1 1],'FontSize',40,'callback',{@juego,i,j,tipo},...
            'units','normalized','position',[1/3*(i-1) 1/3*(j-1) 1/3 1/3]);
    end
end

    function juego(src,event,i,j,tipo)
        global iniTurno cont
        if tipo==1
            if isempty(cont)
                warndlg('Presione Nuevo Juego');
            else
                J1='X';
                J2='O';
                G1={J1;J1;J1};
                G2={J2;J2;J2};
                if iniTurno==1
                    if rem(cont,2)==1
                        set(C(i,j),'String',J1);
                        cont=cont+1;
                    else
                        set(C(i,j),'String',J2);
                        cont=cont+1;
                    end
                else
                    if rem(cont,2)==0
                        set(C(i,j),'String',J1);
                        cont=cont+1;
                    else
                        set(C(i,j),'String',J2);
                        cont=cont+1;
                    end
                end
                
                % Condición de ganador
                if sum(strcmp(get(C(1,:),'String'),G1))==3 | sum(strcmp(get(C(2,:),'String'),G1))==3 | sum(strcmp(get(C(3,:),'String'),G1))==3 | ...
                        sum(strcmp(get(C(:,1),'String'),G1))==3 | sum(strcmp(get(C(:,2),'String'),G1))==3 | sum(strcmp(get(C(:,3),'String'),G1))==3 | ...
                        sum(strcmp(get(diag(C),'String'),G1))==3 | sum(strcmp(get(diag(rot90(C)),'String'),G1))==3
                    
                    msgbox('El jugador 1 ha ganado');
                    set(PJ1,'String',str2double(get(PJ1,'String'))+1);
                    set(C(:,:),'String','');
                    cont=1;
                    iniTurno=1;
                elseif sum(strcmp(get(C(1,:),'String'),G2))==3 | sum(strcmp(get(C(2,:),'String'),G2))==3 | sum(strcmp(get(C(3,:),'String'),G2))==3 | ...
                        sum(strcmp(get(C(:,1),'String'),G2))==3 | sum(strcmp(get(C(:,2),'String'),G2))==3 | sum(strcmp(get(C(:,3),'String'),G2))==3 | ...
                        sum(strcmp(get(diag(C),'String'),G2))==3 | sum(strcmp(get(diag(rot90(C)),'String'),G2))==3
                    
                    msgbox('El Jugador 2 ha ganado');
                    set(PJ2,'String',str2double(get(PJ2,'String'))+1);
                    set(C(:,:),'String','');
                    cont=1;
                    iniTurno=2;
                elseif cont==10
                    msgbox('No hay ganador');
                    set(C(:,:),'String','');
                    cont=1;
                end
            end
        else  % Jugador vs PC ------------------------------------------
            
        end
            
    end

    function nuevo(src,event)
        global iniTurno cont
        iniTurno=randi([1,2]);
        cont=1;
        if iniTurno==1
            msgbox('El Jugador 1 comenzará');
        else
            msgbox('El Jugador 2 comenzará');
        end
        set(C(:,:),'String','');
        set(PJ1,'String',0);
        set(PJ2,'String',0);
    end

end