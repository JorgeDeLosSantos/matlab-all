clear all;clc;
n=1299381;
L=1:n;
if nnz(rem(n,L)==0)==2
    disp('N�mero primo');
else
    disp('N�mero no primo');
end