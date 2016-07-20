A=imread('matlab_logo.png');
[m,n,p]=size(A);

uicontrol('style','push','str','',...
    'Position',[20 20 200 200],'CData',A(1:m/2,n/2:n,:));
% subplot(2,2,1)
% imshow(A(1:m/2,1:n/2,:));
% subplot(2,2,2)
% imshow(A(1:m/2,n/2:n,:));
% subplot(2,2,3)
% imshow(A(m/2:m,1:n/2,:));
% subplot(2,2,4)
% imshow(A(m/2:m,n/2:n,:));