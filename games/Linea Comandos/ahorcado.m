clear all;clc;
D=load('descri.mat');
C=load('palabras.mat');
cad=C.C{randi([1,3])};
for i=1:length(cad)
    aux{i}='_';
end
disp(aux);
N=1;
while N<5
    letra=input('Inserte una letra: ','s');
    Comp=strcmpi(letra,cad);
    for i=1:length(Comp)
        if Comp(i)==1
            aux{i}=cad{i};
        end
    end
    disp(aux)
    N=N+1;
end