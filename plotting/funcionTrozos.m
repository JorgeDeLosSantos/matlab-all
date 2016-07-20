clear all;clc
x=linspace(0,10,1000);
for i=1:length(x)
    if x(i)<5
        y(i)=x(i)^2;
    else
        y(i)=x(i);
    end
end
plot(x,y)