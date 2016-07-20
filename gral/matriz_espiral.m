clear all; close all; clc;
N = 5;
k = 1;
ii = 1;
jj = 0;
for k = 1:N^2
    if k<=5
        jj = jj + 1;
    end
    if k>5 && k<=9
        ii = ii + 1;
    end
    if k>9 && k<=13
        jj = jj - 1;
    end
    if k>13 && k<=16
        ii = ii - 1;
    end
    if k>16 && k<=19
        jj = jj + 1;
    end
    if k>19 && k<=21
        ii = ii + 1;
    end
    if k>21 && k<=23
        jj = jj - 1;
    end
    if k==24
        ii = ii - 1;
    end
    if k==25
        jj = jj + 1;
    end
    X(ii,jj) = k;
end
disp(X);