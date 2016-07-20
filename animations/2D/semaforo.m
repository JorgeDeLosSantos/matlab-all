function semaforo
f=figure('MenuBar','none','NumberTitle','off','Name','Semáforo',...
    'position',[350 400 200 100]);
rojo=uicontrol('Style','text','String','','position',[10 25 50 50],...
    'backgroundcolor','k');
verde=uicontrol('Style','text','String','','position',[75 25 50 50],...
    'backgroundcolor','k');
amarillo=uicontrol('Style','text','String','','position',[140 25 50 50],...
    'backgroundcolor','k');
k=0;

while k<50
    if k<5
        set(rojo,'Backgroundcolor','r');
    elseif k>5 & k<10
        set(verde,'Backgroundcolor','g');
        set(rojo,'Backgroundcolor','k');
        set(amarillo,'Backgroundcolor','k');
    elseif k>10 & k<20
        set(verde,'Backgroundcolor','k');
        set(rojo,'Backgroundcolor','k');
        set(amarillo,'Backgroundcolor','y');
    end
    k=k+1;
    pause(0.1);
end

end