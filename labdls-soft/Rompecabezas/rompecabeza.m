function rompecabeza
clearvars('-global');
figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Rompecabezas',...
    'Resize','off',...
    'Position',[200 200 660 420],...
    'Colormap',jet(10));
centerfig;

panel=uipanel(gcf,'Units','pixels',...
    'Position',[10 10 400 400]);

np = 4;
for i=1:np
    for j=1:np
        C(i,j)=uicontrol(panel,'style','push','String','',...
            'BackGroundColor',[1 1 1],'FontSize',40,...
            'callback',{@movFcn,i,j},'units','normalized',...
            'position',[1/np*(j-1) 1/np*(4-i) 1/np 1/np]);
    end
end

seleccionaImg()
    function movFcn(src,event,i,j)
        global k
        k
        if isempty(k)
            k=1;
        elseif k==1
            k=k+1;
        end
        set(C(i,j),'Tag',num2str(k));
        
        if k==2
            bt1=findobj('Tag','1');
            bt2=findobj('Tag','2');
            p1=get(bt1,'Pos');
            p2=get(bt2,'Pos');
            set(bt1,'Pos',p2,'Tag','');
            set(bt2,'Pos',p1,'Tag','');
            clearvars('-global');
        end
    end

    function seleccionaImg()
        for ii=1:4
            for jj=1:4
                narch=strcat('data/logo/a',num2str(ii),num2str(jj),'.png');
                set(C(ii,jj),'CData',imread(narch));
            end
        end
    end

end