function CursorEditor(data)
hF=figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','Cursor Editor',...
    'Resize','off',...
    'Position',[0 0 400 400],...
    'CloseRequestFcn',@cerrar);
centerfig(hF);

if nargin < 1
    data = zeros(16);
    nrows = 16;
    ncols = 16;
else
    [nrows,ncols] = size(data);
    data(isnan(data))=0;
end

hMA = uimenu(hF,'Label','Archivo');
uimenu(hMA,'Label','Guardar','Callback',@guardar);
uimenu(hMA,'Label','Salir','Callback',@cerrar);


p = uipanel(hF,'Units','normalized','Position',[0.01 0.01 0.98 0.98]);

hPix=zeros(16);
for i=1:nrows
    for j=1:ncols
        posX = (1/ncols)*(j-1);
        posY = (1/nrows)*(nrows-i);
        hPix(i,j)=uicontrol(p,'style','toggle',...
            'Units','Normalized',...
            'Callback',@view_color,...
            'BackgroundColor',repmat(double(~data(i,j)),1,3),...
            'Value',data(i,j),...
            'Position',[posX posY 1/ncols 1/nrows]);
    end
end

    function view_color(src,~)
        if get(src,'value')
            set(src,'BackG','k');
        else
            set(src,'BackG','w');
        end
    end

    function guardar(~,~)
        curdata = zeros(16);
        for ii=1:nrows
            for jj=1:ncols
                curdata(ii,jj)=get(hPix(ii,jj),'value');
            end
        end
        curdata(curdata==0)=NaN;
        set(hF,'Pointer','Custom','PointerShapeCData',curdata);
%         save('curdata.mat','curdata');
    end

    function cerrar(~,~)
        delete(hF);
    end
end