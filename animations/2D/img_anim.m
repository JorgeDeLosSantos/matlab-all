function img_anim
figure('MenuBar','none',...
    'NumberTitle','off',...
    'Resize','off',...
    'Name','Animaci�n Im�gen',...
    'Color','w',...
    'Position',[200 200 400 300]);
centerfig;

ax=axes('Units','Pixels',...
    'Position',[0 0 32 32],...
    'Visible','off');

img = imread('img.png');
imshow(img);

for i=1:100
    set(ax,'Position',[randi([1,400]) randi([1,300]) 32 32]);
    pause(0.01);
end
end
