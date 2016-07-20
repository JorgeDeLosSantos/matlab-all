clear all;clc;
N=randi([1,100]);
A=input('El número dado es ... ');
i=1;
while A~=N
    fprintf('Intenta nuevamente!!!\n');
    A=input('El número dado es ... ');
    if abs(A-N)<10
        fprintf('\nMuy cerca, ');
    elseif abs(A-N)>10 & abs(A-N)<20
        fprintf('\nCerca, ');
    elseif abs(A-N)>20
        fprintf('\nLejos, ');
    end
    i=i+1;
end
fprintf('\nMuy bien, has acertado en %g intentos\n',i);