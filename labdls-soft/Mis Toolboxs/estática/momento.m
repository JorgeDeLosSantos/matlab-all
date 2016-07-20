function M=momento(R,F)
% Calcula el momento o torque de una fuerza
% Datos de entrada:
%       F  -  Vector fuerza
%       R  -  Vector de posición
% $ Por: Jorge De Los Santos $
% $ Rev 1.0 $ $ 26/05/2014 $ 
M=cross(R,F);
end