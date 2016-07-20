function tf = tipoFlujo(NR)
% Determina el tipo de flujo: laminar, turbulento o transitorio 
%   NR  - N�mero de Reynolds
%
if NR<2000
    tf='laminar';
elseif NR>2000 && NR<100000
    tf='transitorio';
else
    tf='turbulento';
end
end