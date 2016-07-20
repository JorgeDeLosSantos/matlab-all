function ballrebot
% persistent M
f=figure('MenuBar','none','NumberTitle','off','Name','Mov Cuad',...
    'position',[400 300 300 300],'resize','off','color',[0.5 0.6 0.3],...
    'KeyPressFcn',@movfun);
movegui('center');

%% Panel & Axes
pp=uipanel(f,'units','pixels','position',[5 5 290 290]);
ax=axes('parent',pp,'units','normalized','position',[0 0 1 1]);
set(ax,'xtick',[],'ytick',[]);

%% Inicio
M=zeros(30);
px=1;
py=2;
PosB1=[20,20];
PosB2=[24,10];
PosB3=[10,12];
M(PosB1(1),PosB1(2))=2;
M(PosB2(1),PosB2(2))=2;
M(PosB3(1),PosB3(2))=2;
M(px,py)=1;
imagesc(M');
shading('flat');
%% Función mov
    function movfun(src,event)
        direccion=event.Key;
        switch direccion
            case 'uparrow'
                py=py-1;
            case 'downarrow'
                py=py+1;
            case 'leftarrow'
                px=px-1;
            case 'rightarrow'
                px=px+1;
        end
        if px<1,px=1;end
        if px>30,px=30;end
        if py<1,py=1;end
        if py>30,py=30;end
        M=zeros(30);
        M(PosB1(1),PosB1(2))=2;
        M(PosB2(1),PosB2(2))=2;
        M(PosB3(1),PosB3(2))=2;
        M(px,py)=1;
        if all([PosB1(1),PosB1(2)]==[px,py]) || ...
           all([PosB2(1),PosB2(2)]==[px,py]) || ...
           all([PosB3(1),PosB3(2)]==[px,py])
           M=zeros(30);
        end
        imagesc(M');
    end
end