function vector3D(P1,P2)
P1=[0 0 0];P2=[2 3 1];
hold on
line([P1(1) P2(1)],[P1(2) P2(2)],[P1(3) P2(3)],'linewidth',2);
lv=norm((P2-P1));
lx=P2(1)-P1(1);
ly=P2(2)-P1(2);
lz=P2(3)-P1(3);
t = [0.1 0];
% [X,Y,Z] = cylinder(t);
% h=surf(X+P2(1),Y+P2(2),Z+P2(3));
A(1:10,1:10,1:20)=0.1;
B=A;
C=A;
view(3);
% pause(0.5)
% rotate(h,[1 0 0],acosd(lz/lv));
% % rotate(h,[0 1 0],acosd(ly/lv));
% % rotate(h,[0 0 1],acosd(lz/lv));
end