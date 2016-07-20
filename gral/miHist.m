clear all;clc;
A=input('Inserte un vector: ');
for i=1:length(A)
    aux(1:A(i))='*';
    fprintf('%s\n',aux);
    clear aux
end