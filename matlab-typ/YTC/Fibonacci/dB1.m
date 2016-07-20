clear all;clc;
n=10;
F=[1 1];
for i=3:n
    F(i)=F(i-1)+F(i-2);
end
disp(F);