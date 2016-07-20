%% Capítulo 1. Introducción a MATLAB

%% Número par / impar
% <matlab:edit('C1_Intro.m') MathWorks>
num=input('Número: ');
if mod(num,2)==0
    disp('Número par');
else
    disp('Número impar');
end

%% Número más grande de un vector
v=input('Vector: ');
maxv=v(1);
for i=1:length(v)
    if v(i)>maxv
        maxv=v(i);
    end
end