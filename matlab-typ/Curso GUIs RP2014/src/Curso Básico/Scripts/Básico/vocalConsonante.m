% Determina si una letra es vocal o consonante
clear all;clc;
letra=input('Inserte una letra: ','s');
switch letra
    case {'a','e','i','o','u'}
        disp('Vocal');
    otherwise
        disp('Consonante');
end
