function n = npalabras(cad)
if ~isa(cad,'char')
    error('Introduzca un argumento de tipo char');
end
eb=nnz(cad==' ');
n=eb+1;
end