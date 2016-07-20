function ADQImg
hFig = figure('MenuBar','none','NumberTitle','off',...
    'Name','ADQ');
centerfig();

uimenu(hFig,'Label','Iniciar','callback',@iniciar);
uimenu(hFig,'Label','Capturar','callback',@capturar);
uimenu(hFig,'Label','Detener','callback',@detener);
ax1 = axes('Parent',hFig,'YDir','Reverse');
axis('off');
hImg = image('Parent',ax1,'CData',zeros(300));

    function iniciar(src,event)
        global vid
        vid = videoinput('winvideo',1,'MJPG_640x480');
        hp = preview(vid, hImg);
    end

    function capturar(src,event)
        global vid
        img = getsnapshot(vid);
        imwrite(img,'img.png');
        %figure();
        %imshow(img);
    end

    function detener(src,event)
        global vid
        delete(vid);
    end
end