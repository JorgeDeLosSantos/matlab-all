function s = split(cad, delimiter)
% 'Partir' una cadena de caracteres utilizando un caracter
% como referencia.
%        
%    cad        -  Cadena de caracteres.
%    delimiter  -  Delimitador a utilizar.
%    s          -  Cell array de strings.
%
% $ (c) Jorge De Los Santos $
% $ Rev 1.0.0 $ $ 11/10/2014 $
% 
if nargin==1
    % Usar espacio como delimitador en caso
    % de no especifarse de forma explícita.
    delimiter=' ';
end
if isnumeric(cad)
    % Hacer la conversión si se tiene una entrada numérica
    cad=num2str(cad);
end
remain=cad;
s={};
while true
    [str,remain]=strtok(remain, delimiter);
    if isempty(str),break;end;
    s=[s str];
end
end