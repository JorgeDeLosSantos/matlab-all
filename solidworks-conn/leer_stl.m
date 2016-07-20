clear;clc;
patch(stlread('Pieza4.stl'),...
    'FaceColor',[0.7 0.7 0.7],...
    'EdgeColor','None');
camlight('left');
axis('equal');
view(3);