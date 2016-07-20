function misnake

f=figure('MenuBar','None','NumberTitle','off','Name','Snake','position',[200 200 600 400],'resize','off',...
    'color',[0.7 0.6 0.5],'KeyPressFcn',@direccion);

plano=axes('parent',f,'units','pixels','position',[10 10 380 380]);
set(gca,'visible','on','xtick',[],'ytick',[]);

bsubir=uicontrol('style','push','String','S','position',[480 340 30 30],'callback',@subir);
bbajar=uicontrol('style','push','String','B','position',[480 280 30 30],'callback',@bajar);
bderecha=uicontrol('style','push','String','D','position',[535 310 30 30],'callback',@derecha);
bizquierda=uicontrol('style','push','String','I','position',[430 310 30 30],'callback',@izquierda);

label1=uicontrol('style','text','String','Puntos','position',[460 230 80 20],'backgroundcolor',[0.7 0.6 0.5],'fontsize',10);
puntos=uicontrol('style','text','String','','position',[460 200 80 25],'fontsize',14);


inicio=uicontrol('style','push','String','Iniciar','position',[460 60 80 25],'callback',@iniciar);
detener=uicontrol('style','toggle','String','Detener','position',[460 30 80 25]);


%% Funciones
    function iniciar(src,event)
        global S B I D
        subir();
        M=zeros(50);
        ppx=randi(50,1);
        ppy=randi(50,1);
        M(ppx,ppy)=1;
        MO=M;  
        i=20;
        j=10;
        while 1
            if get(detener,'value')
                break;
            end
            M=MO;
            if S==1
                i=i+1;
                M(i:i+2,j)=1;
            end
            if B==1
                i=i-1;
                M(i:i+2,j)=1;
            end
            if I==1
                j=j-1;
                M(i,j:j+2)=1;
            end
            if D==1
                j=j+1;
                M(i,j:j+2)=1;
            end
            if j>50||j<1||i>50||i<1
                msgbox('Game Over :P');
                break;
            end
            pcolor(M);
            shading('flat');
            pause(0.5);
        end 
        
    end

    function subir(src,event)
        global S B I D
        S=1;B=0;I=0;D=0;
    end

    function bajar(src,event)
        global S B I D
        S=0;B=1;I=0;D=0;
    end

    function derecha(src,event)
        global S B I D
        S=0;B=0;I=0;D=1;
    end

    function izquierda(src,event)
        global S B I D
        S=0;B=0;I=1;D=0;
    end
    function direccion(src,event)
        switch event.Key
            case 'uparrow'
                subir();
            case 'downarrow'
                bajar();
            case 'rightarrow'
                derecha();
            case 'leftarrow'
                izquierda();
            otherwise
        end
    end
end