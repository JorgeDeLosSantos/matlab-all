clear;clc;
x=linspace(0,5,200);
y=exp(-x).*sin(3.*x);
for i=1:length(x);
    hold on
    c(i)=interp1([max(y) min(y)],[0 1],y(i));
    plot(x(i),y(i),'MarkerSize',8,'Marker','o','MarkerFace',[c(i) c(i)*c(i) c(i)]);
end