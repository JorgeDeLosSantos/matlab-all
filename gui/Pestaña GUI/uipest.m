function hp = uipest(fig,pos,strp)
% Pestañas en una GUI MATLAB
% 
% Argumentos de entrada:
%       fig   -   Handles del elemento figure
%       pos   -   Vector de posición de "uipest"
%       strp  -   Título de las pestañas
%
% $ Por: Jorge De Los Santos $ $ E-mail: delossantosmfq@gmail.com $
% $ Web: http://matlab-typ.blogspot.com $
% $ Rev 1.0.0 $  $ Fecha: 04/04/14 $

fig=gcf; pos=[10 10 300 300]; strp={'Pestaña 1','Pestaña 2','Pestaña 3'};
colorP = ones(1,3)*0.86;
% dimF = get(fig,'Position');
for i=1:length(strp)
    P(i)=uipanel(fig,'Units','Pixels',...
        'Position',pos,...
        'BackgroundColor',colorP);
end

posB = 0:pos(3)/length(strp):pos(3);
CM(1:200,1:200,3)=ones(200);

for i=1:length(strp)
    B(i)=uicontrol('style','push',...
        'String',strp{i},...
        'Position',[pos(1)+posB(i) pos(2)+pos(4)-20 pos(3)/length(strp)-1 20],...
        'BackgroundColor',get(P(i),'BackgroundColor'),...
        'Callback',{@clickFcn,i});
end

    function clickFcn(src,event,i)
        set(B,'FontWeight','normal','FontSize',8,...
            'BackgroundColor',colorP);
        set(src,'FontWeight','b','FontSize',10,...
            'BackgroundColor',get(src,'BackgroundColor')*0.9);
        set(P,'Visible','off');
        set(P(i),'Visible','on','BackgroundColor',get(src,'BackgroundColor')*0.9);
    end

hp = P;
end