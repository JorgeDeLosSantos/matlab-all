clear all;clc
x=1:0.1:10;
hold on
for i=1:10
    plot(x,cos(x/i));
    A=getframe;
    imwrite(A.cdata,['Im�genes/',num2str(i),'.png'],'png');
end