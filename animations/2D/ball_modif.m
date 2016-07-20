function ball_modif
clear all; close all;
figure('MenuBar','none','NumberTitle','off','Name','Mov Cuad',...
    'position',[400 300 400 400],'resize','off','color','w');
centerfig(gcf);
axes('units','normalized','position',[0.05 0.05 0.9 0.9]);
set(gca,'xtick',[],'ytick',[]);

dim=10; % Límites de la simulación
N=2;   % Número de bolas

pX = randi([1-dim,dim-1],1,N);
pY = randi([1-dim,dim-1],1,N);
vX = randi([1,5],1,N)/10;
vY = randi([1,5],1,N)/10;
dirX = ones(1,N);
dirY = ones(1,N);

hold on
axis([-dim dim -dim dim]);
axis('square');
kol=0;
while 1
    for i=1:N
        %         for j=1:N
        %             if i~=j && abs(pX(i)-pX(j))<0.5 && abs(pY(i)-pY(j))<0.5
        %                 dirX(j)=dirX(j)*-1;
        %                 dirY(j)=dirY(j)*-1;
        %                 dirX(i)=dirX(i)*-1;
        %                 dirY(i)=dirY(i)*-1;
        %             end
        %         end
        comp=find(abs(pX(i)-pX)<1 & abs(pY(i)-pY)<1);
        if ~isempty(comp) && length(comp)>1
            dirX(comp)=dirX(comp)*-1;
            dirY(comp)=dirY(comp)*-1;
            kol=kol+1
        end
        
        if pY(i)>dim || pY(i)<-dim
            dirY(i)=dirY(i).*-1;
        end
        if pX(i)>dim || pX(i)<-dim
            dirX(i)=dirX(i).*-1;
        end
        circ(pX(i),pY(i));
    end
    pX = pX + vX.*dirX;
    pY = pY + vY.*dirY;
%     drawnow;
    pause(0.02);
    cla;
    if strcmp(get(gcf,'SelectionType'),'open'),break,end
end

    function hp = circ(cX,cY)
        r = 0.5;
        t = linspace(0,2*pi,100);
        x = r*cos(t)+cX;
        y = r*sin(t)+cY;
        hp= fill(x,y,'b');
    end
end