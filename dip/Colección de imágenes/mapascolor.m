clear all;clc;
% Verdoso
r=1;
g=0;
b=0;
for i=1:64
    if i<20
        r=r-0.01;
    elseif i>=20 && i<=40
        r=r+0.01;
        g=g+0.01;
    elseif i>40
        b=b+0.01;
    end
    mapc(i,:)=[r g b];
end
mapc=mapc/max(mapc(:));
save('mapc.mat','mapc');