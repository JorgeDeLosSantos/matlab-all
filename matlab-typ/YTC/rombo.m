clear all;clc;
n=7;
R='';
for i=1:n
    if i<=ceil(n/2)
        R(i,[ceil(n/2)+(1-i) ceil(n/2)+(i-1)])='*';
    else
        R(i,[ceil(n/2)-(n-i) ceil(n/2)+(n-i)])='*';
    end
end
disp(R);