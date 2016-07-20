function r = esvocal(car)
if ~isa(car,'char') || length(car)~=1
    error('Por favor verifique los argumentos de entrada');
end
switch car
    case {'a','e','i','o','u'}
        r=true;
    otherwise 
        r=false;
end
end