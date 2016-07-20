clear;clc;
z=peaks;
h=surf(z);
% l=light('Position',[20 20 20],'Style','infinite');
set(h,'FaceLighting','phong');
alpha_data = meshgrid(1:49);
alpha(alpha_data);