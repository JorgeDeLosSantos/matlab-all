clear all;clc;
sel=input('Seleccione una opción: \n1. Juego nuevo \n2. Ver puntuaciones altas\n\n');
clc;
if sel==1
    Nombre=input('Nombre: ','s');
    fprintf('Bienvenido %s el juego comienza ahora...',Nombre);
    pause(1);
    clc;
    Op=load('oper.mat');
    Oper=Op.O;
    k=1;
    tic;
    while k<=length(Oper)
        comp=input(sprintf('%s = ',Oper{k}));
        if comp==str2num(Oper{k})
            k=k+1;
        else
            disp('Respuesta incorrecta, intenta nuevamente...');
        end
    end
    tiempo=toc;
    Punt_Act=(1/tiempo)*100;
    A=load('puntos.mat');
    puntos=A.puntos;
    k=1;
    while k<=size(puntos,1)
        if Punt_Act>str2double(puntos{k,2})
            for i=size(puntos,1):-1:k+1
                puntos{i,1}=puntos{i-1,1};
                puntos{i,2}=puntos{i-1,2};
            end
            puntos{k,2}=num2str(Punt_Act);
            puntos{k,1}=Nombre;
            break;
        end
        k=k+1;
    end
    fprintf('Has obtenido %.4f puntos\n\n',Punt_Act);
    save('puntos.mat','puntos');
elseif sel==2
    p=load('puntos.mat');
    disp('||| Puntuaciones altas |||');
    disp(p.puntos);
else
    warning('Opción incorrecta');
end