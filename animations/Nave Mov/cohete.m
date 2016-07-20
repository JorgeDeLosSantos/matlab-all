function cohete
figure('MenuBar','none',...
    'NumberTitle','off',...
    'Resize','off',...
    'Name','Animación Imágen',...
    'Color','w',...
    'Position',[200 200 400 300]);
centerfig;

ax=axes('Units','Pixels',...
    'Position',[0 0 32 32],...
    'Visible','off');

img = imread('nave.jpg');
imshow(img);

for i=1:100
    set(ax,'Position',[i 20 32 32]);
    imshow(rotarImg(img,round(i/25)));
    pause(0.01);
end

    function imr = rotarImg(Img,k)
        Img(:,:,1)=rot90(Img(:,:,1),k);
        Img(:,:,2)=rot90(Img(:,:,2),k);
        Img(:,:,3)=rot90(Img(:,:,3),k);
        imr=Img;
    end
end
