clear;clc;
x=100;
for i=1:30
    x=x-((x^2-35000)/(2*x));
    X(i)=x;
end
disp(['x = ',num2str(x)]);
plot(X);