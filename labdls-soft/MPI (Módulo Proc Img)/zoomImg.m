function zoomImg
figure('MenuBar','figure',...
    'Name','ZoomImg',...
    'NumberTitle','off',...
    'Resize','off',...
    'Position',[100 100 600 400],...
    'WindowButtonDownFcn',@click);
centerfig;
ax=axes('Position',[0 0 1 1]);
set(get(ax,'children'),'HitTest','off');
img=imread('DSC00962.JPG');
imshow(img);
imrect(gca,[100 100 10 10]);
[x,y]=ginput(4)
    function click(src,~)
        
    end
end