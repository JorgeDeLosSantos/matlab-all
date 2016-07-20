function modpi
figure('MenuBar','none',...
    'NumberTitle','off',...
    'Name','MPI',...
    'Resize','off',...
    'Position',[200 200 700 400],...
    'WindowButtonDownFcn',@movFcn);
centerfig;

ax=axes('units','pixels','Position',[10 10 400 380],...
    'Visible','off','ButtonDownFcn',@movFcn);
set(get(ax,'children'),'HitTest','off');
p=uipanel(gcf,'units','pixels','Position',[450 10 240 380],...
    'BackgroundColor','w');
uimenu(gcf,'Label','Cargar imágenes','Callback',@cargarImg);

uicontrol(p,'style','text',...
    'String','Seleccionar imagen',...
    'Position',[70 350 100 20],...
    'BackgroundColor',get(p,'BackgroundColor'));

imgs=uicontrol(p,'style','popupmenu',...
    'String',{''},...
    'Position',[50 335 140 12],...
    'Callback',@mostrarImg);

uicontrol(p,'style','text',...
    'String','Escala de grises',...
    'Position',[70 280 100 20],...
    'BackgroundColor',get(p,'BackgroundColor'));
uicontrol(p,'style','push',...
    'String','Convertir a escala de grises',...
    'Position',[45 260 150 20],...
    'Callback',@conv2gris);

uicontrol(p,'style','text',...
    'String','Detección de bordes',...
    'Position',[20 210 200 20],...
    'BackgroundColor',get(p,'BackgroundColor'));
uicontrol(p,'style','popupmenu',...
    'String',{'Seleccione método','sobel','canny','prewitt','roberts'},...
    'Position',[50 190 140 15],...
    'Callback',@selmdb);

uicontrol(p,'style','text',...
    'String','Filtros',...
    'Position',[20 130 200 20],...
    'BackgroundColor',get(p,'BackgroundColor'));
uicontrol(p,'style','popupmenu',...
    'String',{'Seleccione método','average','disk','gaussian','laplacian','log','motion',...
    'prewitt','sobel','unsharp','Personalizado'},...
    'Position',[50 110 140 15],...
    'Callback',@selfiltro);

uicontrol(p,'style','push',...
    'String','Boton',...
    'Position',[50 40 140 20],...
    'Callback',@encc);

set(findobj('style','text'),'ForegroundColor','b');

    function cargarImg(src,event)
        global dirImg
        dirImg = uigetdir('C:\Users\Public\Pictures','Seleccione una carpeta');
        A=dir([dirImg,'\*.jpg']);
        for i=1:length(A)
            S{i}=A(i).name;
        end
        set(imgs,'str',S);
    end

    function mostrarImg(src,event)
        global dirImg A
        k=get(src,'value');
        M=get(src,'str');
        A=imread([dirImg,'\',M{k}]);
        imshow(A);
    end

    function conv2gris(src,event)
        global dirImg
        k=get(imgs,'value');
        M=get(imgs,'str');
        A=rgb2gray(imread([dirImg,'\',M{k}]));
        imshow(A);
    end

    function selmdb(src,event)
        global dirImg
        k=get(imgs,'value');
        M=get(imgs,'str');
        kb=get(src,'value');
        Mb=get(src,'str');
        A=rgb2gray(imread([dirImg,'\',M{k}]));
        try
            A=edge(A,Mb{kb});
            imshow(A);
        catch
            warndlg('Método no válido');
        end
    end

    function selfiltro(src,event)
        global dirImg
        k=get(imgs,'value');
        M=get(imgs,'str');
        A=imread([dirImg,'\',M{k}]);
        k1=get(src,'value');
        M1=get(src,'str');
        switch M1{k1}
            case {'average','disk','gaussian','laplacian','log',...
                    'motion','prewitt','sobel','unsharp'}
                f=fspecial(M1{k1});
            case 'Personalizado'
                f=inputdlg('Filtro personalizado','Filtro',1,...
                    {'[1 1 1;1 1 1;1 1 1]'});
                f=str2num(f{1});
        end
        try
            A=imfilter(A,f);
            imshow(A);
        catch
            warndlg('Método no válido');
        end
    end

    function movFcn(src,event)
%         if strcmp(get(gcf,'SelectionType'),'normal')
%             set(gcf,'color',rand(1,3));
%         end
    end

    function encc(src,event)
        global A
        pv=impixel;
        k=1;
        [f,c]=find(abs(A(:,:,1)-pv(1))<k & abs(A(:,:,2)-pv(2))<k & abs(A(:,:,3)-pv(3))<k);
        A=rgb2gray(A);
        A=uint8(zeros(size(A,1),size(A,2)));
        for i=1:length(f)
            A(f(i),c(i))=255;
        end
        imshow(A==255);
    end

end