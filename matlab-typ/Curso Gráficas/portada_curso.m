clear;clc;
z=peaks;
[~,h] = contour(z,8);
set(h,'Linewidth',3);
colormap(hot);
axis off
saveas(gca,'img.png');