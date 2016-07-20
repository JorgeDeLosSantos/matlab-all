obj = videoinput('winvideo',1,'YUY2_320x240');
% preview(winvid);
% IM=getsnapshot(winvid);
% imshow(IM);
figure('Name', 'My Custom Preview Window');
uicontrol('String', 'Close', 'Callback', 'close(gcf)');

% Create an image object for previewing.
vidRes = get(obj, 'VideoResolution');
nBands = get(obj, 'NumberOfBands');
hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
preview(obj, hImage);