function invasoresEspaciales
% persistent M
f=figure('MenuBar','none','NumberTitle','off','Name','Mov Cuad',...
    'position',[400 300 300 300],'resize','off','color',[0.5 0.6 0.3],...
    'KeyPressFcn',@movfun,'Renderer','zbuffer');
movegui('center');

%% Panel & Axes
pp=uipanel(f,'units','pixels','position',[5 5 290 290]);
ax=axes('parent',pp,'units','normalized','position',[0 0 1 1]);
set(ax,'xtick',[],'ytick',[]);

%% Inicio
M=zeros(30);
px=1;
py=29;
M(px,py)=1;
imagesc(M');
shading('flat');
k=0;

XAst=[1,5,10];
YAst=[1,1,1];
while k<50
    M=zeros(30);
    M(XAst(1:3),YAst(1:3))=1;
    M(px,py)=1;
    if YAst(1)>30,YAst(1)=1;end
    if YAst(2)>30,YAst(2)=1;end
    if YAst(3)>30,YAst(3)=1;end
    YAst=YAst+1;
    k=k+1;
    pause(0.1);
    imagesc(M');
end
%% Función mov
    function movfun(src,event)
        direccion=event.Key;
        switch direccion
            case 'leftarrow'
                px=px-1;
            case 'rightarrow'
                px=px+1;
            otherwise
                px=px;
        end
        if px<1,px=1;end
        if px>30,px=30;end
        if py<1,py=1;end
        if py>30,py=30;end
%         M=zeros(30);
        M(px,py)=1;
        imagesc(M');
    end
end