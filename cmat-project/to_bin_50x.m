clear;clc;
A=dir('gray/50x/*.png');
K=[0.4 0.5 0.45 0.45];
for i=1:length(A)
    X=imread(['gray/50x/',A(i).name]);
    imwrite(im2bw(X,K(i)),['bin50x/',A(i).name],'png');
end