function mostrarImgPausa
figure('Pos',[200 200 400 400],'resize','off','MenuBar','none');
centerfig;
set(gca,'Pos',[0 0 1 1]);
img = imread('world.jpg');

for i=1:2:size(img,1)
    cla('reset')
    imshow(img(1:i,:,:));
    set(gca,'Pos',[0 0 1 i/size(img,1)]);
    drawnow('expose')
end
beep;

end