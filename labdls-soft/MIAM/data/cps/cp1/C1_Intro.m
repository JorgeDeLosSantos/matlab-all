%% Cap�tulo 1. Introducci�n a MATLAB

%% N�mero par / impar
% <matlab:edit('C1_Intro.m') MathWorks>
num=input('N�mero: ');
if mod(num,2)==0
    disp('N�mero par');
else
    disp('N�mero impar');
end

%% N�mero m�s grande de un vector
v=input('Vector: ');
maxv=v(1);
for i=1:length(v)
    if v(i)>maxv
        maxv=v(i);
    end
end