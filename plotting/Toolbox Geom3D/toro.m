function toro
hold on
t=linspace(0,2*pi,30);
x=cos(t);
y=sin(t);
z=ones(1,length(t));
plot3(x,y,z);
plot3(z,y,x);
% for i=1:length(t)
%     
% end

view(3);
end